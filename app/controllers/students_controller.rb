class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @house = House.find(params[:house_id])
    @students = @house.students.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # POST /students
  # POST /students.json
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
  # PATCH/PUT /students/1.json
  def update
    if @student.update(student_params)
      render :show, status: :ok
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
  end

  private
    def set_student
      @house = House.find(params[:house_id])
      @student = @house.students.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :house, :born, :house_id)
    end
end
