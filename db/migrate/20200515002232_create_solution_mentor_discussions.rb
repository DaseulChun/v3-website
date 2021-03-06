class CreateSolutionMentorDiscussions < ActiveRecord::Migration[6.0]
  def change
    create_table :solution_mentor_discussions do |t|
      t.belongs_to :solution, foreign_key: true, null: false
      t.belongs_to :mentor, foreign_key: {to_table: :users}, null: false
      t.belongs_to :request, foreign_key: {to_table: :solution_mentor_requests}, null: false

      t.timestamps
    end
  end
end
