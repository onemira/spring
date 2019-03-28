class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /students
  def index
    @house = House.find(params[:house_id])
    @students = @house.students.all
  end

  # GET /students/1
  def show
  end

  # POST /students
  def create
    @house = House.find(params[:house_id])
    @student = @house.students.new(student_params)

    if @student.save
      render :show, status: :created, location: [@house, @student]
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render :show, status: :ok
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @house = House.find(params[:house_id])
      @student = @house.students.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :house, :born, :house_id)
    end
end
