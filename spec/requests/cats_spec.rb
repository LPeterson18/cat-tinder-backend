require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'gets a list of cats' do
      #arrange
      Cat.create(name:'whiskers', age: 15, enjoys:'catnip before bed', profile_pic:'pic.jpeg')
      #act
      get '/cats'
      #assert
      cat_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat_response.length).to eq 1
      first_cat = cat_response.first
      expect(first_cat['name']).to eq 'whiskers'
      expect(first_cat['age']).to eq 15
      expect(first_cat['enjoys']).to eq 'catnip before bed'
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

    it 'cannot create a new cat without a name' do
      cat_params = {
        cat: {
          age:1,
          enjoys:'knocking things off the counter',
          profile_pic:'pic.png',
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['name']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new cat without an age' do
      cat_params = {
        cat: {
          name:'Stitch',
          enjoys:'knocking things off the counter',
          profile_pic:'pic.png',
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['age']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new cat without an enjoys' do
      cat_params = {
        cat: {
          name:'Stitch',
          age:1,
          profile_pic:'pic.png',
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['enjoys']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
    it 'cannot create a new cat without a profile pic' do
      cat_params = {
        cat: {
          name:'Stitch',
          age:1,
          enjoys:'knocking things off the counter',
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['profile_pic']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
  end

  describe 'PATCH /cats/:id' do
    it 'updates a cat' do
      cat_params1 = {
        cat: {
          name:'Stitch',
          age:1,
          enjoys:'knocking things off the counter',
          profile_pic:'pic.png',
        }
      }
      cat_params2 = {
        cat: {
          name:'Lilo',
          age:1,
          enjoys:'knocking things off the counter',
          profile_pic:'pic.png',
        }
      }

      post '/cats', params: cat_params1
      patch '/cats/1', params: cat_params2

      cat = Cat.first
      expect(cat.name).to eq 'Lilo'
      cat_response = JSON.parse(response.body).first
      expect(cat_response['name']).to eq 'Lilo'
    end
  end
end
