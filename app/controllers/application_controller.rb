class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    return root_path if resource.role == 'Administrator'
    return orders_path if resource.role == 'Customer'
       
  end

end
