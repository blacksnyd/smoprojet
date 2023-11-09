ActiveAdmin.register LoginActivity do
  index do
    column :id
    column :identity
    column :user
    column :scope
    column :strategy
    column :success
    column :failure_reason
    column :context
    column :ip
    column :user_agent
    column :referrer
    column :city
    column :region
    column :country
    column :latitude
    column :longitude
    column :created_at
  end

  actions :all

end
