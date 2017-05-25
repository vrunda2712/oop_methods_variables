# require_relative 'exercise1.rb'

class BankAccount

  @@interest_rate = 0.01
  @@accounts = []

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    new_account
  end

  def self.total_funds
    total = 0

    @@accounts.each do |account|
      total += account.balance
    end
    total
  end

  def self.interest_time
    @@accounts.each do |account|
      account.balance += account.balance * @@interest_rate
    end
  end
end


my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance

puts BankAccount.total_funds
puts

my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance
puts your_account.balance
puts BankAccount.total_funds

BankAccount.interest_time
puts my_account.balance
puts your_account.balance
puts BankAccount.total_funds

my_account.withdraw(50)
puts my_account.balance
puts BankAccount.total_funds
