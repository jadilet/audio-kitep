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
        if audio_data.audio_data.attached?
          audio_tag(polymorphic_path(audio_data.audio_data),
                    controls: true)
        end
      end
    end
    active_admin_comments
  end

  action_item :generate_report, only: :index do
    link_to 'Generate report',
            generate_report_admin_audio_books_path,
            method: :post,
            class: 'button'
  end

  collection_action :generate_report, method: %i[post] do
    send_file AudioBookReportOperations.new('').call, layout: false
  end

  permit_params :audio_data, :admin_user_id
end
