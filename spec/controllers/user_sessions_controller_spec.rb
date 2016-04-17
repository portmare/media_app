# /spec/controllers/user_sessions_controller_spec.rb
require 'rails_helper'

describe UserSessionsController do
  def mock_user_session(stubs={})
    @mock_user_session ||= double(UserSession, stubs).as_null_object
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
  end
end
