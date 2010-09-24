module QuidgetsController
  
  #/////////////////////////////////////////////////////////////////////////////////////////////////////  
  def self.included(base)
    base.extend(ClassMethods)
  end

  #/////////////////////////////////////////////////////////////////////////////////////////////////////
  module ClassMethods
    def enable_quidgets
      include QuidgetsController::InstanceMethods
    end
  end

  #/////////////////////////////////////////////////////////////////////////////////////////////////////
  module InstanceMethods
      ###################################################### quidgets_checkbox_update    
      def quidgets_checkbox_update 
        model=params[:model_name].camelize.constantize.find(params[:id])
        if params[:svalue]=="true"
          model.update_attribute(params[:field_name].to_sym,1)
        elsif params[:svalue]=="false"
          model.update_attribute(params[:field_name].to_sym,0)          
        end
        model.save!
        render :text => ""
      end
      ###################################################### quidgets_radio_update    
      def quidgets_radio_update
        model=params[:model].camelize.constantize.find(params[:id])
        group_id=model.send(params[:parent_field].to_sym)
        params[:model].camelize.constantize.update_all("#{params[:field]}=0","#{params[:parent_field]}='#{group_id}'")
        model.update_attribute(params[:field].to_sym,1)
        model.save!      
        render :text => ""
      end    
  end    
  #/////////////////////////////////////////////////////////////////////////////////////////////////////

end