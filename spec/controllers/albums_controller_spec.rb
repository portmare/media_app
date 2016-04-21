# /spec/controllers/albums_controller.spec.rb
require 'rails_helper'

describe AlbumsController, type: :controller do
  describe 'when no user authenticated' do
    let(:album) { build_stubbed(:album) }

    describe 'with and without token key' do
      it 'GET index redirected to sign in path' do
        get :index
        expect(response).to redirect_to(sign_in_path)
      end

      it 'GET new redirected to sign in path' do
        get :new
        expect(response).to redirect_to(sign_in_path)
      end

      it 'POST create redirected to sign in path' do
        post :create
        expect(response).to redirect_to(sign_in_path)
      end

      it 'GET edit redirected to sign in path' do
        allow(Album).to receive(:find).and_return(album)
        get :edit, id: album.id
        expect(response).to redirect_to(sign_in_path)
      end

      it 'PATCH update redirected to sign in path' do
        allow(Album).to receive(:find).and_return(album)
        patch :update, id: album.id
        expect(response).to redirect_to(sign_in_path)
      end

      it 'DELETE destroy redirected to sign in path' do
        allow(Album).to receive(:find).and_return(album)
        delete :destroy, id: album.id
        expect(response).to redirect_to(sign_in_path)
      end
    end
  end

  describe 'with authenticated user' do
    setup :activate_authlogic

    let(:user) { create(:user) }
    let(:album) { create(:album, user: user) }

    before(:each) do
      UserSession.create(user)
    end

    it 'GET index rendered #index with albums' do
      get :index
      expect(assigns(:albums)).to match_array([album])
    end

    it 'GET new rendered #new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'POST create added new Album' do
      expect { 
        post :create, album: attributes_for(:album)
      }.to change { Album.count }.to(1)
    end

    it 'POST create redirected to albums path' do
      post :create, album: attributes_for(:album)
      expect(response).to redirect_to(albums_path)
    end

    it 'GET edit assigns @album' do
      get :edit, id: album
      expect(assigns(:album)).to match(album)
    end

    it 'GET edit rendered #edit template' do
      get :edit, id: album
      expect(response).to render_template(:edit)
    end

    it 'PATCH update assigns @album' do
      patch :update, id: album, album: { name: 'New name' }
      album.reload
      expect(album.name).to eq('New name')
    end

    it 'PATCH update redirected to albums path' do
      patch :update, id: album, album: { name: 'New name' }
      album.reload
      expect(response).to redirect_to(albums_path)
    end

    it 'DELETE destroy drops @album' do
      album = create(:album, user: user)
      expect {
        delete :destroy, id: album
      }.to change { Album.count }.by(-1)
    end

    it 'DELETE destroy redirect to albums path' do
      delete :destroy, id: album
      expect(response).to redirect_to(albums_path)
    end
  end
end
