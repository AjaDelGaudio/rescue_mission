require 'rails_helper'
require 'capybara'
require 'spec_helper'

feature 'user views the showpage of a question, and sees answers for the question', %(
As a user
I want to view the answers for a question
So that I can learn from the answer
) do
  # Acceptance Criteria
  #
  #   [X]I must be on the question detail page
  #   [X]I must only see answers to the question I'm viewing
  #   [X]I must see all answers listed in order, most recent last

  scenario 'user goes to a particular question page' do
    question_1 = FactoryGirl.create(:question)
    visit question_path(question_1)

    expect(page).to have_content("Question Page")
    expect(page).to have_content(question_1.title)

  end
  scenario 'user sees only the answers for the question he is viewing' do
    question_1 = FactoryGirl.create(:question)
    answer_1 = FactoryGirl.create(:answer, question: question_1)
    answer_2 = FactoryGirl.create(:answer, question: question_1)
    answer_3 = FactoryGirl.create(:answer, question: question_1)

    visit question_path(question_1)

    expect(page).to have_content(answer_1.description)
    expect(page).to have_content(answer_2.description)
    expect(page).to have_content(answer_3.description)

  end

  scenario 'user sees all the answers in order, most recent last' do
    question_1 = FactoryGirl.create(:question)
    answer_1 = FactoryGirl.create(:answer, question: question_1)
    answer_2 = FactoryGirl.create(:answer, question: question_1)
    answer_3 = FactoryGirl.create(:answer, question: question_1)

    visit question_path(question_1)

    expect(answer_1.created_at).to be < (answer_2.created_at)
    expect(page.text.index(answer_2.description)).to be > page.text.index(answer_1.description)
  end
end
