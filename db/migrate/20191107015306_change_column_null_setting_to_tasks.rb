class ChangeColumnNullSettingToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :title, false
    change_column_null :tasks, :description, false
    change_column_null :tasks, :start_time, false
    change_column_null :tasks, :end_time, false
  end
end
