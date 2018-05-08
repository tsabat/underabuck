module PromoStandards
  class ApiClient
    attr_reader :api_args

    def initialize(api_args)
      @api_args = api_args
    end

    def call
      client.call(
        api_args.function.to_sym,
        message: api_args.api_args
      )
    end

    private

    def client
      Savon.client(api_args.savon_client_args) do
        convert_request_keys_to :lower_camelcase
      end
    end
  end
end
