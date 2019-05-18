require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("Boom", "Urmec Worlf", "Geology")
s2 = Startup.new("Poof", "Urmec Worlf", "Micro-Botany")
s1.name=("Bang")

vc1 = VentureCapitalist.new("Michael Jordan", 3000000000)
vc2 = VentureCapitalist.new("Rick Fox", 10000000)

s1.sign_contract(vc2, "Angel", 1000)
s1.sign_contract(vc1, "Seed", 15000)
s2.sign_contract(vc1, "Angel", 20000)
s1.sign_contract(vc1, "Seed", -5000000)

puts
puts vc1.portfolio
puts
puts vc1.biggest_investment
puts
puts vc1.invested("Geology")
puts
puts s1.investors
puts
puts s1.big_investors
puts
puts s2.investors
puts
puts s2.big_investors

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
