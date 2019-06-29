class Question < ActiveRecord::Base
  belongs_to :quiz
  default_scope { order(:created_at) }
end
