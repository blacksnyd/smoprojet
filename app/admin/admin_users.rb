ActiveAdmin.register AdminUser do
  menu label: "Administrateurs"
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    column :email
    column "Created by", :admin_user
    column :created_at
    actions

  end


  filter :email
  filter :created_at

  before_create do |admin_user|
    admin_user.admin_user = current_admin_user
  end


  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
