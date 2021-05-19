class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def sort_column(class_name = nil)
    sort_col = "id"

    if params[:sort]
      if params[:sort].include? "."
        sort_col = params[:sort]
      else
        sort_col = (class_name.column_names.include?(params[:sort]) ? params[:sort] : "id")
      end
    end

    sort_col
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
  end
end
