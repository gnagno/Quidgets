module QuidgetsController
  
  #/////////////////////////////////////////////////////////////////////////////////////////////////////  
  def self.included(base)
    base.extend(ClassMethods)
  end

  #/////////////////////////////////////////////////////////////////////////////////////////////////////
  module ClassMethods
    def enable_quidgets
      include PhillipWidgetsController::InstanceMethods
    end
  end

  #/////////////////////////////////////////////////////////////////////////////////////////////////////
  module InstanceMethods
      ###################################################### quidgets_checkbox_update    
      def phillip_widgets_checkbox_update 
        model=params[:model_name].camelize.constantize.find(params[:id])
        model.update_attribute(params[:field_name].to_sym,params[:svalue])
        model.save!
        render :text => ""
      end
      ###################################################### quidgets_radio_update    
      def phillip_widgets_radio_update
        model=params[:model].camelize.constantize.find(params[:id])
        group_id=model.send(params[:parent_field].to_sym)
        params[:model].camelize.constantize.update_all("#{params[:field]}=0","#{params[:parent_field]}='#{group_id}'")
        model.update_attribute(params[:field].to_sym,1)
        model.save!      
      end    
  end    
  #/////////////////////////////////////////////////////////////////////////////////////////////////////

end