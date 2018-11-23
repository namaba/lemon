class AddInvitationalToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :invitational, :boolean, default: false, after: :status
  end
end
