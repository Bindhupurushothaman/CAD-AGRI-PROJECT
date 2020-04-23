require 'singleton'
class MyBill
include Singleton
def initialize
@bill = File.open("mybill.txt", "a")
end
def billInformation(information)
@bill.puts(information)
@bill.flush
end
end