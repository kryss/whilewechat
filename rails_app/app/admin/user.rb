ActiveAdmin.register User do
  permit_params :fullname, :company, :email, :school, :grade, :city, :country, :phone, :about, :linkedin
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Users" do
      f.input :fullname
      f.input :company
      f.input :email
      f.input :school
      f.input :grade
      f.input :city
      f.input :country, :as => :string
      f.input :phone
      f.input :about
      f.input :linkedin
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
