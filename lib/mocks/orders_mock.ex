defmodule Mocks.OrdersMock do
  @moduledoc false
  def get_mock, do: {:ok, successful_response()}
  def get_new_order_response, do: {:ok, successful_new_order_response()}
  def get_find_order_response, do: {:ok, successful_find_order_response()}
  def get_charges_order_response, do: {:ok, successful_charges_order_response()}

  defp successful_charges_order_response do
    %HTTPoison.Response{
      body:
        "{\"has_more\":false,\"object\":\"list\",\"data\":[{\"id\":\"59229df6ffecf902c00cccfd\",\"livemode\":false,\"created_at\":1495440886,\"currency\":\"MXN\",\"device_fingerprint\":\"5BPc6nDxD9aoEzMKJSJUpzmNL37SjEBD\",\"payment_method\":{\"name\":\"Jorge Lopez\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"auth_code\":\"308638\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"1881\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":34,\"fraud_indicators\":[]},\"object\":\"charge\",\"status\":\"paid\",\"amount\":1500,\"paid_at\":1495440893,\"fee\":341,\"customer_id\":\"cus_2gZSnQGNwsSKR7c1V\",\"order_id\":\"ord_2gZSnR1CU4zy3PGVz\"}]}",
      headers: [
        {"Date", "Mon, 22 May 2017 10:00:39 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Content-Length", "591"},
        {"Connection", "keep-alive"},
        {"Server", "Apache"},
        {"Cache-Control", "max-age=0, private, must-revalidate"},
        {"Conekta-Media-Type", "conekta-v2.0.0; format=json"},
        {"ETag", "\"193bdabaed522f889f85befae286a9e8\""},
        {"Strict-Transport-Security", "max-age=31536000; includeSubDomains"},
        {"X-Content-Type-Options", "nosniff"},
        {"X-Frame-Options", "SAMEORIGIN"},
        {"X-Request-Id", "f58aa17d-a791-4b57-8288-ea5fb1d05acc"},
        {"X-Runtime", "0.274542"},
        {"X-XSS-Protection", "1; mode=block"},
        {"Vary", "Accept-Encoding"}
      ],
      status_code: 200
    }
  end

  defp successful_find_order_response do
    %HTTPoison.Response{
      body:
        "{\"livemode\":false,\"amount\":2000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"jorge@pruebas.com\",\"name\":\"Random Name\",\"corporate\":false,\"customer_id\":\"cus_2gZKFPPYzE7d7Qeu4\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gZKFPPYzE7d7Qeu9\",\"metadata\":{},\"created_at\":1495406552,\"updated_at\":1495406585,\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"592217d8edbb6e17da90597c\",\"livemode\":false,\"created_at\":1495406552,\"currency\":\"MXN\",\"device_fingerprint\":\"w4WDAvx7cRJqhPVza5PXNjBZW5QcnjGK\",\"payment_method\":{\"name\":\"Jorge Lopez\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"auth_code\":\"943969\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"1881\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":34,\"fraud_indicators\":[]},\"object\":\"charge\",\"status\":\"paid\",\"amount\":2000,\"paid_at\":1495406559,\"fee\":357,\"customer_id\":\"cus_2gZKFPPYzE7d7Qeu4\",\"order_id\":\"ord_2gZKFPPYzE7d7Qeu9\"}]}}",
      headers: [
        {"Server", "nginx"},
        {"Date", "Thu, 21 Jul 2016 16:52:38 GMT"},
        {"Content-Type", "application/json"},
        {"Content-Length", "397"},
        {"Connection", "keep-alive"},
        {"Keep-Alive", "timeout=10"},
        {"Vary", "Accept-Encoding"},
        {"Vary", "Accept-Encoding"},
        {"X-UA-Compatible", "IE=edge"},
        {"X-Frame-Options", "deny"},
        {"Content-Security-Policy",
         "default-src 'self'; script-src 'self' foo"},
        {"X-Content-Security-Policy",
         "default-src 'self'; script-src 'self' foo"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"},
        {"X-Content-Type-Options", "nosniff"},
        {"Strict-Transport-Security", "max-age=31536000;"}
      ],
      status_code: 200
    }
  end

  defp successful_new_order_response do
    %HTTPoison.Response{
      body:
        "{\"livemode\":false,\"amount\":35000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"jorge@test.com\",\"phone\":\"521234342345\",\"name\":\"Juan\",\"corporate\":false,\"customer_id\":\"cus_2gXnQrxEpkdNfeeFT\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gYytiLHqMUfZcBZ6\",\"metadata\":{},\"created_at\":1495318352,\"updated_at\":1495318359,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Testing\",\"unit_price\":35000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gYytiLHqMUfZcBZ4\",\"parent_id\":\"ord_2gYytiLHqMUfZcBZ6\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"5920bf50b795b03ad73384a9\",\"livemode\":false,\"created_at\":1495318352,\"currency\":\"MXN\",\"device_fingerprint\":\"ou2zfmjluaw63nfvhr847va8i19cesjv\",\"payment_method\":{\"name\":\"Jorge Chevez\",\"exp_month\":\"09\",\"exp_year\":\"19\",\"auth_code\":\"443085\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":34,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":35000,\"paid_at\":1495318359,\"fee\":1467,\"customer_id\":\"cus_2gXnQrxEpkdNfeeFT\",\"order_id\":\"ord_2gYytiLHqMUfZcBZ6\"}]}}",
      headers: [
        {"Server", "nginx"},
        {"Date", "Thu, 21 Jul 2016 16:52:38 GMT"},
        {"Content-Type", "application/json"},
        {"Content-Length", "397"},
        {"Connection", "keep-alive"},
        {"Keep-Alive", "timeout=10"},
        {"Vary", "Accept-Encoding"},
        {"Vary", "Accept-Encoding"},
        {"X-UA-Compatible", "IE=edge"},
        {"X-Frame-Options", "deny"},
        {"Content-Security-Policy",
         "default-src 'self'; script-src 'self' foo"},
        {"X-Content-Security-Policy",
         "default-src 'self'; script-src 'self' foo"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"},
        {"X-Content-Type-Options", "nosniff"},
        {"Strict-Transport-Security", "max-age=31536000;"}
      ],
      status_code: 200
    }
  end

  defp successful_response do
    %HTTPoison.Response{
      body:
        "{\"has_more\":false,\"total\":9,\"object\":\"list\",\"data\":[{\"livemode\":false,\"amount\":35000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"test@conekta.com\",\"name\":\"Jorge Chavez\",\"corporate\":true,\"customer_id\":\"cus_2gU1qB4F6EfYfJ6fz\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gU1qB1DZ6QmF34dp\",\"metadata\":{},\"created_at\":1494005763,\"updated_at\":1494005770,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Product 1\",\"unit_price\":35000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gU1qB1DZ6QmF34dn\",\"parent_id\":\"ord_2gU1qB1DZ6QmF34dp\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"590cb803dba34d2544bd3eb7\",\"livemode\":false,\"created_at\":1494005763,\"currency\":\"MXN\",\"device_fingerprint\":\"123456789abcdefghijkmnopqrstuv\",\"payment_method\":{\"name\":\"Jorge Lopez\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"auth_code\":\"785483\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":36,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":35000,\"paid_at\":1494005770,\"fee\":1467,\"customer_id\":\"cus_2gU1qB4F6EfYfJ6fz\",\"order_id\":\"ord_2gU1qB1DZ6QmF34dp\"}]}},{\"livemode\":false,\"amount\":35000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"test@conekta.com\",\"name\":\"Jorge Chavez\",\"corporate\":true,\"customer_id\":\"cus_2gTgNNCrGFjUkjtoA\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gTgPwkSpyXvT875n\",\"metadata\":{},\"created_at\":1493917205,\"updated_at\":1493917212,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Product 1\",\"unit_price\":35000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gTgPwkSpyXvT875k\",\"parent_id\":\"ord_2gTgPwkSpyXvT875n\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"590b5e15c835f07633c4d149\",\"livemode\":false,\"created_at\":1493917205,\"currency\":\"MXN\",\"device_fingerprint\":\"123456789abcdefghijkmnopqrstuv\",\"payment_method\":{\"name\":\"Jorge Lopez\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"auth_code\":\"708263\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":36,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":35000,\"paid_at\":1493917212,\"fee\":1467,\"customer_id\":\"cus_2gTgNNCrGFjUkjtoA\",\"order_id\":\"ord_2gTgPwkSpyXvT875n\"}]}},{\"livemode\":false,\"amount\":35000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"test@conekta.com\",\"name\":\"Jorge Chavez\",\"corporate\":true,\"customer_id\":\"cus_2gTgNNCrGFjUkjtoA\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gTgNNK8GYnQGkhUU\",\"metadata\":{},\"created_at\":1493917082,\"updated_at\":1493917088,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Product 1\",\"unit_price\":35000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gTgNNK8GYnQGkhUS\",\"parent_id\":\"ord_2gTgNNK8GYnQGkhUU\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"590b5d9aedbb6e394872b1a5\",\"livemode\":false,\"created_at\":1493917082,\"currency\":\"MXN\",\"device_fingerprint\":\"123456789abcdefghijkmnopqrstuv\",\"payment_method\":{\"name\":\"Jorge Lopez\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"auth_code\":\"016864\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":36,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":35000,\"paid_at\":1493917088,\"fee\":1467,\"customer_id\":\"cus_2gTgNNCrGFjUkjtoA\",\"order_id\":\"ord_2gTgNNK8GYnQGkhUU\"}]}},{\"livemode\":false,\"amount\":35000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"test@conekta.com\",\"name\":\"Jorge Chavez\",\"corporate\":true,\"customer_id\":\"cus_2gTgNCcCVfR2rkddf\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gTgNCfSxpDB1UPrF\",\"metadata\":{},\"created_at\":1493917068,\"updated_at\":1493917075,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Product 1\",\"unit_price\":35000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gTgNCfSxpDB1UPrD\",\"parent_id\":\"ord_2gTgNCfSxpDB1UPrF\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"590b5d8cdba34d253dbd003c\",\"livemode\":false,\"created_at\":1493917068,\"currency\":\"MXN\",\"device_fingerprint\":\"123456789abcdefghijkmnopqrstuv\",\"payment_method\":{\"name\":\"Jorge Lopez\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"auth_code\":\"440832\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":36,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":35000,\"paid_at\":1493917075,\"fee\":1467,\"customer_id\":\"cus_2gTgNCcCVfR2rkddf\",\"order_id\":\"ord_2gTgNCfSxpDB1UPrF\"}]}},{\"livemode\":false,\"amount\":10000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"echavez@nearsoft.com\",\"name\":\"Jorge Chávez\",\"corporate\":false,\"customer_id\":\"cus_2gSb5Q5Z2V6BoJH9U\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gSb5Q8oVe7B5EQp8\",\"metadata\":{},\"created_at\":1493628680,\"updated_at\":1493628688,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Jafo App\",\"unit_price\":10000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gSb5Q8oVe7B5EQp6\",\"parent_id\":\"ord_2gSb5Q8oVe7B5EQp8\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"5906f709dba34d3fe1701f75\",\"livemode\":false,\"created_at\":1493628681,\"currency\":\"MXN\",\"device_fingerprint\":\"7A7F4E90E47140A9AE48BC22C408292D\",\"payment_method\":{\"name\":\"Jorge Chávez\",\"exp_month\":\"08\",\"exp_year\":\"20\",\"auth_code\":\"260619\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":26,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":10000,\"paid_at\":1493628687,\"fee\":626,\"customer_id\":\"cus_2gSb5Q5Z2V6BoJH9U\",\"order_id\":\"ord_2gSb5Q8oVe7B5EQp8\"}]}},{\"livemode\":false,\"amount\":10000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"echavez@nearsoft.com\",\"name\":\"Random Name\",\"corporate\":false,\"customer_id\":\"cus_2gSb52j3PrnMdcKsT\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gSb53QcSuL2fyX2H\",\"metadata\":{},\"created_at\":1493628652,\"updated_at\":1493628659,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Jafo App\",\"unit_price\":10000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gSb53QcSuL2fyX2F\",\"parent_id\":\"ord_2gSb53QcSuL2fyX2H\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"5906f6ecc835f01ee3c75506\",\"livemode\":false,\"created_at\":1493628652,\"currency\":\"MXN\",\"device_fingerprint\":\"7A7F4E90E47140A9AE48BC22C408292D\",\"payment_method\":{\"name\":\"Random Name\",\"exp_month\":\"08\",\"exp_year\":\"20\",\"auth_code\":\"500321\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":26,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":10000,\"paid_at\":1493628659,\"fee\":626,\"customer_id\":\"cus_2gSb52j3PrnMdcKsT\",\"order_id\":\"ord_2gSb53QcSuL2fyX2H\"}]}},{\"livemode\":false,\"amount\":10000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"echavez@nearsoft.com\",\"name\":\"Random Name\",\"corporate\":false,\"customer_id\":\"cus_2gSb4KPAEhG2mP5St\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gSb4L4jHjoiRKySz\",\"metadata\":{},\"created_at\":1493628596,\"updated_at\":1493628603,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Jafo App\",\"unit_price\":10000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gSb4L4jHjoiRKySx\",\"parent_id\":\"ord_2gSb4L4jHjoiRKySz\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"5906f6b4c835f01f01c74d37\",\"livemode\":false,\"created_at\":1493628596,\"currency\":\"MXN\",\"device_fingerprint\":\"7A7F4E90E47140A9AE48BC22C408292D\",\"payment_method\":{\"name\":\"Random Name\",\"exp_month\":\"08\",\"exp_year\":\"20\",\"auth_code\":\"508924\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":26,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":10000,\"paid_at\":1493628603,\"fee\":626,\"customer_id\":\"cus_2gSb4KPAEhG2mP5St\",\"order_id\":\"ord_2gSb4L4jHjoiRKySz\"}]}},{\"livemode\":false,\"amount\":35000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"echavez@nearsoft.com\",\"name\":\"Jorge Chavez\",\"corporate\":false,\"customer_id\":\"cus_2gSY8mhnoDKAmusaH\",\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gSY8nPMrFrqpH4FY\",\"metadata\":{},\"created_at\":1493615276,\"updated_at\":1493615283,\"line_items\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"name\":\"Jafo App\",\"unit_price\":35000,\"quantity\":1,\"object\":\"line_item\",\"id\":\"line_item_2gSY8nPMrFrqpH4FW\",\"parent_id\":\"ord_2gSY8nPMrFrqpH4FY\",\"metadata\":{},\"antifraud_info\":{}}]},\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"5906c2acc835f01edac74f6b\",\"livemode\":false,\"created_at\":1493615276,\"currency\":\"MXN\",\"device_fingerprint\":\"123456789abcdefghijkmnopqrstuv\",\"payment_method\":{\"name\":\"Jorge Lopez\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"auth_code\":\"721069\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4444\",\"brand\":\"mc\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"\",\"fraud_score\":36,\"fraud_indicators\":[]},\"object\":\"charge\",\"description\":\"Payment from order\",\"status\":\"paid\",\"amount\":35000,\"paid_at\":1493615283,\"fee\":1467,\"customer_id\":\"cus_2gSY8mhnoDKAmusaH\",\"order_id\":\"ord_2gSY8nPMrFrqpH4FY\"}]}},{\"livemode\":false,\"amount\":60000,\"currency\":\"MXN\",\"payment_status\":\"paid\",\"amount_refunded\":0,\"customer_info\":{\"email\":\"usuario@example.com\",\"name\":\"Jorge Chavez\",\"corporate\":false,\"object\":\"customer_info\"},\"object\":\"order\",\"id\":\"ord_2gSXq9zsiSVaYbDNL\",\"metadata\":{},\"created_at\":1493613891,\"updated_at\":1493613899,\"charges\":{\"object\":\"list\",\"has_more\":false,\"total\":1,\"data\":[{\"id\":\"5906bd43edbb6e4ed0a070e5\",\"livemode\":false,\"created_at\":1493613891,\"currency\":\"MXN\",\"device_fingerprint\":\"Bq6UW9MFqQvxwcVSbVc7XUUYpEL8KTGJ\",\"payment_method\":{\"name\":\"Jorge Lopez\",\"exp_month\":\"12\",\"exp_year\":\"19\",\"auth_code\":\"164626\",\"object\":\"card_payment\",\"type\":\"credit\",\"last4\":\"4242\",\"brand\":\"visa\",\"issuer\":\"\",\"account_type\":\"\",\"country\":\"US\",\"fraud_score\":36,\"fraud_indicators\":[]},\"object\":\"charge\",\"status\":\"paid\",\"amount\":60000,\"paid_at\":1493613898,\"fee\":2308,\"customer_id\":\"cus_2gSXq9zsiSVaYbDNF\",\"order_id\":\"ord_2gSXq9zsiSVaYbDNL\"}]}}]}",
      headers: [
        {"Server", "nginx"},
        {"Date", "Thu, 21 Jul 2016 16:52:38 GMT"},
        {"Content-Type", "application/json"},
        {"Content-Length", "397"},
        {"Connection", "keep-alive"},
        {"Keep-Alive", "timeout=10"},
        {"Vary", "Accept-Encoding"},
        {"Vary", "Accept-Encoding"},
        {"X-UA-Compatible", "IE=edge"},
        {"X-Frame-Options", "deny"},
        {"Content-Security-Policy",
         "default-src 'self'; script-src 'self' foo"},
        {"X-Content-Security-Policy",
         "default-src 'self'; script-src 'self' foo"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"},
        {"X-Content-Type-Options", "nosniff"},
        {"Strict-Transport-Security", "max-age=31536000;"}
      ],
      status_code: 200
    }
  end
end
