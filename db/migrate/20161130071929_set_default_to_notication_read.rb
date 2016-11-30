class SetDefaultToNoticationRead < ActiveRecord::Migration[5.0]
  def change
    change_column :notifications, :read, :integer, :default => 0
  end
end
