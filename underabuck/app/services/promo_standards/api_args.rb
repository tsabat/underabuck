module PromoStandards
  class ApiArgs
    include ActiveSupport

    attr_reader :api_args
    attr_reader :savon_client_args
    delegate :function, to: :vendor_details

    def initialize(api_name:, vendor_settings:, api_args:, savon_client_args:)
      @api_name = api_name
      @vendor_settings = vendor_settings
      @api_args = api_args
      @savon_client_args = savon_client_args

      add_namespace_to_api_args
      merge_savon_client_args
    end

    private

    def merge_savon_client_args
      @savon_client_args = savon_client_default_args.merge!(@savon_client_args)
    end

    def wsdl
      "#{vendor_details.endpoint}/#{vendor_details.wsdl}"
    end

    def savon_client_default_args
      {
        wsdl: wsdl,
        log: false,
        log_level: :debug,
        pretty_print_xml: true,
        element_form_default: :qualified
      }
    end

    def add_namespace_to_api_args
      @api_args.merge!(api_default_args)
      @api_args = @api_args.each_with_object({}) do |vals, obj|
        obj[ns(vals[0])] = vals[1]
      end
    end

    def ns(key)
      "ins0:#{key}"
    end

    def vendor_details
      @vendor_settings[@api_name]
    end

    def api_default_args
      {
        'wsVersion' => vendor_details.version,
        'id' => @vendor_settings.id,
        'password' => @vendor_settings.password
      }
    end
  end
end
