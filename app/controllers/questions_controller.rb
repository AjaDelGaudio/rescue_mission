class QuestionsController < ActionController::Base
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @new_answer = Answer.new
    @answers = @question.answers.order(created_at: :asc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question successfully posted!"
      redirect_to '/questions'
    else
      flash[:notice] = "Please submit the field correctly!"
      redirect_to :back
    end
  end

  private

    def question_params
      params.require(:question).permit(:title, :question)
    end
end
