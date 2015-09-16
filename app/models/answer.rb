class Answer < ActiveRecord::Base
  belongs_to :question

  validates :question, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 50 }
end
