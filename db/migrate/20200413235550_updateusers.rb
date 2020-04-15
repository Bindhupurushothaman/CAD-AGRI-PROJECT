class Updateusers < ActiveRecord::Migration[5.2]
  def change
  	@u = User.find_by( email: 'admincad@example.com' )
if @u != nil
@u.update_attribute :admin, true
end
  end
end
