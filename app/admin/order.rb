ActiveAdmin.register Order do
  permit_params :dispatcher_id, :driver_id, :status,
                :comment, :phone_number, :email,
                :number_of_passengers, :date_of_trip,
                :AdresFrom, :AdresTo
  index do
    selectable_column
    id_column
    column :dispatcher_id
    column :driver_id
    column :status
    column :comment
    column :phone_number
    column :email
    column :number_of_passengers
    column :date_of_trip
    column :AdresFrom
    column :AdresTo
    actions
  end

  filter :phone_number

  form do |f|
    f.inputs 'Order Details' do
      f.input :comment
      f.input :phone_number
      f.input :email
      f.input :number_of_passengers
      f.input :date_of_trip
      f.input :AdresFrom
      f.input :AdresTo
    end
    f.actions
  end
end
