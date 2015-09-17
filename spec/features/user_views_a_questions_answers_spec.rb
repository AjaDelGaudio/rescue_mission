require 'rails_helper'
require 'capybara'
require 'spec_helper'

feature 'user views the showpage of a question, and sees answers for the Q', %(
As a user
I want to view the answers for a question
So that I can learn from the answer
) do
  # Acceptance Criteria
  #
  #   [ ]I must be on the question detail page
  #   [ ]I must only see answers to the question I'm viewing
  #   [ ]I must see all answers listed in order, most recent last

  scenario 'user goes to a particular question page' do
    question_1 = FactoryGirl.create(:question)
    visit question_path(question_1)

    expect(page).to have_content("Question Page")
    expect(page).to have_content(question_1.title)

  end

  scenario 'user sees only the answers for the question he is viewing' do
    question_1 = FactoryGirl.create(:question)
    visit question_path(question_1)


  end

  scenario 'user sees all the questions in order, most recent last' do


  end
end
