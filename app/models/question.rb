class Question < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :question, presence: true, length: { minimum: 1 }
end
