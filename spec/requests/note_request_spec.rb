require 'rails_helper'

describe 'Notes API' do
  describe 'valid request with auth' do
    before (:each) do
      user_params = { email: "rocket@email.com",
                      password: "IllgetthatArm",
                      password_confirmation: "IllgetthatArm"
                    }
      post '/users', params: { user: user_params }

      @user = User.last
      @note = @user.notes.create!(title: "Oh Ill get that arm", text: "Winter Soldier? More like Winter Whiner.")
      @user_teller_token = JSON.parse(response.body)["teller_api_token"]
    end

    it "lists the user's notes" do
      get '/api/v1/notes', headers: {"Authorization" => "#{@user_teller_token}"}
      notes = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")

      expect(notes.class).to eq(Array)
      expect(notes[0].class).to eq(Hash)

      expect(notes[0]).to have_key("title")
      expect(notes[0]).to have_key("text")

      expect(notes[0]["title"]).not_to be(nil)
      expect(notes[0]["text"]).not_to be(nil)
    end

    describe 'POST requests' do
      it "should add a new note" do
        note_params = {title: "big note things", text: "with small note details"}
        post '/api/v1/notes', headers: {"Authorization" => "#{@user_teller_token}"}, params: {note: note_params}

        expect(response).to be_successful
        expect(response).to have_http_status(201)
        expect(response.headers["Accept"]).to eq("application/json")
        expect(response.headers["Content-Type"]).to eq("application/json")

        expect(@user.notes.last.title).to eq(note_params[:title])
      end
    end
  end
end
