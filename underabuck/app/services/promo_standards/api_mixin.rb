module PromoStandards
  module ApiMixin
    def call_api
      ApiClient.new(
        PromoStandards::ApiArgs.new(
          api_name: api_name,
          vendor_settings: Settings.promostandards[@vendor.name],
          api_args: api_args,
          savon_client_args: savon_client_args
        )
      ).call
    end

    def api_name
      raise(ArgumentError, 'override me in parent')
    end

    def api_args
      {}
    end

    def savon_client_args
      { log: false }
    end
  end
end
