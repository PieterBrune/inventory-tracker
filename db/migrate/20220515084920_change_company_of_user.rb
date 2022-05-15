class ChangeCompanyOfUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :company, :string
  end
end
