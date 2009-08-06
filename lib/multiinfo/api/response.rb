module MultiInfo
  class API
  
  # Used to parse HTTP responses returned from MultiInfo API calls.
    class Response
      class << self
              
        # Returns the HTTP response body data as a hash.
        def parse(response_arr)
          return { :status => 'OK' } if API.test_mode
          command, http_response = response_arr
          response_rows = http_response.split(/\r\n|\n/)
          response_status, response_body = response_rows[0], response_rows[1..-1]
          if response_status.to_i < 0 
            raise MultiInfo::API::Error.new(response_status, response_body.first)
          else
            response_hash(command, response_body).merge({:status => response_status})
          end
        end
        
        private
        def response_hash(command, response)
          resp_hash = {}
          API_RESPONSES[command].each_with_index { |message_key, i| resp_hash[message_key] = response[i] }
          resp_hash
        end
        
        public
        API_RESPONSES = {
          # Hash keys for each response lines.
          # Line no 1 is skipped as it always is 'status'
          
          'sendsms'  => [
            :sms_id                # 2
          ],  
          
          'cancelsms' => [
            :cancel_status         # 2
          ],
          
          'infosms' => [
            :sms_id,               # 2
            :message_type,         # 3
            :message_body,         # 4
            :protocol_id,          # 5
            :coding_scheme,        # 6
            :service_id,           # 7
            :conector_id,          # 8
            :originator_sms_id,    # 9
            :priority,             # 10
            :send_date,            # 11
            :valid_to,             # 12
            :deliv_notif_request,  # 13
            :originator,           # 14
            :destination,          # 15
            :message_status,       # 16
            :status_date           # 17
          ],
          
          'packageinfo' => [
            :package_id,           # 2
            :sent_message_count,   # 3
            :waiting_message_count,# 4
            :package_status        # 5
          ],
          
          'getsms' => [
            :sms_id,               # 2
            :sender,               # 3
            :destination,          # 4
            :message_type,         # 5
            :message_body,         # 6
            :protocol_id,          # 7
            :coding_scheme,        # 8
            :service_id,           # 9
            :conector_id,          # 9
            :receive_date          # 10            
          ]
          
        }
        
      end

    end
  end
end