class Api::V1::NotesController < ApplicationController
  def index
    render json: Note.where(user_id: @current_user.id)
  end

  def create
    note = @current_user.notes.create(note_params)
    if note.save
      render json: {notice: "Note added."},
             status: 201
    else
      render json: {error: "Something went wrong. Your note did not save. Please try again."},
             status: 400
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :text)
  end
end
