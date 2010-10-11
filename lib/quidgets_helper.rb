module QuidgetsHelper
###################################################################################### checkbox  
  def checkbox(object,method,html_options = {}) 
    #Fine model name for data instance
    object_model_name=find_model_name(object)
        
    html="<input 
      type=\"checkbox\" 
      id=\"#{html_options[:id]}\" 
      name=\"#{html_options[:name]}\" 
      class=\"#{html_options[:class]}\" "
        
    html << "onclick=\"#{remote_function(:url => "/application/quidgets_checkbox_update?" <<
      "id=#{object.id}&" <<
      "object_model_name=#{object_model_name}&" <<
      "method=#{method}", :with => "'svalue='+ this.checked")}\""
    
    html << " checked " if object.send(method.to_sym)==true
    html << "/>"
    return html
  end
###################################################################################### radio
  def radio(object,choice,html_options = {}) # object,choice,html_options
    #Find parent model name
    object_model=find_model_name(object)
    
    #Find option model name
    choice_model=find_model_name(choice)
    
    #Construct HTML element
    html="<input 
    type=\"radio\" 
    name=\"#{html_options[:name]}\" 
    id=\"#{html_options[:id]}\" 
    class=\"#{html_options[:class]}\" "
      
    html << "checked " if object.send(choice_model.underscore.to_sym)==choice
    html << "onclick=\"
    #{remote_function(:url => "/application/quidgets_radio_update?" <<
      "object_id=#{object.id}&" <<
      "choice_id=#{choice.id}&" <<
      "object_model=#{object_model}&" <<
      "choice_model=#{choice_model}")}\""
    html << "/>"
  end
###################################################################################### textbox
  def textbox(object,method,html_options = {})
    object_model=find_model_name(object)
    html="<input 
      type=\"text\" 
      id=\"#{html_options[:id]}\" 
      name=\"#{html_options[:name]}\" 
      class=\"#{html_options[:class]}\" 
      value=\"#{object.send(method.to_sym)}\"/>"        
  end
###################################################################################### listbox
  def listbox(object,choices,html_options = {})
  end
###################################################################################### dropbox
  def dropbox(object,choices,html_options = {})
  end

######################################################################################  PRIVATE
  private
  def find_model_name(object)
    if object.to_s.match(/<.*:/)
      return $&.gsub(/<|:/,"")
    else
      return nil
    end
  end
###################################################################################### END
end
