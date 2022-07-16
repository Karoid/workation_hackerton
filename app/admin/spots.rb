ActiveAdmin.register Spot do
	menu label: '관광지',priority: 3
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :cost_per_day, :cost_per_people, :cost_per_people_child, :cost_per_people_baby, :description_facility, :description_destination, :category_id, :max_people_count, :detail_images, :thumbnail
  
  
  index do
    selectable_column
    id_column
    column :thumbnail do |s|
      image_tag s.thumbnail, width: 150 if s.thumbnail.attached?
    end
    column :category
    column :name
    column :address
    column :created_at
    
    actions
  end
  
  show do
    attributes_table do
      row :thumbnail do |c|
        image_tag c.thumbnail, width: 150 if c.thumbnail.attached?
      end
      row :detail_images do |c|
        images = ''
        c.detail_images.each do |image|
          images += image_tag image, width: 150
        end
        images.html_safe
      end
      row :category
      row :name
      row :address
      row :cost_per_day
      row :cost_per_people
      row :cost_per_people_child
      row :cost_per_people_baby
      row :max_people_count
      
      row :description_facility
      row :description_destination
      
      
    end
  end
  
  form do |f|
    f.inputs '기본 정보' do
      f.input :category_id, as: :search_select, url: admin_categories_path
      f.input :name
      f.input :address
    end
    
    f.inputs '비용 설정' do
      f.input :cost_per_day
      f.input :cost_per_people
      f.input :cost_per_people_child
      f.input :cost_per_people_baby
      f.input :max_people_count
    end
    
    f.inputs '설명 설정' do
      f.input :description_facility, as: :text
      f.input :description_destination, as: :text
    end
    
    f.inputs '이미지 설정' do
      f.input :thumbnail, as: :file, input_html: {accept: 'image/*'}
      f.input :detail_images, as: :file, input_html: {accept: 'image/*', multiple: true}
    end
    
    f.actions
  end
  
  controller do
    after_action :upload_image, only: [:create, :update]
    
    def upload_image
      @spot.thumbnail.attach(params[:spot][:thumbnail]) if params[:spot][:thumbnail].present?
      if params[:spot][:detail_images].present? && params[:spot][:detail_images].length > 0
        @spot.detail_images.purge
        @spot.detail_images.attach(params[:spot][:detail_images])
      end
    end
  end
  
  filter :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :cost_per_day, :cost_per_people, :cost_per_people_child, :cost_per_people_baby, :description_facility, :description_destination, :category_id, :max_people_count]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
