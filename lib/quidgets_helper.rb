module QuidgetsHelper
###################################################################################### checkbox  
  def checkbox(params) # :id, :record, :field
    #model=params[:model].camelize.constantize.find(params[:id])
    #Fine model name for data instance
    params[:record].to_s.match(/<.*:/)
    model_name=$&.gsub(/<|:/,"")
    
    
    html="<input type=\"checkbox\" id=\"#{params[:id]}\" "
    html << "onclick=\"#{remote_function(:url => "/application/quidgets_checkbox_update?id=#{params[:record].id}&model_name=#{model_name}&field_name=#{params[:field]}", :with => "'svalue='+ this.checked")}\""
    if params[:record].send(params[:field].to_sym)==1
      html << " checked "
    end
    html << "/>"
    return html
  end
###################################################################################### radio
  def radio(params) # :name, :id, :class, :parent, :option
    
    #Find parent model name
    parent_name=find_model_name(params[:parent])
    
    #Find option model name
    option_name=find_model_name(params[:option])
    
    #Construct HTML element
    html="<input type=\"radio\" name=\"#{params[:name]}\" id=\"#{params[:id]}\" class=\"#{params[:class]}\" "
    if params[:record].send(params[:field].to_sym)==1
      html << "checked "
    end
    html << "onclick=\"#{remote_function(:url => "/application/quidgets_radio_update?id=#{params[:record].id}&model=#{model_name}&field=#{params[:field]}&parent_field=#{params[:reference_field]}", :with => "'svalue='+ this.checked")}\""
    html << "/>"
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
