ActiveAdmin.register Driver do
  permit_params :email, :password, :password_confirmation,
                :name, :phone_number_string, :license_plate,
                :car_model, :car_color, :car_type

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :phone_number_string
    column :license_plate
    column :car_model
    column :car_color
    column :car_type
    actions
  end

  filter :name
  filter :current_sign_in_at
  filter :car_type
  filter :car_color

  form do |f|
    f.inputs 'Driver Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :phone_number_string
      f.input :license_plate
      f.input :car_model
      f.input :car_color, as: :string
      f.input :car_type
    end
    f.actions
  end
end
