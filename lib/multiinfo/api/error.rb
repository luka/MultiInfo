module MultiInfo
  class API
  
    # MultiInfo API Error exception.
    class Error < StandardError
      attr_reader :code, :message
      
      def initialize(code, message)
        @code, @message = code, message
      end
      
      # Creates a new Error from a MultiInfo HTTP response string
      # e.g.:
      #
      #  Error.parse("ERR: 001, Authentication error")
      #  # =>  #<MultiInfo::API::Error code='001' message='Authentication error'>
      def self.parse(error_arr)
        code, message = error_arr
        self.new(code, message)
      end
    end
  
  end
end