require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  
  let(:my_wiki) {Wiki.create!(title: RandomData.random_name, body: RandomData.random_paragraph) }

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  #   it "assigns [my wiki] to @wikis" do
  #     get :index
  #     expect(assigns(:wikis)).to eq([my_wiki])
  #   end
  # end
  
end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
    
  #   it "assigns [my wiki] to @wikis" do
  #     get :index
  #     expect(assigns(:wikis)).to eq([my_wiki])
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #delete" do
  #   it "returns http success" do
  #     get :delete
  #     expect(response).to have_http_status(:success)
  #   end
  # end
