ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :latitude, :longitude
  index do
    selectable_column
    id_column
    column :email
    column :admin_user
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
      f.input :latitude
      f.input :longitude
    end
    f.actions
  end

end
