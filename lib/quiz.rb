class Quiz < ActiveRecord::Base
  has_many :questions
  default_scope { order(:created_at) }
end
