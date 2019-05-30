require 'pry'
require 'csv'

customers_file = '2013-2017-Camry-Campaign.csv'
customers_data =  Array.new

CSV.foreach(customers_file, headers: true, converters: :numeric) do |customer_data|
  if (customer_data["first_name"]=~ /[A-Za-z]/) && (customer_data["last_name"]=~ /[A-Za-z]/)
    customers_data << customer_data.to_h
  end
end

sorted_customers = customers_data[0...50].sort_by{ |customer_data| [-customer_data["Percentile"].to_i, -customer_data["last_name"]]}

target_customers = sorted_customers.map do |customer|
  puts "#{customer["Customer ID"]} #{customer["Percentile"]} #{customer["first_name"]} #{customer["last_name"]}"
end
