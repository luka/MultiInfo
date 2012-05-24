require "rubygems"
require 'httpclient'


module MultiInfo
  class API
    DEFAULT_CERT_FILE = 'multiinfo.crt'
    DEFAULT_KEY_FILE = 'multiinfo.pem'
   
    class FakeHttpResponse
       "test mode"
    end
   
    class Executor
      def initialize(authentication_hash, certificate_hash, debug=false, test_mode=false)
        @authentication_hash = authentication_hash
        @client_cert_file = { 
          :cert => certificate_hash[:client_cert] || File.join(DEFAULT_CONFIG_PATH, DEFAULT_CERT_FILE),
          :rsa_key  => certificate_hash[:client_key] || File.join(DEFAULT_CONFIG_PATH, DEFAULT_KEY_FILE)
        }
        @debug = debug
        @test_mode = test_mode
      
        allow_request_recording if @test_mode
      end
    
      def execute(command_name, parameters={})
        request_uri = command(command_name, parameters)
        puts "[debug] Executing command '#{command_name}': #{request_uri}" if @debug
        [command_name, get_response(request_uri)]
      end

      def in_test_mode?
        @test_mode
      end
    
      protected
      
      def command(command_name, parameters) 
        Command.new(command_name).with_params( parameters.merge(@authentication_hash) )
      end
    
      def get_response(uri)
        if in_test_mode?
          sms_requests << uri
          FakeHttpResponse.new
        else
          clnt = HTTPClient.new
          clnt.ssl_config.set_default_paths
          clnt.ssl_config.set_client_cert_file(@client_cert_file[:cert], @client_cert_file[:rsa_key])
          clnt.get_content(uri)    
        end
      end
        
      private
    
      def allow_request_recording
        class << self
          define_method :sms_requests do
            @sms_requests ||= []
          end
        end
      end    
      
    end  
     
  end
end