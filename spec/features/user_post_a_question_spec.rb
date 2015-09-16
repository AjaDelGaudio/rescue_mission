require 'rails_helper'
require 'capybara'
require 'spec_helper'

feature 'user post a new question', %(
  As a user
  I want to post a question
  So that I can receive help from others
) do
  #   Acceptance Criteria
  #
  # [X] I must be able to get to this page from the questions index
  # [X] I must provide a title that is at least 40 characters long
  # [X] I must provide a description that is at least 150 characters long
  # [X] I must be presented with errors if I fill out the form incorrectly

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
    question_1 = FactoryGirl.create(:question)

    visit 'questions/new'

    fill_in("Title", with: question_1.title)
    fill_in("Question", with: question_1.question)
    click_button("Create Question")

    expect(page).to have_content("Question successfully posted!")
    expect(page).to have_content("Post New Question")
  end

  scenario "user submits a question without a title" do
    question_1 = FactoryGirl.create(:question)
    visit 'questions/new'

    fill_in("Question", with: question_1.question)
    click_button("Create Question")

    expect(page).to have_content("Please submit the field correctly!")

  end

  scenario "user submits a question without a question" do
    question_1 = FactoryGirl.create(:question)
    visit 'questions/new'

    fill_in("Title", with: question_1.title)
    click_button("Create Question")

    expect(page).to have_content("Please submit the field correctly!")

  end

  scenario "user submits a question with less than 150 characters" do
    question_1 = FactoryGirl.create(:question)
    visit 'questions/new'


    fill_in("Title", with: question_1.title)
    fill_in("Question", with: "Something that we are asking with less than 150 characters")
    click_button("Create Question")

    expect(page).to have_content("Please submit the field correctly!")

  end

  scenario "user submits a title with less than 40 characters" do
    question_1 = FactoryGirl.create(:question)
    visit 'questions/new'

    fill_in("Title", with: "less than 40 characters")
    fill_in("Question", with: question_1.question)
    click_button("Create Question")

    expect(page).to have_content("Please submit the field correctly!")

  end
end
