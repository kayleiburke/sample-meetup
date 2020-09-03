class PagesController < ApplicationController
  def main
  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
