ActiveAdmin.register AudioBook do
  form do |_|
    input :audio_data, as: :file, input_html: { multiple: false }
    input :admin_user_id, as: :hidden, input_html: { value: current_admin_user.id }
    actions
  end

  show do
    attributes_table do
      row :created_at
      row :updated_at
      row :audio_data do |audio_data|
        audio_tag(polymorphic_path(audio_data.audio_data), controls: true) if audio_data.audio_data.attached?
      end
    end
    active_admin_comments
  end

  permit_params :audio_data, :admin_user_id
end
