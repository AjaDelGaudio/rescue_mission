class AnswersController < ActionController::Base
  def index
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question


    if @answer.save
      flash[:notice] = "You submitted an answer!"
    else
      flash[:notice] = "Please submit a correct answer"
    end
      redirect_to :back
  end

  private

    def answer_params
      params.require(:answer).permit(:description)
    end
end
