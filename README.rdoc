= Polkomtel MultiInfo HTTPS API wrapped into Ruby library

This gem is Ruby interface to the Polkomtel's MultiInfo SMS gateway service, based on Luke Redpath's clickatel library
To use this gem, you will need an access to Polkomtel's MultiInfo service. You need user, password, sercvice_id and certificate for ssl connection.
Contact Polkomtel sales reps for info how to obtain acces to MultiInfo service.

== Basic Usage

You will need your Mutliinfo credentials and SSL certificate to use this library.

  require 'rubygems'
  require 'multiinfo'
  
  api = MultiInfo::API.new

  # Example api calls
  api.send_message('48661351024', 'Hello') # sends sms 'Hello' to 48 661 351 024 and returns message id
  api.message_info('22') # gets info about message with id 22
  

== Conifguration options

Default path for config file and certificate files is $HOME/multiinfo. You should place following files in that directory:
  multiinfo.yml # config file
  multiinfo.crt # certificate
  multiinfo.pem # RSA key
    
In multiinfo.yml you should specify at least:
  login
  password
  service_id

If you want to use different names for certificate files speciify them with FULL PATH in config file under:
  
  client_cert
  client_key

See example in config_example.yml


To load your custom config file use following code
  require 'rubygems'
  require 'multiinfo'
  
  config = MultiInfo::API.load_auth_options(CONFIG_FILE_FULL_PATH)
  api = MultiInfo::API.new(config)



