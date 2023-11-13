ActiveAdmin.register Guarding do
  menu label: "Gardiennages"
  permit_params :address, user_ids: []

  index do
    selectable_column
    column :address
    column :users
    column :presence
    column "Created by", :admin_user
    column :created_at
    actions
  end

  filter :address
  filter :users
  filter :admin_user

  before_create do |guarding|
    guarding.admin_user = current_admin_user
  end

  form do |f|
    f.inputs do
      f.input :address
      f.input :users
    end
    f.actions
  end
end
