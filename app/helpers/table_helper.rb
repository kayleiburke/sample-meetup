module TableHelper

  def is_actions_column(column_info)
    column_info[:field] == "actions"
  end

  def display_action(column_info, action)
    # display the action unless the settings dictate otherwise
    !(column_info[:hidden] and column_info[:hidden].map(&:downcase).include? action)
  end

  def display_field(column_info, item)
    # if we are displaying a field that is an association
    if column_info[:sub_field]
      # if the association is one-to-many
      if column_info[:field].pluralize == column_info[:field]
        output = ""
        item.send(column_info[:field]).each do |sub_item|
          if column_info[:link]
            output = output + "<p>" + link_to(sub_item.send(column_info[:sub_field]), polymorphic_path(sub_item)) + "</p>"
          else
            output = output + "<p>" + sub_item.send(column_info[:sub_field]).to_s + "</p>"
          end
        end
        output.html_safe
      # if the association is one-to-one
      else
        if column_info[:link]
          sub_item = item.send(column_info[:field])
          link_to(item.send(column_info[:field]).send(column_info[:sub_field]), polymorphic_path(sub_item))
        else
          item.send(column_info[:field]).send(column_info[:sub_field])
        end
      end
    elsif column_info[:editable]
      editable item, column_info[:field]
    elsif column_info[:link]
      link_to item.send(column_info[:field]), polymorphic_path(item)
    else
      item.send(column_info[:field])
    end
  end

  def sortable(column, title = nil, class_name = nil)
    title ||= column.titleize
    direction = column == sort_column(class_name) && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "fa fa-sort-asc" : "fa fa-sort-desc"
    icon = column == sort_column(class_name) ? icon : ""
    if params[:search]
      link_to "#{title} <span class='#{icon}'></span>".html_safe, :search => params[:search], :sort => column, :direction => direction
    else
      link_to "#{title} <span class='#{icon}'></span>".html_safe, :sort => column, :direction => direction
    end
  end

end
