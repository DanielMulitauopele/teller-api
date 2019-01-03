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

  describe 'invalid request' do
    describe 'without auth headers' do
      it 'sends an error message' do
        note_params = {title: "big note things", text: "with little note details"}
        post '/api/v1/notes', headers: {"Authorization" => "#{@user_teller_token}"}, params: {note: note_params}

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(401)
        expect(error["error"]).to eq("Not authorized to make this request")
      end
    end
    describe 'without note params' do
      before (:each) do
        user_params = { email: "groot@email.com",
          password: "IamGrootIamGroot",
          password_confirmation: "IamGrootIamGroot"
        }
        post '/users', params: { user: user_params }

        @user_teller_token2 = JSON.parse(response.body)["teller_api_token"]
      end
      it 'sends an error message when missing title' do
        note_params = {text: "dude, where's my title?"}
        post '/api/v1/notes', headers: {"Authorization" => "#{@user_teller_token2}"}, params: {note: note_params}

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)
        expect(error["error"]).to eq("Something went wrong. Your note did not save. Please try again.")
      end
      it 'sends an error message when missing text' do
        note_params = {title: "dude, where's my text?"}
        post '/api/v1/notes', headers: {"Authorization" => "#{@user_teller_token2}"}, params: {note: note_params}

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)
        expect(error["error"]).to eq("Something went wrong. Your note did not save. Please try again.")
      end
    end
  end
end
