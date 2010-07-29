ActionController::Base.class_eval do
  include PhillipWidgetsController
end


require 'phillip_widgets_helper'
ActionView::Base.send :include, PhillipWidgetsHelper


class ::Hash
  def is_a_special_hash?
    true
  end
end








