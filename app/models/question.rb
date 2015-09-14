class Question < ActiveRecord::Base
  validates :title, presence: true
  validates :question, presence: true

end
