require 'rails_helper'
require 'capybara'

feature 'user post a new question', %(
  As a user
  I want to post a question
  So that I can receive help from others
) do
  #   Acceptance Criteria
  #
  # [X] I must be able to get to this page from the questions index
  # [ ] I must provide a title that is at least 40 characters long
  # [ ] I must provide a description that is at least 150 characters long
  # [ ] I must be presented with errors if I fill out the form incorrectly

  scenario 'user navigates to the new page from the questions index' do

    visit '/questions'
    find_link('Post New Question')
    click_link('Post New Question')
  end

  scenario 'the user successfully visits the new page' do

    visit '/questions/new'
    expect(page).to have_content("Submit a Question!")

  end

  scenario "user submits a valid question" do
    visit 'questions/new'

    fill_in("Title", with: "What do you call a group of geese?")
    fill_in("Question", with: "Is it geese? Gooses? Help me!")
    click_button("Create Question")

    expect(page).to have_content("Question successfully posted!")
    expect(page).to have_content("Post New Question")
  end

  scenario "user submits a question without a title" do
    visit 'questions/new'

    fill_in("Question", with: "Something that we are asking with out a title")
    click_button("Create Question")

    expect(page).to have_content("Please submit the field correctly!")

  end

  scenario "user submits a question without a question" do
    visit 'questions/new'

    fill_in("Title", with: "Something that we are asking with out a question")
    click_button("Create Question")

    expect(page).to have_content("Please submit the field correctly!")

  end

  scenario "user submits a question with less than 150 characters" do
    visit 'questions/new'

    fill_in("Question", with: "Something that we are asking with less than 150 characters")
    click_button("Create Question")

    expect(page).to have_content("Please submit the field correctly!")

  end

  scenario "user submits a title with less than 40 characters" do
    visit 'questions/new'

    fill_in("Title", with: "Something that we are asking with a title of less than 40 characters")
    click_button("Create Question")

    expect(page).to have_content("Please submit the field correctly!")

  end



  # scenario 'the user is redirected to the questions page after submitting a form' do
  #
  #
  # end

  # scenario 'the user must provide a question that is at least 150 characters' do
  #   visit '/questions/new'
  #   fill_in('Question', with: '1234567890123456789012345678901234567890juu1234567890123456789012345678901234567890juu1234567890123456789012345678901234567890juu1234567890123456789012345678901234567890juu1234567890123456789012345678901234567890juu')
  #   sample_question = '1234567890123456789012345678901234567890juu1234567890123456789012345678901234567890juu1234567890123456789012345678901234567890juu1234567890123456789012345678901234567890juu1234567890123456789012345678901234567890juu'
  #   click_button('Create Question')
  #
  #   visit '/questions'
  #   expect(page).to have_content(sample_question)
  #
  # end
end
