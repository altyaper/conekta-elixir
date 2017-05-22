defmodule Mocks.PlansMock do
    @moduledoc false

    def get_plans_mock, do: {:ok, successful_plans_response()}


    def successful_plans_response() do
        %HTTPoison.Response{
            body: "{\"has_more\":false,\"total\":2,\"object\":\"list\",\"data\":[{\"id\":\"plan_2\",\"livemode\":false,\"created_at\":1495406544,\"name\":\"1 año\",\"amount\":2000,\"currency\":\"MXN\",\"interval\":\"year\",\"frequency\":1,\"object\":\"plan\"},{\"id\":\"plan_1\",\"livemode\":false,\"created_at\":1495403266,\"name\":\"Plan 3 Meses\",\"amount\":4000,\"currency\":\"MXN\",\"interval\":\"month\",\"frequency\":3,\"object\":\"plan\"}]}",
            headers: [{"Date", "Mon, 22 May 2017 03:36:02 GMT"},
            {"Content-Type", "application/json; charset=utf-8"},
            {"Content-Length", "364"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
            {"Cache-Control", "max-age=0, private, must-revalidate"},
            {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
            {"ETag", "\"342be85eebc53fef291e8632cecb99dd\""},
            {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
            {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
            {"X-Record-Count", "2"},
            {"X-Request-Id", "287f63cc-9fbb-4a7d-9974-096ca9b7fbc4"},
            {"X-Runtime", "0.030812"}, {"X-XSS-Protection", "1; mode=block"},
            {"Vary", "Accept-Encoding"}],
            status_code: 200}
    end
  
end