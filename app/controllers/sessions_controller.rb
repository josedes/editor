class SessionsController < Devise::SessionsController

 after_filter :after_sign_in_path_for(resources)

def new
  puts "NEW"
  super
end

def create
  puts "create"
  
super
end

#protected
#    def after_sign_in_path_for(resource)
#      admin_administrators_cms_path_for(resource)
#    end

#protected    
#  def user_layout    
#    puts current_usuario.admin?
#    if current_usuario.admin?    
#      "admin"     
#    else    
#      "application"     
#    end    
#  end   

end