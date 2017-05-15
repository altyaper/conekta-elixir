defmodule HTTPoison.Response do
  defstruct body: nil, headers: nil, status_code: nil
end

defmodule Mocks.CustomersMock do

  def get_mock do
    {:ok, successful_response()}
  end

  def get_new_customer_response do
    {:ok, successful_new_customer_response()}
  end

  defp successful_response do
    %HTTPoison.Response{
      body: "{\"has_more\":false,\"total\":1,\"object\":\"list\",\"data\":[{\"livemode\":false,\"name\":\"Jorge Chavez\",\"email\":\"test@conekta.com\",\"id\":\"cus_2gU1qB4F6EfYfJ6fz\",\"object\":\"customer\",\"created_at\":1494005763,\"corporate\":true,\"default_payment_source_id\":\"src_2gU1qB4F6EfYfJ6g2\",\"payment_sources\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"src_2gU1qB4F6EfYfJ6g2\",\"object\":\"payment_source\",\"type\":\"card\",\"created_at\":1494005763,\"last4\":\"4242\",\"bin\":\"424242\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"brand\":\"VISA\",\"name\":\"Jorge Lopez\",\"parent_id\":\"cus_2gU1qB4F6EfYfJ6fz\",\"default\":true}]}}]}",
      headers: [{"Server", "nginx"}, {"Date", "Thu, 21 Jul 2016 16:52:38 GMT"},
        {"Content-Type", "application/json"}, {"Content-Length", "397"},
        {"Connection", "keep-alive"}, {"Keep-Alive", "timeout=10"},
        {"Vary", "Accept-Encoding"}, {"Vary", "Accept-Encoding"},
        {"X-UA-Compatible", "IE=edge"}, {"X-Frame-Options", "deny"},
        {"Content-Security-Policy",
          "default-src 'self'; script-src 'self' foo"},
        {"X-Content-Security-Policy",
          "default-src 'self'; script-src 'self' foo"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"}, {"X-Content-Type-Options", "nosniff"},
        {"Strict-Transport-Security", "max-age=31536000;"}],
        status_code: 200
    }
  end

  defp successful_new_customer_response do
    %HTTPoison.Response{
      body: "{\"livemode\":false,\"name\":\"Jorge Perez\",\"email\":\"jorge@test.com\",\"id\":\"cus_2gXLaVPg9gLoxGeKs\",\"object\":\"customer\",\"created_at\":1494884040,\"corporate\":false}",
      headers: [{"Date", "Mon, 15 May 2017 21:34:00 GMT"},
      {"Content-Type", "application/json; charset=utf-8"},
      {"Content-Length", "155"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
      {"Cache-Control", "max-age=0, private, must-revalidate"},
      {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
      {"ETag", "\"6b4f608308600d626bb1f49574f32e79\""},
      {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
      {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
      {"X-Request-Id", "6361e720-3ca2-4a5b-95cd-589027efa165"},
      {"X-Runtime", "0.271839"}, {"X-XSS-Protection", "1; mode=block"},
      {"Vary", "Accept-Encoding"}],
      status_code: 200
    }
  end


end
