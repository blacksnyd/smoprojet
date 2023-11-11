ActiveAdmin.register User do
  menu label: "Utilisateurs"
  permit_params :email, :password, :password_confirmation
  index do
    selectable_column
    column :email
    column "Created by", :admin_user
    column :created_at
    actions
  end

  filter :email

  before_create do |user|
    user.admin_user = current_admin_user
  end

  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      super
    end
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
