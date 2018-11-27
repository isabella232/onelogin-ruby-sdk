module OneLogin
  module Api
    module Util
      module Parser
        def extract_error_message_from_response(response)
          message = ''
          content = JSON.parse(response.body)
          if content && content.has_key?('status')
            status = content['status']
            if status.has_key?('message')
              if status['message'].instance_of?(Hash)
                if status['message'].has_key?('description')
                  message = status['message']['description']
                end
              else
                message = status['message']
              end
            elsif status.has_key?('type')
              message = status['type']
            end
          end
          message
        end

        def extract_error_attribute_from_response(response)
          attribute = nil
          content = JSON.parse(response.body)
          if content && content.has_key?('status')
            status = content['status']
            if status.has_key?('message') && status['message'].instance_of?(Hash)
              if status['message'].has_key?('attribute')
                attribute = status['message']['attribute']
              end
            end
          end
          attribute
        end

      end
    end
  end
end