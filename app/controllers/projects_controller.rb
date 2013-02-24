class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:alert] = "Project has not been updated."
      render :action => 'edit'
    end
  end
  def edit
    @project = Project.find(params[:id])
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end
  def show
    @project = Project.find(params[:id])
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end
end
