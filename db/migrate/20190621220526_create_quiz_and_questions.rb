class CreateQuizAndQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table(:quizzes) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    create_table(:questions) do |t|
      t.column(:x, :integer)
      t.column(:y, :integer)
      t.column(:operation, :string)
      t.column(:quiz_id, :integer)

      t.timestamps()
    end
  end
end
