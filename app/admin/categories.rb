ActiveAdmin.register Category do
	menu label: '카테고리',priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :display_order, :icon
  
  index do
    selectable_column
    id_column
    column :icon do |c|
      image_tag c.icon if c.icon.attached?
    end
    column :name
    column :display_order
    actions
  end
  
  show do
    attributes_table do
      row :id
      row :icon do |c|
        image_tag c.icon if c.icon.attached?
      end
      row :name
      row :display_order
      row :created_at
      row :updated_at      
    end
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :display_order
      f.input :icon, as: :file, input_html: {accept: 'image/*'}
    end
    f.actions
  end
  
  controller do
    after_action :upload_image, only: [:create, :update]
    
    def upload_image
      puts params
      @category.icon.attach(params[:category][:icon]) if params[:category][:icon].present?
    end
  end
  
  filter :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :display_order]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
