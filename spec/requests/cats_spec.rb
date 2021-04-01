require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'gets a list of cats' do
      #arrange
      Cat.create(name:'whiskers', age: 15, enjoys:'catnip', profile_pic:'pic.jpeg')
      #act
      get '/cats'
      #assert
      cat_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat_response.length).to eq 1
      first_cat = cat_response.first
      expect(first_cat['name']).to eq 'whiskers'
      expect(first_cat['age']).to eq 15
      expect(first_cat['enjoys']).to eq 'catnip'
      expect(first_cat['profile_pic']).to eq 'pic.jpeg'
    end
  end

  describe "POST /cats" do
    it 'creates a new cat' do
      #arrange
      cat_params = {
        cat: {
          name:'Stitch',
          age:1,
          enjoys:'knocking things off the counter',
          profile_pic:'pic.png',
        }
      }
      #act
      post '/cats', params:cat_params
      #assert
      cat = Cat.first
      expect(cat.name).to eq 'Stitch'
      expect(cat.age).to eq 1
      expect(cat.enjoys).to eq 'knocking things off the counter'
      expect(cat.profile_pic).to eq 'pic.png'
      cat_response = JSON.parse(response.body)
      expect(cat_response['name']).to eq 'Stitch'
      expect(cat_response['age']).to eq 1
      expect(cat_response['enjoys']).to eq 'knocking things off the counter'
      expect(cat_response['profile_pic']).to eq 'pic.png'
    end
  end
end
