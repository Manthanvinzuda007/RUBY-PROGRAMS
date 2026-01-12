
# Define Class BankAccout
class BankAccount
  attr_reader :name
  attr_accessor :balance

  # Initialize method (Constructor) - If You Create a New Object Then This Call It
  def initialize(name, initial_balance = 0)
    @name = name
    @balance = initial_balance
    puts "\n--- Welcome, #{@name}! Your account is created. ---"
  end

  # Method Of Deposit Money 
  def deposit(amount)
    if amount > 0
      @balance += amount
      puts "Successfully deposited: ₹#{amount}"
    else
      puts "Invalid amount! Please enter a positive number."
    end
  end

  # Method Of Withdraw Money
  def withdraw(amount)
    if amount > 0 && amount <= @balance
      @balance -= amount
      puts "Successfully withdrawn: ₹#{amount}"
    elsif amount > @balance
      puts "Error: Insufficient balance!"
    else
      puts "Invalid amount!"
    end
  end

  # Method Of Check Balance 
  def check_balance
    puts "Current Balance: ₹#{@balance}"
  end
end

# --- Main Program Execution ---

print "Enter your name to open an account: "
user_name = gets.chomp

# Made Object For Open Account
my_account = BankAccount.new(user_name, 1000) # Opening balance 1000 rakhyu che

loop do
  puts "\n--- MENU ---"
  puts "1. Deposit Money"
  puts "2. Withdraw Money"
  puts "3. Check Balance"
  puts "4. Exit"
  print "Choose an option (1-4): "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter amount to deposit: "
    amount = gets.chomp.to_f
    my_account.deposit(amount)
  when 2
    print "Enter amount to withdraw: "
    amount = gets.chomp.to_f
    my_account.withdraw(amount)
  when 3
    my_account.check_balance
  when 4
    puts "Thank you for banking with us! Goodbye."
    break
  else
    puts "Invalid option! Please try again."
  end
end
