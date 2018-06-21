ActiveAdmin.register Photo do

permit_params :image, :item_id
  
  index do
    selectable_column
    id_column
    column :item_id
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
