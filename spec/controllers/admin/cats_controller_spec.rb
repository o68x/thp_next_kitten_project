# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::CatsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "assigns @cats" do
        cat = Cat.create
        get :show, id: cat.id
        expect(assigns(:cat)).to eq(cat)
    end

    it "renders the show template" do
        get :show
        expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "renders the new template" do
        get :new
        expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "assigns @cats" do
        cat = Cat.create
        get :edit, id: cat.id
        expect(assigns(:cat)).to eq(cat)
    end

    it "renders the edit template" do
        get :edit
        expect(response).to render_template("edit")
    end
    
  end

  describe "POST #create" do
    context "with valid attributes" do
        it "creates a new cat" do
            expect {
                post :create, params: {"cat" => {title: Faker::Artist.name, description: Faker::Lorem.sentences(3).join, price: rand(80..500).to_f } }
            }.to change(Cat,:count).by(1)

        it "redirects to the new cat" do
            post :create, params: {"cat" => {title: Faker::Artist.name, description: Faker::Lorem.sentences(3).join, price: rand(80..500).to_f } }
            response.sould redirect_to Cat.last
        end
    context "with invalid attributes"
  end

  describe "PUT #update" do
  end

  describe "DELETE #destroy" do
  end

end