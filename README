Quidgets
==============

A collection of helper widgets that directly bind to your database structure.
It's extremely simple to use.

HOW TO INSTALL

* Install plugin from git:
    ./script/plugin install git://github.com/phtphan/Quidgets.git

* In your /app/controllers/application_controller.rb, add this line : 
    enable_quidgets
    
    => Your applcation_controller.rb should look like this:
    
      class ApplicationController < ActionController::Base
        enable_quidgets
      end
    
    


HOW TO USE

  Generate two example models:

  rails g model user name:string description:text active:boolean role_id:integer
  
  rails g model role name:string

  Example DB structure:
  + user.rb
      belongs_to :role
    
  + role.rb
      has_many :users
  


* CHECKBOX: checkbox(object,method,html_options = {})   
    Ex: <%= raw checkbox( @user,"active",{:id => "active_check_#{@user.id}"}) %>

          
* RADIO BUTTON: radio(object,choice,html_options = {})
    Ex:    
     Role.all.each do |role|
      html << radio(user,role,{:name => "role_option_#{record.id}"}) << "#{role.name}" 
     end
      
* TEXTBOX: (in progress)


    
* LISTBOX: (in progress)
    
* DROPBOX: dropbox(instance,choices,html_options = {})
    EX: <%= dropbox(user,Role.all,{:id => "role_#{user.id}"}) %>

    
* listbox_dragdrop(params) # Coming soon


Copyright (c) 2010 Quidgets, released under the MIT license
