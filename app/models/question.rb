class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 40 }
  validates :question, presence: true, length: { minimum: 150 }
end
