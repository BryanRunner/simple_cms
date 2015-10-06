class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.create(page_params)
  end

  def edit
    # @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
  end

  def delete
    # @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
  end

  private

    def page_params
      params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
    end
end
