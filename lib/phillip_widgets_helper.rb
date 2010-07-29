module PhillipWidgetsHelper
######################################################################################  
  def phillip_checkbox(model_name,id,field_name)
    model=model_name.camelize.constantize.find(id)    
    html="<input type=\"checkbox\" "

    html << "onclick=\"#{remote_function(:url => "/application/phillip_widgets_checkbox_update?id=#{id}&model_name=#{model_name}&field_name=#{field_name}", :with => "'svalue='+ this.checked")}\""

    if model.send(field_name.to_sym)==true
      html << " checked "
    end
    
    html << "/>"
    return html
  end
######################################################################################
end
