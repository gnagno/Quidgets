module PhillipWidgetsHelper
###################################################################################### checkbox  
  def checkbox(params) # :html_id, :model, :id, :field
    model=params[:model].camelize.constantize.find(params[:id])
    html="<input type=\"checkbox\" id=\"#{params[:html_id]}\" "
    html << "onclick=\"#{remote_function(:url => "/application/quidgets_checkbox_update?id=#{params[:id]}&model_name=#{params[:model]}&field_name=#{params[:field]}", :with => "'svalue='+ this.checked")}\""
    if model.send(params[:field].to_sym)==true
      html << " checked "
    end
    html << "/>"
    return html
  end
###################################################################################### radio
  def radio(params) # :html_id, :model, :id, :field, :parent_field    
    model=model_name.camelize.constantize.find(params[:id])    
    html="<input type=\"radio\" id=\"#{params[:html_id]}\" "
    if model.send(params[:field].to_sym)==true
      html << "checked "
    end
    html << "onclick=\"#{remote_function(:url => "/application/quidgets_radio_update?id=#{params[:id]}&model=#{params[:model]}&field=#{params[:field]}&parent_field=#{params[:parent_field]}", :with => "'svalue='+ this.checked")}\""
    html << "/>"
  end
######################################################################################
end
