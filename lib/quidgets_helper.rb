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
###################################################################################### checkbox_group  
  def checkbox_group(params) # :id, :records, :field
    html=""
    params[:records].each do |record|
      html << checkbox(:id => params[:id], :record => record, :field => params[:field])
    end
    return html
  end

###################################################################################### radio
  def radio(params) # :name, :record, :field, :reference_field    
    #Fine model name for data instance
    params[:record].to_s.match(/<.*:/)
    model_name=$&.gsub(/<|:/,"")
    
    #Construct HTML element
    html="<input type=\"radio\" name=\"#{params[:name]}\" "
    if params[:record].send(params[:field].to_sym)==1
      html << "checked "
    end
    html << "onclick=\"#{remote_function(:url => "/application/quidgets_radio_update?id=#{params[:record].id}&model=#{model_name}&field=#{params[:field]}&parent_field=#{params[:reference_field]}", :with => "'svalue='+ this.checked")}\""
    html << "/>"
  end
###################################################################################### radio_group
  def radio_group(params) # :name, :records, :field, :reference_field
    html=""
    params[:records].each do |record|
      html << radio(:name => params[:name], :record => record, :field => params[:field], :reference_field => params[:reference_field])
    end
    return html
  end
######################################################################################
end
