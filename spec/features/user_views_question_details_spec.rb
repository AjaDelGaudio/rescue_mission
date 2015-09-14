require 'rails_helper'
require 'capybara'

feature 'user views the show page of a question', %Q(As a user
  I want to view a question's details
  So that I can effectively understand the question
  ) do

       #  Acceptance Criteria
       # [X] I must be able to get to this page from the questions index
       # [ ] I must see the question's title
       # [ ] I must see the question's description

  scenario 'user navigates to the show page' do
    question_1 = Question.create(title: "Aja and Me!", question: "Does this work?")
    question_2 = Question.create(title: "A question I am asking", question: "Cual es la pregunta que preguntas?")
    question_3 = Question.create(title: "La pregunta segundo", question: "Cual es la segunda pregunta que preguntas")

    visit "/questions"

    expect(page).to have_content(question_1.question)
    expect(page).to have_content(question_2.question)
    expect(page).to have_content(question_3.question)

    click_link(question_1.question)
  end

  scenario 'the show page presents a title' do
    question_1 = Question.create(title: "Aja and Me!", question: "Does this work?")

    visit "/questions/#{question_1.id}"

    expect(page).to have_content(question_1.title)
  end

  scenario 'the show page presents a question (description)' do
    question_1 = Question.create(title: "Aja and Me!", question: "Does this work?")

    visit "/questions/#{question_1.id}"

    expect(page).to have_content(question_1.question)
  end
end
