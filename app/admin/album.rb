ActiveAdmin.register Album do
   permit_params :name, photo_attributes_attributes: [:id,:picture,:_destroy => true]
  index do
    column :name
    column :created_at
    actions
  end
  # form do |f|
  #   f.input :name
  #   f.inputs 'Photos' do
  #     f.has_many :photos do |photo|
  #       photo.input :picture
  #     end
  #   end
  #   f.actions
  # end
  form(:html => { :multipart => true }) do |f|
    f.inputs "Albums" do
      f.input :name
    end
    f.inputs "Photos" do
      f.has_many :photos do |ph|
        # photo.inputs "Photos" do
        #
        #   photo.input :picture
        #   #repeat as necessary for all fields
        # end
        ph.input :picture
        ph.actions
      end
      f.actions
    end
    actions
  end

end
