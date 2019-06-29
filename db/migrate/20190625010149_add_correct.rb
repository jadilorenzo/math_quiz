class AddCorrect < ActiveRecord::Migration[5.2]
  def change
    add_column(:quizzes, :correct, :integer)
  end
end
