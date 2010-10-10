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
        record=params[:record_model].camelize.constantize.find(params[:record_id])
        record.update_attribute("#{params[:option_model].underscore}_id".to_sym,params[:option_id])                  
        render :text => ""
      end    
  end    
  #/////////////////////////////////////////////////////////////////////////////////////////////////////

end