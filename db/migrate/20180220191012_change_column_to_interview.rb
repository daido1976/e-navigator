class ChangeColumnToInterview < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :judgement, :integer, default: 0
  end
end
