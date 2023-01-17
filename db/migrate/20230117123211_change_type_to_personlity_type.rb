class ChangeTypeToPersonlityType < ActiveRecord::Migration[5.2]
  def change
    rename_column :question_options, :type, :personlity_type
  end
end
