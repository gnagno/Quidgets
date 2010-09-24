ActionController::Base.class_eval do
  include QuidgetsController
end


require 'Quidgets_helper'
ActionView::Base.send :include, QuidgetsHelper


class ::Hash
  def is_a_special_hash?
    true
  end
end








