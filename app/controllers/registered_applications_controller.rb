class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = current_user.registered_applications
  end

  def show
    @registered_application = current_user.registered_applications.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]
    @registered_application.user = current_user

    if @registered_application.save
      flash[:notice] = "Registration successful."
      redirect_to @registered_application
    else
      flash.now[:alert] = "#{params}"
      render :new
    end
  end

  def edit
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
end
