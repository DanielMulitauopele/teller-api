require 'rails_helper'

describe 'Favorites API' do
  describe 'valid request with auth' do
    before (:each) do
      user_params = { email: "groot@email.com",
                      password: "IamGrootIamGroot",
                      password_confirmation: "IamGrootIamGroot"
                    }
      post '/users', params: { user: user_params }

      @user = User.last
      @favorite = @user.favorites.create!(name: "bitcoin", price_usd: 123.45, percent_change_24_hr: ".34")
      @user_teller_token = JSON.parse(response.body)["teller_api_token"]
    end

    it "lists the user's favorites" do
      get '/api/v1/favorites', headers: {"Authorization" => "#{@user_teller_token}"}
      favorites = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")

      expect(favorites.class).to eq(Array)
      expect(favorites[0].class).to eq(Hash)

      expect(favorites[0]).to have_key("name")
      expect(favorites[0]).to have_key("price_usd")
      expect(favorites[0]).to have_key("percent_change_24_hr")

      expect(favorites[0]["name"]).not_to be(nil)
      expect(favorites[0]["price_usd"]).not_to be(nil)
      expect(favorites[0]["percent_change_24_hr"]).not_to be(nil)
    end

    describe 'POST requests' do
      it "should add a new favorite" do
        fav_params = {name: "ethereum", price_usd: 234.56, percent_change_24_hr: "3.14"}
        post '/api/v1/favorites', headers: {"Authorization" => "#{@user_teller_token}"}, params: {user: fav_params}

        expect(response).to be_successful
        expect(response).to have_http_status(201)
        expect(response.headers["Accept"]).to eq("application/json")
        expect(response.headers["Content-Type"]).to eq("application/json")

        expect(@user.favorites.last.name).to eq(fav_params[:name])
      end
    end
  end
end
