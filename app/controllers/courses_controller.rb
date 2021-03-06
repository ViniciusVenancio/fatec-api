class CoursesController < ApplicationController
  before_action :find_course, only: [:edit, :update, :destroy, :show]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new

    render :new, layout: false if request.xhr?
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path, notice: 'Curso salvo com sucesso!'
    else
      render :new, alert: 'falha ao salvar curso!'
    end
  end

  def edit; end

  def show
    render :show, layout: false if request.xhr?
  end

  def update
    if @course.update_attributes(course_params)
      redirect_to courses_path, notice: 'Curso atualizado com sucesso!'
    else
      render :edit, alert: 'Falha ao atualizar curso!'
    end
  end

  def destroy
    if @course.destroy
      redirect_to courses_path, notice: 'Curso excluído com sucesso!'
    else
      redirect_to courses_path, alert: 'Falha ao excluir curso'
    end
  end

  private
  def course_params
    params.require(:course).permit(:abreviation, :name)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
