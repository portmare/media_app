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
      it 'assigns a newly created user as @user' do
        allow(User).to receive(:new).and_return(mock_user(save: true))
        post :create, :user => attributes_for(:user)
        expect(assigns(:user)).to eq(mock_user)
      end

      it 'redirect to root path' do
        allow(User).to receive(:new).and_return(mock_user(save: true))
        post :create, :user => attributes_for(:user)
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'with invalid params' do
      it 'not assigns a new user with empty params' do
        allow(User).to receive(:new).and_return(mock_user(save: false))
        post :create, :user => attributes_for(:user, :empty_params)
        expect(assigns(:user)).to eq(mock_user)
      end

      it 're-render "new" template with empty params' do
        allow(User).to receive(:new).and_return(mock_user(save: false))
        post :create, :user => attributes_for(:user, :empty_params)
        expect(response).to render_template(:new)
      end

      it 'not assigns a new user with invalid password' do
        allow(User).to receive(:new).and_return(mock_user(save: false))
        post :create, :user => attributes_for(:user, :different_password)
        expect(assigns(:user)).to eq(mock_user)
      end

      it 're-render "new" template with invalid password' do
        allow(User).to receive(:new).and_return(mock_user(save: false))
        post :create, :user => attributes_for(:user, :empty_params)
        expect(response).to render_template(:new)
      end
    end
  end
end
