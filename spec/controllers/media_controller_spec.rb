# /spec/controllers/media_controller_spec.rb
require 'rails_helper'

describe MediaController, type: :controller do
  describe 'when no authenticated user' do
    let(:album) { build_stubbed(:album) }

    before(:each) do
      allow(Album).to receive(:find).and_return(album)
    end

    it 'GET new redirected to sign in path' do
      get :new, album_id: album
      expect(response).to redirect_to(sign_in_path)
    end

    it 'POST create redirected to sign in path' do
      post :create, media: attributes_for(:media), album_id: album
      expect(response).to redirect_to(sign_in_path)
    end

    it 'DELETE destroy redirected to sign in path' do
      media = build_stubbed(:media)
      allow(Media).to receive(:find).and_return(media)
      delete :destroy, id: media, album_id: album
      expect(response).to redirect_to(sign_in_path)
    end
  end

  describe 'when authenticated user' do
    setup :activate_authlogic

    let(:user) { create :user }

    before(:each) do
      UserSession.create(user)
      @album = create(:album, user: user)
      @media = create(:media, album: @album)
    end

    it 'GET new render template #new' do
      get :new, album_id: @album
      expect(response).to render_template(:new)
    end

    it 'POST #create uploads image to store' do
      expect { 
        post :create, media: attributes_for(:media), album_id: @album
      }.to change { Media.count }.by(1)
    end

    it 'POST #create redirected to album' do
      post :create, album_id: @album, media: attributes_for(:media)
      expect(response).to redirect_to(edit_album_path(@album))
    end

    it 'DELETE #destroy drops image from store' do
      expect { 
        delete :destroy, album_id: @album, id: @media 
      }.to change { Media.count }.by(-1)
    end

    it 'DELETE #destroy redirected to edit album path' do
      delete :destroy, album_id: @album, id: @media 
      expect(response).to redirect_to(edit_album_path(@album))
    end
  end
end
