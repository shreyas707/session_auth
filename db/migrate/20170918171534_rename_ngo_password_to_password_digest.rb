class RenameNgoPasswordToPasswordDigest < ActiveRecord::Migration
  def change
  	remove_column :ngos, :password
  	add_column :ngos, :password_digest, :string
  end
end
