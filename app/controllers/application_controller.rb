class ApplicationController < ActionController::Base
    def sort_column(class_name = nil)
      if class_name
        class_name.column_names.include?(params[:sort]) ? params[:sort] : "id"
      end
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
