require 'rails_helper'
require 'capybara'

feature 'user views index', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do
  # Acceptance Criteria
  #
  # [X] I must see the title of each question
  # [X] I must see questions listed in order, most recently posted first
  scenario 'user sees the title of each question' do
    question_1 = Question.create(title: "Aja and Me!", question: "Does this work?")

    visit '/questions'

    expect(page).to have_content(question_1.title)
  end

  scenario 'user sees a list of questions' do
    question_1 = Question.create(title: "Aja and Me!", question: "Does this work?")
    question_2 = Question.create(title: "A question I am asking", question: "Cual es la pregunta que preguntas?")
    question_3 = Question.create(title: "La pregunta segundo", question: "Cual es la segunda pregunta que preguntas")

    visit '/questions'
    
    expect(page).to have_content(question_1.question)
    expect(page).to have_content(question_2.question)
    expect(page).to have_content(question_3.question)
  end

  scenario 'questions are listed in order of most recent' do
    question_1 = Question.create(title: "Aja and Me!", question: "Does this work?")
    question_2 = Question.create(title: "A question I am asking", question: "Cual es la pregunta que preguntas?")
    question_3 = Question.create(title: "La pregunta segundo", question: "Cual es la segunda pregunta que preguntas")

    visit '/questions'

    expect(question_1.created_at).to be < question_2.created_at
    expect(page.text.index(question_2.title)).to be < page.text.index(question_1.title)
  end
end
