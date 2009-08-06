module MultiInfo
  # This module provides the core implementation of the Clickatell
  # HTTP service.
  class API
    # Defaults for config file location
    DEFAULT_CONFIG_PATH = File.join(ENV['HOME'], 'multiinfo')
    DEFAULT_CONFIG_FILE = 'multiinfo.yml'
    
    attr_accessor :auth_options
    
    class << self      
      # Set to true to enable debugging (off by default)
      attr_accessor :debug_mode
      
      # Set to true to test message sending; this will not actually send 
      # messages but will collect sent messages in a testable collection. 
      # (off by default)
      attr_accessor :test_mode
      
      # Load credentials from config file 
      def load_auth_options(config_location = nil)                    
        config_file = File.open(config_location || File.join(DEFAULT_CONFIG_PATH, DEFAULT_CONFIG_FILE))
        auth_options = YAML.load(config_file).symbolize_keys
        raise MultiInfo::API::Error.new(-9999, 'Missing config params') if auth_options.only(:login, :password, :service_id).size != 3
        auth_options
      end
      
    end
    self.debug_mode = false
    self.test_mode = false
    
    # Creates a new API instance using the specified +auth_options+.
    # +auth_options+ is a hash containing :username, :password, :service_id and
    # optionally :client_cert, :client_key
    #
    def initialize(auth_options = nil)
      @auth_options = auth_options || self.class.load_auth_options       
    end
            
    # Sends a message +message_text+ to +recipient+. Recipient
    # number should have an international dialing prefix 
    def send_message(recipient, message_text, opts={})
      valid_options = opts.only(:valid_to, :deliv_notif_request).merge(service_id)
      response = execute_command( 'sendsms', {:text => message_text, :dest => recipient}.merge(valid_options) ) 
      parse_response(response)
    end


    # Sends a package of messages. Recipient
    # number should have an international dialing prefix 
    def send_package
      # todo
    end
      
    
    # Returns the status of a message. Use sms ID returned
    # from original send_message call.
    def message_info(sms_id)
      response = execute_command('infosms',  :sms_id => sms_id)
      parse_response(response)
    end

    # Returns the status of a package of messages. Use package id returned
    # from original send_package call.
    def package_info(package_id)
      response = execute_command('packageinfo',  :package_id => package_id)
      parse_response(response)      
    end

    # Returns the status of a message. Use sms ID returned
    # from original send_message call.
    def cancel_message(sms_id)
      response = execute_command('cancelsms',  :sms_id => sms_id)
      parse_response(response)
    end
    
    def get_message(opts={})
      valid_options = opts.only(:timeout).merge(service_id)
      response = execute_command('getsms', valid_options)
      parse_response(response)
    end
    
    def sms_requests #:nodoc:
      @sms_requests ||= []
    end

    protected      
      def execute_command(command_name, parameters={}) #:nodoc:
        executor = Executor.new(credentials, certificate, self.class.debug_mode, self.class.test_mode)
        result = executor.execute(command_name, parameters)
        
        (sms_requests << executor.sms_requests).flatten! if self.class.test_mode
        
        result
      end

      def parse_response(raw_response) #:nodoc:
        Response.parse(raw_response)
      end
      
      def credentials #:nodoc:
        @credenitals ||= @auth_options.only(:login, :password)
      end
    
      def certificate #:nodoc:
        @certificate ||= @auth_options.only(:client_cert, :client_key)        
      end
    
      def service_id #:nodoc:
        @service_id ||= @auth_options.only(:service_id)
      end
    
  end
end

%w( api/command
    api/error
    api/executor
    api/response
).each do |lib|
  require File.join(File.dirname(__FILE__), lib)
end
