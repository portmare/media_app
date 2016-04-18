# /spec/controllers/user_session_controller_spec.rb
require 'rails_helper'

describe UserSessionController do
  def mock_user_session(stubs={})
    @mock_user_session ||= double(UserSession, stubs)
  end

  describe 'when no user authenticated' do
    before(:each) do
      allow(UserSession).to receive(:find).and_return(false)
    end

    describe 'GET new' do
      it 'assigns a new session of user as @user_session' do
        allow(UserSession).to receive(:new).and_return(mock_user_session)
        get :new
        expect(assigns(:user_session)).to eq(mock_user_session)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        before(:each) do 
          allow(UserSession).to receive(:new).and_return(mock_user_session(save: true))
          post :create, user_session: { email: 'ronaldo@fifa.com', password: 'iamthebestsoccer' }
        end

        it 'assigns a new session' do
          expect(assigns(:user_session)).to eq(mock_user_session)
        end

        it 'redirect code is 302' do
          expect(response).to redirect_to(root_path)
        end
      end

      describe 'with invalid params' do
        before(:each) do
          allow(UserSession).to receive(:new).and_return(mock_user_session(save: false))
          post :create, user_session: { email: 'ronaldo@fifa.com', password: 'iamnothebestsoccer' }
        end

        it 'not assigns a new session' do
          expect(assigns(:user_session)).to eq(mock_user_session)
        end

        it 're-render new session form' do
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'DELETE destroy' do
      it 'fails to load' do
        delete :destroy
        expect(response).not_to be_success
      end

      it 'redirect to sign in path' do
        delete :destroy
        expect(response).to redirect_to(sign_in_path)
      end
    end
  end

  describe 'when user authenticated' do
    setup :activate_authlogic

    before(:each) do
      UserSession.create(build(:user))
    end

    describe 'GET new' do
      it 'fails to load' do
        get :new
        expect(response).not_to be_success
      end

      it 'redirected to root path' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'POST create' do
      it 'fails to load' do
        post :create
        expect(response).not_to be_success
      end

      it 'redirected to root path' do
        post :create
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'DELETE destroy' do
      it 'destroys user session' do
        allow(UserSession).to receive(:find).and_return(mock_user_session)
        allow(mock_user_session).to receive(:user).and_return(true)
        expect(mock_user_session).to receive(:destroy)
        delete :destroy
      end

      it 'redirect to root path' do
        delete :destroy
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
