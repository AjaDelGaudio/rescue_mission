require 'rails_helper'
require 'capybara'
require 'spec_helper'

feature 'user views the show page of a question', %Q(As a user
  I want to view a question's details
  So that I can effectively understand the question
  ) do

       #  Acceptance Criteria
       # [X] I must be able to get to this page from the questions index
       # [X] I must see the question's title
       # [X] I must see the question's description

  scenario 'user navigates to the show page' do
    question_1 = FactoryGirl.create(:question)
    question_2 = FactoryGirl.create(:question)
    question_3 = FactoryGirl.create(:question)

    visit "/questions"

    expect(page).to have_content(question_1.question)
    expect(page).to have_content(question_2.question)
    expect(page).to have_content(question_3.question)

    click_link(question_1.question)
  end

  scenario 'the show page presents a title' do
    question_1 = FactoryGirl.create(:question)
    visit "/questions/#{question_1.id}"

    expect(page).to have_content(question_1.title)
  end

  scenario 'the show page presents a question (description)' do
    question_1 = FactoryGirl.create(:question)
    visit "/questions/#{question_1.id}"

    expect(page).to have_content(question_1.question)
  end
end
