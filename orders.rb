class Order
  attr_reader :email, :total, :state, :status

  @@customer_count = 0

  Tax_Table = {"CO" => 0.02, "MI" => 0.00, "AZ" => 0.04}
  @@TotalOrders = {}


  def initialize(email, state, total, status=:pending)
    @email = email
    @state = state
    @total = total
    @status = status
    @id = @@customer_count

    @@customer_count += 1
    @id = @@customer_count
    @@TotalOrders[@email] = @total

  end

  def tax
    total * Tax_Table[state]
  end

  def to_info
    "#{email} #{state} : $#{total} #{status}"
  end

  def customer_info
    "Email: #{email} State: #{state} Total: $#{total} Status: #{status} ID: #{@id}"
  end

  def self.customercount
    "You have #{@@customer_count} account(s) in the system."
  end

  def self.totals
    @@TotalOrders
  end

end

Riley = Order.new("info@riley.com", "CO", 476)
Howard = Order.new("info@howard.com", "MI", 1003)
Smith = Order.new("info@smith.com", "NY", 355)





puts Riley.email
puts Riley.customer_info
puts Howard.customer_info
puts Riley.to_info
puts Order.customercount

puts "Newsletter Emails:"

puts Riley.total + Howard.total
puts Order.totals

params = []

Order.totals.each do |email, total|
  params.push({email => total})
end

puts params
puts params[0]["info@riley.com"]

params.each do |x|
  puts "%%%% #{x}!"
end


newparams = params.map do |y|

  y.each do |x, z|
    puts "we are here"
    puts "#{x} ::: #{z + 100}"
  end

end

newparams = params.map do |y|

  y.each_value do |z|
    puts "we are here"
    puts "::: #{z + 100}"
  end

end

newparams = params.map do |y|

  y.each do |x, z|
    puts "we are here!!!!" if y.include? "info@riley.com"
    puts "value to string #{z.to_s}"
    #puts "we are here!!!!" if y = 476
    #puts "#{x} ::: #{z + 100}"
  end

end

newparams = params.map do |y|

  y.each(&:to_s)
  puts "hmmmm #{y}"


end

puts newparams
