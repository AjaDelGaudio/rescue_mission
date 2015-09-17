require 'rails_helper'
require 'capybara'
require 'spec_helper'


feature 'the user is able to delete a question', %(
As a user
I want to delete a question
So that I can delete duplicate questions
) do
#   Acceptance Criteria
#
#   [X] I must be able delete a question from the question edit page
#   [X] I must be able delete a question from the question details page
#   [ ] All answers associated with the question must also be deleted
#

  scenario 'the user is able to delete a question from the edit page' do
    question_1 = FactoryGirl.create(:question)
    answer_1 = FactoryGirl.create(:answer, question: question_1)
    answer_2 = FactoryGirl.create(:answer, question: question_1)

    visit edit_question_path(question_1)
    click_link 'Delete'

    expect(page).to_not have_content(question_1.title)

  end

  scenario 'the user is able to delete a question from the question show page' do
    question_1 = FactoryGirl.create(:question)
    answer_1 = FactoryGirl.create(:answer, question: question_1)
    answer_2 = FactoryGirl.create(:answer, question: question_1)

    visit question_path(question_1)
    click_link 'Delete'

    expect(page).to_not have_content(question_1.title)

  end

  scenario 'all the answers associated with the question are deleted' do
    question_1 = FactoryGirl.create(:question)
    answer_1 = FactoryGirl.create(:answer, question: question_1)
    answer_2 = FactoryGirl.create(:answer, question: question_1)
    @answer = question_1.answer


    expect(page).to_not have_content(question_1.answer)
    expect(page).to have_content('All answers deleted')
  end
end
