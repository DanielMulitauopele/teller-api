class Api::V1::NotesController < ApplicationController
  def index
    render json: Note.where(user_id: @current_user.id)
  end
end
