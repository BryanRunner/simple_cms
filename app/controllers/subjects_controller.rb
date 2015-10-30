class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.create(subject_params)
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    @subject.name = subject_params[:name]
    @subject.save
  end

  def destroy
    @subject = Subject.find(params[:id]).destroy
  end

  private

  def subject_params
    params.require(:subject).permit(:id, :name, :position, :visible)
  end
end
