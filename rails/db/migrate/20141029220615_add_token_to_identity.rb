class AddTokenToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :token, :string
  end
end
