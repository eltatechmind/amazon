ActiveAdmin.register Photo do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :image, :item_id
  
  index do
    selectable_column
    id_column
    column 'Image', sortable: :image_file_name do |photo| link_to photo.image_file_name, photo.image.url end
    column :image_file_size, sortable: :image_file_size do |photo| "#{photo.image_file_size / 1024} KB" end
    column :created_at
    actions
  end

  form do |f|
    f.input :item_id
    f.inputs "Upload" do
      f.input :image, required: true, as: :file
    end
    f.actions
  end

end
