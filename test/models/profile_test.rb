require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "must provide name" do
profile = Profile.new(firstname: "David",
email: "david.son@email.ie")
assert_equal(false, profile.save, "saved the user even
though at least one of the firstname,
lastname and/or email were not provided!")
end
test "must allow only letters in firstname and lastname" do
profile = Profile.new(firstname: "David",
lastname: "son",
email: "david.son@email.ie")
assert_equal(false, profile.save, "saved the user even
though name contains non-letters!")
end
end
