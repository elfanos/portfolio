ActiveAdmin.register Article do
  permit_params :name, :description, :pdf_file, :document, :picture
  index do
    column :document
    column :name
    column :description
    column :picture
    actions
  end
  form html: { multipart: true } do |f|
    f.inputs "Articles" do
      # ...
      f.input :name
      f.input :description
      f.input :document, as: :file
      f.input :picture, as: :file
    end
    actions
  end
end
