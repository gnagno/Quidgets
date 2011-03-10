module QuidgetsHelper
###################################################################################### checkbox  
# checkbox(record,"active",{:id => "active_check_#{record.id}"})     
  def checkbox(object,method,html_options = {}) 
    #Fine model name for data instance
    object_model_name=find_model_name(object)
    
    @html_options = html_options
    
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
    
    render :partial => 'templates/checkbox'
  end
###################################################################################### radio
# Role.all.each do |role|
#  html << radio(record,role,{:name => "role_option_#{record.id}"}) << "#{role.name}" 
# end

  def radio(object,choice,html_options = {})
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
#* LISTBOX: listbox(object,choices,html_options = {})
#    <%= listbox(@user,PaymentMethod.all,{:id => "dropbox_#{@user.id}"}) %>        

  def listbox(object,choices,html_options = {})
    
  end
###################################################################################### dropbox
#* DROPBOX: dropbox(object,choices,html_options = {})
# dropbox(user,Role.all,{:id => "role_#{user.id}"})

  def dropbox(object,choices,html_options = {})
    model_name=find_model_name(object)
    html="<select 
      id=\"#{html_options[:id]}\" 
      name=\"#{html_options[:name]}\" 
      class=\"#{html_options[:class]}\" 
      />"
    
    html << "<option onclick=\"#{remote_function(:url => "/application/quidgets_dropbox_update/#{object.id}?model_name=#{model_name}&option_model_name=#{find_model_name(choices.first).underscore}")}\">(Please select)</option>"
      
    choices.each do |choice|
      html << "<option onclick=\"#{remote_function(:url => "/application/quidgets_dropbox_update/#{object.id}?model_name=#{model_name}&option_model_name=#{find_model_name(choice).underscore}&option_id=#{choice.id}")}\"" <<
      "#{"selected" if !object.send(find_model_name(choice).underscore.to_sym).nil? and object.send(find_model_name(choice).downcase.to_sym).id==choice.id} >" << 
      "#{choice.name}</option>"
    end
    html <<"</select>"
    return html
  end
###################################################################################### textbox
  def textbox(object,field,html_options = {})
    render :file => 'views/textbox.html.erb'
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
