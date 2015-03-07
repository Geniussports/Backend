class AddInviteAcceptedToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :invite_accepted, :boolean
  end
end
