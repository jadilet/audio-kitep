class AudioBooksController < ApplicationController
  def new
    @audio_book = AudioBook.new
  end

  def show
    @audio_book = AudioBook.find(params[:id])
  end

  def index; end

  def create
    audio_book = AudioBook.create!(audio_book_params)
    redirect_to audio_book
  end

  def file
    @audio_book = AudioBook.find(params[:id])

    redirect_to polymorphic_path(@audio_book.audio_data)
  end

  private

  def audio_book_params
    params.require(:audio_book).permit(:title, :content, :audio_data)
  end
end
