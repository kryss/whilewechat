ActiveAdmin.register Event do
  permit_params :title, :description, :location, :event_date, :slot, :price, :pic

  form :html => { :enctype => "multipart/form-data" } do |f|  
    f.inputs "Events" do
      f.input :title
      f.input :description
      f.input :event_date, :as => :datepicker
      f.input :location
      f.input :slot
      f.input :price
      f.input :pic, :as => :file
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
