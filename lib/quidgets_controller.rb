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
        object=params[:object_model_name].camelize.constantize.find(params[:id])
        if params[:svalue]=="true"
          object.update_attribute(params[:method].to_sym,1)
        elsif params[:svalue]=="false"
          object.update_attribute(params[:method].to_sym,0)          
        end
        object.save!
        render :text => ""
      end
      ###################################################### quidgets_radio_update    
      def quidgets_radio_update
        object=params[:object_model].camelize.constantize.find(params[:object_id])
        object.update_attribute("#{params[:choice_model].underscore}_id".to_sym,params[:choice_id])                  
        render :text => ""
      end    
      ###################################################### quidgets_dropbox_update          
      def quidgets_dropbox_update
        model_name=params[:model_name]
        option_model_name=params[:option_model_name]
        instance=model_name.camelize.constantize.find(params[:id])
        instance.update_attribute("#{option_model_name.underscore}_id".to_sym,params[:option_id])                          
        render :text => ""        
      end
  end    
  #/////////////////////////////////////////////////////////////////////////////////////////////////////

end