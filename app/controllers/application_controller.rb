class ApplicationController < ActionController::Base
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
end
