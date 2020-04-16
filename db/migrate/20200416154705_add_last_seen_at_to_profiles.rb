class AddLastSeenAtToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :last_seen_at, :datetime
  end
end
