require 'rails-helper'

feature 'user views index', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others

  Acceptance Criteria

  [ ] I must see the title of each question
  [ ] I must see questions listed in order, most recently posted first
} do
  scenario 'user sees the title of each question' do
    question_1 = Question.new(title: "Aja and Me!", question: "Does this work?")

    visit '/'

    expect(page).to have_content(question_1.title)
  end
end
