ActiveAdmin.register Photo do
  permit_params :picture, :album_id
  index do
    column :picture
    column :created_at
    column :album_id
    actions
  end

end
