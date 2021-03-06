class OrderDataService
  def self.send_order(order)
    total_value = order.total_value * order.rate
    json_data = {
      order_code: order.code,
      client: {
        registration_number: order.customer.registration_number
      },
      transaction_total_value: total_value.to_d,
      rate_used: order.rate
    }.to_json
    Faraday.post('http://localhost:4000/api/v1/orders', json_data, content_type: 'application/json')
  rescue Faraday::ConnectionFailed
    nil
  end
end
