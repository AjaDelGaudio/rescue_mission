require 'rails_helper'
require 'capybara'
require 'spec_helper'

feature 'user edits a question', %(
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
) do
=begin
    Acceptance Criteria

  [X] I must provide valid information
  [X] I must be presented with errors if I fill out the form incorrectly
  [ ] I must be able to get to the edit page from the question details page
=end

scenario 'user navigates to edit page' do
  question_1 = FactoryGirl.create(:question)
  visit edit_question_path(question_1)

  expect(page).to have_content(question_1.title)
  expect(page).to have_content('Edit this Question!')

end

scenario 'user passes valid information to edit form' do
  question_1 = FactoryGirl.create(:question)
  visit edit_question_path(question_1)

  expect(page).to have_content(question_1.title)
  fill_in 'Title', with: "This is a new title!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  click_button 'Submit Edit'

  expect(page).to have_content("You have successfully edited this question!")
  expect(page).to have_content("This is a new title!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
end

scenario 'user passes invalid information to edit form' do
  question_1 = FactoryGirl.create(:question)
  visit edit_question_path(question_1)

  expect(page).to have_content(question_1.title)
  fill_in 'Title', with: "This is a shit title"
  click_button 'Submit Edit'

  expect(page).to have_content("Please fill out the field correctly!")
end

scenario 'user navigates to the edit page from the question detail page' do
  question_1 = FactoryGirl.create(:question)
  visit question_path(question_1)

  click_link 'Edit this Question'

  expect(page).to have_content('Edit this Question!')
end

end
