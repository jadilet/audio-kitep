class AllAudioBookByAdminTransaction < BaseTransaction
  def process_transaction
    input[:audio_books] = data_source

    input
  end

  private

  def data_source
    AudioBook.joins(:admin_user).group('admin_users.email', :admin_user_id).count
  end
end
