require 'rails_helper'
require 'capybara'
require 'spec_helper'


# feature 'the user is able to answer '
feature 'user can answer another users question', %(
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
 ) do
    #  Acceptance Criteria
     #
    #  [X] I must be on the question detail page
    #  [X] I must provide a description that is at least 50 characters long
    #  [X] I must be presented with errors if I fill out the form incorrectly)

  scenario 'user navigates to the question detail page' do
    question_1 = FactoryGirl.create(:question)
    visit question_path(question_1)

    expect(page).to have_content("Question Page")
    expect(page).to have_content(question_1.title)
  end

  scenario 'user submits a valid description' do
    question_1 = FactoryGirl.create(:question)
    visit question_path(question_1)

    answer_1 = FactoryGirl.create(:answer)
    #association  question its the trick for the factory girl
    #Date.today

    # binding.pry
    fill_in "Description", with: 'some desciption some desciption some desciption some desciption some desciption some desciption some desciption'
    click_button "Create Answer"
    expect(page).to have_content("You submitted an answer!")
  end

  scenario 'user submits an invalid description' do
    question_1 = FactoryGirl.create(:question)
    visit question_path(question_1)

    # answer_1 = FactoryGirl.create(:answer)

    # binding.pry
    fill_in "Description", with: "1 character"
    click_button "Create Answer"
    expect(page).to have_content("Please submit a correct answer")
  end
end
