require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "must name" do
user = User.new(firstname: "John",
email: "john.davidson@email.ie")
assert_equal(false, user.save, "saved the user even
though at least one of the firstname,
lastname and/or email were not provided!")
end
end
