defmodule Mocks.CustomersMock do
    @moduledoc false
    def get_mock, do: {:ok, successful_response()}
    def get_new_customer_response, do: {:ok, successful_new_customer_response()}
    def get_delete_customer_response, do: {:ok, successful_delete_customer_response()}
    def get_update_customer_response, do: {:ok, successful_update_customer_response()}
    def get_subscription_customer_response, do: {:ok, successful_subscription_customer_response()}
    def get_payment_sources_customer_response, do: {:ok, successful_payment_sources_customer_response()}
    def get_shipping_contacts_customer_response, do: {:ok, successful_shipping_contacts_customer_response()}
    def get_create_payment_source_customer_response, do: {:ok, successful_create_payment_source_customer_response()}
    def get_delete_payment_source_customer_response, do: {:ok, successful_delete_payment_source_customer_response()}
    def get_create_shipping_contact_customer_response, do: {:ok, successful_create_shipping_contact_customer_response()}
    def get_update_shipping_contact_customer_response, do: {:ok, successful_update_shipping_contact_customer_response()}
    def get_delete_shipping_contact_customer_response, do: {:ok, successful_delete_shipping_contact_customer_response()}

    defp successful_delete_shipping_contact_customer_response do
        %HTTPoison.Response{body: "{\"receiver\":\"Jorge Receiver\",\"phone\":\"6141179192\",\"between_streets\":\"Jose Maria y Pedro Dominguez\",\"address\":{\"street1\":\"Hacienda\",\"street2\":\"Hacienda\",\"city\":\"Chihuahua\",\"state\":\"Chihuahua\",\"residential\":true,\"object\":\"shipping_address\",\"postal_code\":\"31140\"},\"id\":\"ship_cont_2gZiUwFmAvZMNSkDV\",\"object\":\"shipping_contact\",\"created_at\":1495512419,\"parent_id\":\"cus_2gZfB4cFxmJDSyYRu\",\"default\":true,\"deleted\":true}",
         headers: [{"Date", "Tue, 23 May 2017 04:30:48 GMT"},
          {"Content-Type", "application/json; charset=utf-8"},
          {"Content-Length", "414"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
          {"Cache-Control", "max-age=0, private, must-revalidate"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
          {"ETag", "\"c24b61e903f73b8e53c983baec7cf715\""},
          {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
          {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
          {"X-Request-Id", "366a4f98-6467-4424-b8dc-9c4f454c38b1"},
          {"X-Runtime", "0.062998"}, {"X-XSS-Protection", "1; mode=block"},
          {"Vary", "Accept-Encoding"}], status_code: 200}
    end

    defp successful_update_shipping_contact_customer_response do
        %HTTPoison.Response{body: "{\"receiver\":\"Jorge Receiver\",\"phone\":\"6141179192\",\"between_streets\":\"Jose Maria y Pedro Dominguez\",\"address\":{\"street1\":\"Hacienda\",\"street2\":\"Hacienda\",\"city\":\"Chihuahua\",\"state\":\"Chihuahua\",\"residential\":true,\"object\":\"shipping_address\",\"postal_code\":\"31140\"},\"id\":\"ship_cont_2gZiUwFmAvZMNSkDV\",\"object\":\"shipping_contact\",\"created_at\":1495512419,\"parent_id\":\"cus_2gZfB4cFxmJDSyYRu\",\"default\":true}",
         headers: [{"Date", "Tue, 23 May 2017 04:15:13 GMT"},
          {"Content-Type", "application/json; charset=utf-8"},
          {"Content-Length", "399"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
          {"Cache-Control", "max-age=0, private, must-revalidate"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
          {"ETag", "\"ff4e4d79c14170365aefb8f825b1b2fd\""},
          {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
          {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
          {"X-Request-Id", "1ca1bcc8-4d32-4c1e-a6d3-3ba2a5056fe4"},
          {"X-Runtime", "0.060003"}, {"X-XSS-Protection", "1; mode=block"},
          {"Vary", "Accept-Encoding"}], status_code: 200}
    end

    defp successful_create_shipping_contact_customer_response do
      %HTTPoison.Response{body: "{\"receiver\":\"Jorge Receiver\",\"phone\":\"6141179192\",\"between_streets\":\"Jose Maria y Pedro Dominguez\",\"address\":{\"street1\":\"Hacienda\",\"residential\":true,\"object\":\"shipping_address\",\"postal_code\":\"31140\"},\"id\":\"ship_cont_2gZZUHLY5yz7tetRe\",\"object\":\"shipping_contact\",\"created_at\":1495471358,\"parent_id\":\"cus_2gZSnQGNwsSKR7c1V\",\"default\":false}",
       headers: [{"Date", "Mon, 22 May 2017 16:42:38 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Content-Length", "340"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
        {"Cache-Control", "max-age=0, private, must-revalidate"},
        {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
        {"ETag", "\"c1c4dc7a65f6ee0185e4c9b930d41635\""},
        {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
        {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
        {"X-Request-Id", "cb4d77ea-5f37-4f68-acde-0619c5e1d75b"},
        {"X-Runtime", "0.086365"}, {"X-XSS-Protection", "1; mode=block"},
        {"Vary", "Accept-Encoding"}], status_code: 200}
    end

    defp successful_delete_payment_source_customer_response do
        %HTTPoison.Response{body: "{\"id\":\"src_2gZSnQGNwsSKR7c1X\",\"object\":\"payment_source\",\"type\":\"card\",\"created_at\":1495440885,\"last4\":\"1881\",\"bin\":\"401288\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"brand\":\"VISA\",\"name\":\"Jorge Lopez\",\"parent_id\":\"cus_2gZSnQGNwsSKR7c1V\",\"default\":true,\"deleted\":true}",
         headers: [{"Date", "Mon, 22 May 2017 16:03:43 GMT"},
          {"Content-Type", "application/json; charset=utf-8"},
          {"Content-Length", "259"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
          {"Cache-Control", "max-age=0, private, must-revalidate"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
          {"ETag", "\"a80df6d212a3bca121db7eda68978e29\""},
          {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
          {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
          {"X-Request-Id", "0b4bef9d-ca45-4dfe-8db3-35dbac5517ac"},
          {"X-Runtime", "0.060008"}, {"X-XSS-Protection", "1; mode=block"},
          {"Vary", "Accept-Encoding"}], status_code: 200}
    end

    defp successful_create_payment_source_customer_response do
        %HTTPoison.Response{body: "{\"id\":\"src_2gZYnGyQbPmCH8hdB\",\"object\":\"payment_source\",\"type\":\"card\",\"created_at\":1495468215,\"last4\":\"4242\",\"bin\":\"424242\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"brand\":\"VISA\",\"name\":\"Jorge Lopez\",\"parent_id\":\"cus_2gZSnQGNwsSKR7c1V\",\"default\":false}",
         headers: [{"Date", "Mon, 22 May 2017 15:50:15 GMT"},
          {"Content-Type", "application/json; charset=utf-8"},
          {"Content-Length", "245"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
          {"Cache-Control", "max-age=0, private, must-revalidate"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
          {"ETag", "\"8b0a7f5b4e78381440d9008a26ac0a01\""},
          {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
          {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
          {"X-Request-Id", "56a69073-d3de-4e5c-969d-ef6cc2872d9d"},
          {"X-Runtime", "0.069266"}, {"X-XSS-Protection", "1; mode=block"},
          {"Vary", "Accept-Encoding"}], status_code: 200}
    end

    defp successful_shipping_contacts_customer_response do
        %HTTPoison.Response{body: "{\"has_more\":false,\"total\":1,\"object\":\"list\",\"data\":[{\"id\":\"src_2gZSnQGNwsSKR7c1X\",\"object\":\"payment_source\",\"type\":\"card\",\"created_at\":1495440885,\"last4\":\"1881\",\"bin\":\"401288\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"brand\":\"VISA\",\"name\":\"Jorge Lopez\",\"parent_id\":\"cus_2gZSnQGNwsSKR7c1V\",\"default\":true}]}",
        headers: [{"Date", "Mon, 22 May 2017 08:26:38 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Content-Length", "283"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
        {"Cache-Control", "max-age=0, private, must-revalidate"},
        {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
        {"ETag", "\"58fb6753b212178e65330fa071d6da25\""},
        {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
        {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
        {"X-Request-Id", "4302b608-f86e-45f9-a32e-60d0be6c3493"},
        {"X-Runtime", "0.032998"}, {"X-XSS-Protection", "1; mode=block"},
        {"Vary", "Accept-Encoding"}], status_code: 200}
    end

    defp successful_payment_sources_customer_response do
        %HTTPoison.Response{body: "{\"has_more\":false,\"total\":1,\"object\":\"list\",\"data\":[{\"id\":\"src_2gZSnQGNwsSKR7c1X\",\"object\":\"payment_source\",\"type\":\"card\",\"created_at\":1495440885,\"last4\":\"1881\",\"bin\":\"401288\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"brand\":\"VISA\",\"name\":\"Jorge Lopez\",\"parent_id\":\"cus_2gZSnQGNwsSKR7c1V\",\"default\":true}]}",
         headers: [{"Date", "Mon, 22 May 2017 08:26:38 GMT"},
          {"Content-Type", "application/json; charset=utf-8"},
          {"Content-Length", "283"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
          {"Cache-Control", "max-age=0, private, must-revalidate"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
          {"ETag", "\"58fb6753b212178e65330fa071d6da25\""},
          {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
          {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
          {"X-Request-Id", "4302b608-f86e-45f9-a32e-60d0be6c3493"},
          {"X-Runtime", "0.032998"}, {"X-XSS-Protection", "1; mode=block"},
          {"Vary", "Accept-Encoding"}], status_code: 200}
    end

    defp successful_subscription_customer_response() do
        %HTTPoison.Response{body: "{\"id\":\"sub_2gZSnQGNwsSKR7c1Y\",\"status\":\"active\",\"object\":\"subscription\",\"created_at\":1495440885,\"subscription_start\":1495440886,\"billing_cycle_start\":1495440876,\"billing_cycle_end\":1498119276,\"plan_id\":\"plan_1\",\"customer_id\":\"cus_2gZSnQGNwsSKR7c1V\",\"card_id\":\"src_2gZSnQGNwsSKR7c1X\"}",
         headers: [{"Date", "Mon, 22 May 2017 08:26:38 GMT"},
          {"Content-Type", "application/json; charset=utf-8"},
          {"Content-Length", "283"}, {"Connection", "keep-alive"}, {"Server", "Apache"},
          {"Cache-Control", "max-age=0, private, must-revalidate"},
          {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
          {"ETag", "\"58fb6753b212178e65330fa071d6da25\""},
          {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
          {"X-Content-Type-Options", "nosniff"}, {"X-Frame-Options", "SAMEORIGIN"},
          {"X-Request-Id", "4302b608-f86e-45f9-a32e-60d0be6c3493"},
          {"X-Runtime", "0.032998"}, {"X-XSS-Protection", "1; mode=block"},
          {"Vary", "Accept-Encoding"}], status_code: 200}
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

    defp successful_delete_customer_response do
        %HTTPoison.Response{
          body: "{\"livemode\":false,\"name\":\"Jorge Chavez\",\"email\":\"jorge@test.com\",\"phone\":\"521234567890\",\"id\":\"cus_2gXHiqgGWMk8ski6t\",\"object\":\"customer\",\"created_at\":1494871026,\"corporate\":false,\"deleted\":true}",
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

    defp successful_update_customer_response do
        %HTTPoison.Response {
            body: "{\"livemode\":false,\"name\":\"Juan Perez\",\"email\":\"edited@test.com\",\"id\":\"cus_2gYfQ9Pzfic158LXV\",\"object\":\"customer\",\"created_at\":1495234088,\"corporate\":false}",
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
