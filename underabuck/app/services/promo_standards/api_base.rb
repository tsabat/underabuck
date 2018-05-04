module PromoStandards
  class ApiBase
    attr_reader :wsdl_path

    def initialize(id:, password:, wsdl_path:, ws_version:, args: {})
      @id = id
      @password = password
      @wsdl_path = wsdl_path
      @ws_version = ws_version

      @args = default_args.merge!(args)
    end

    def call(function:, message_args: {})
      final_message_args = {
        ns('wsVersion') => @ws_version,
        ns('id') => @id,
        ns('password') => @password
      }.merge!(merged_message_args(message_args))

      client.call(function) do
        message(final_message_args)
      end
    end

    def merged_message_args(message_args)
      message_args.each_with_object({}) do |vals, obj|
        obj[ns(vals[0])] = vals[1]
      end
    end

    private

    def ns(key)
      "shar:#{key}"
    end

    def client
      Savon.client(args) do
        convert_request_keys_to :lower_camelcase
        namespaces 'xmlns:shar' => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/'
      end
    end

    def override_error
      raise(ArgumentError, 'override required in child')
    end

    def default_args
      {
        wsdl: wsdl_path,
        log: false,
        log_level: :debug,
        pretty_print_xml: true,
        element_form_default: :qualified
      }
    end
  end
end
