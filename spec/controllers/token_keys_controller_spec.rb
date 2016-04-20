# /spec/controllers/token_keys_controller_spec.rb
require 'rails_helper'

describe TokenKeysController, type: :controller do
  let(:token) { build_stubbed(:token_key) }
  let(:album) { build_stubbed(:album) }

  describe 'with anonymous user' do
    before(:each) do
      allow(TokenKey).to receive(:find_by).and_return(token)
      allow(token).to receive(:tokenable).and_return(album)
    end

    context 'GET show with valid token' do
      it 'and shared resource render resources #show template' do
        allow(token).to receive(:shared?).and_return(true)
        get :show, token: token.token
        expect(response).to render_template('albums/show')
      end

      it 'and closed resource redirected to root path' do
        allow(token).to receive(:shared?).and_return(false)
        get :show, token: token.token
        expect(response).to redirect_to(root_path)
      end
    end

    context 'GET show with invalid token' do
      it 'redirect to root path' do
        get :show, token: 'some token string'
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'with authenticated user' do
    setup :activate_authlogic

    before(:each) do
      UserSession.create(build(:user))
    end

    it 'GET show with valid token redirected to root path' do
      get :show, token: token.token
      expect(response).to redirect_to(root_path)
    end

    it 'GET show with invalid token redirected to root path' do
      get :show, token: 'some token string'
      expect(response).to redirect_to(root_path)
    end
  end
end
