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
        get :edit, id: album.id
        expect(response).to redirect_to(sign_in_path)
      end

      it 'PATCH update redirected to sign in path' do
        patch :update, id: album.id
        expect(response).to redirect_to(sign_in_path)
      end

      it 'DELETE destroy redirected to sign in path' do
        delete :destroy, id: album.id
        expect(response).to redirect_to(sign_in_path)
      end
    end

    describe 'without token key' do
      it 'GET show redirected to sign in path' do
        get :show, id: album.id
        expect(response).to redirect_to(sign_in_path)
      end
    end
  end
end
