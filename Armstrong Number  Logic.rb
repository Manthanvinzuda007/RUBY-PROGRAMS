print "Enter a number: "
num = gets.to_i

digits = num.digits
power = digits.length

sum = 0
digits.each do |d|
  sum += d ** power
end

if sum == num
  puts "#{num} is an Armstrong Number"
else
  puts "#{num} is NOT an Armstrong Number"
end
