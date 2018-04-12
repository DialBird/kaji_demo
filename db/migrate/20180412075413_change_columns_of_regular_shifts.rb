class ChangeColumnsOfRegularShifts < ActiveRecord::Migration[5.1]
  def up
    remove_column :regular_shifts, :start
    remove_column :regular_shifts, :end
    add_column :regular_shifts, :start_at, :integer, null: false, default: 0, comment: '開始時刻（time_block.yml参照）'
    add_column :regular_shifts, :end_at, :integer, null: false, default: 0, comment: '開始時刻（time_block.yml参照）'
  end

  def down
    add_column :regular_shifts, :start, :string
    add_column :regular_shifts, :end, :string
    remove_column :regular_shifts, :start_at
    remove_column :regular_shifts, :end_at
  end
end
