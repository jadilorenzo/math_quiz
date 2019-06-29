class AddSolution < ActiveRecord::Migration[5.2]
  def change
    add_column(:questions, :solution, :integer)
  end
end
