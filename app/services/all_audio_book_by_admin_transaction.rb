class AllAudioBookByAdminTransaction
  def initialize(input)
    @input = input
  end

  def call
    @input[:audio_books] = AudioBook.joins(:admin_user).group('admin_users.email', :admin_user_id).count

    input
  end

  private

  attr_accessor :input
end
