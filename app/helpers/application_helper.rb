module ApplicationHelper
  #Returning a title dependant on a page
  def title
    base_title = "MasterBaker" 
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end 
  end
end
