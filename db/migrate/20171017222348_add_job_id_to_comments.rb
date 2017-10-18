class AddJobIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :job, index: true, foreign_key: true
  end
end
