ActiveAdmin.register Reservation do
	menu label: '예약내역',priority: 4
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :start_date, :end_date, :people_count, :people_child_count, :people_baby_count, :spot_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :start_date, :end_date, :people_count, :people_child_count, :people_baby_count, :spot_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
