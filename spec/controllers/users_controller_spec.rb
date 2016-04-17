# /spec/controllers/users_controller_spec.rb
require 'rails_helper'

describe UsersController do
  def mock_user(stubs = {})
    @mock_user ||= object_double(User.new, stubs)
  end

  describe 'GET new' do
    it 'assigns a new user as @user' do
      allow(User).to receive(:new).and_return(mock_user)
      get :new
      expect(assigns(:user)).to eq(mock_user)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      before(:each) do
        allow(User).to receive(:new).and_return(mock_user(save: true))
        post :create, :user => attributes_for(:user)
      end

      it 'assigns a newly created user as @user' do
        expect(assigns(:user)).to eq(mock_user)
      end

      it 'redirect to root path' do
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'with invalid params' do
      before(:each) do
        allow(User).to receive(:new).and_return(mock_user(save: false))
        post :create, :user => attributes_for(:user, :empty_params)
      end

      it 'not assigns a new user with empty params' do
        expect(assigns(:user)).to eq(mock_user)
      end

      it 're-render "new" template with empty params' do
        expect(response).to render_template(:new)
      end

      it 'not assigns a new user with invalid password' do
        expect(assigns(:user)).to eq(mock_user)
      end

      it 're-render "new" template with invalid password' do
        expect(response).to render_template(:new)
      end
    end
  end
end
