require 'rails_helper'

RSpec.describe "Api::Activities", :type => :request do
  describe "GET /api_activities" do
    before do
      @user = User.create(name: "jon snow", email: "j@example.com")
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user) { @user }

      # Make sure all providers are being aggregated
      YoutubeActivity.create(url: "http://youtube.com", provider: "youtube", user_id: @user.id)
      SoundcloudActivity.create(url: "123456789", provider: "soundcloud", user_id: @user.id)
      TwitterActivity.create(url: "twitter", provider: "twitter", user_id: @user.id)
    end

    it "should retrieve a list of activiy objects" do
      get api_activities_path
      expect(response.status).to eq 200
      json = JSON.parse(response.body)
      expect(json['activities'].length).to eq(3)
    end
  end
end
