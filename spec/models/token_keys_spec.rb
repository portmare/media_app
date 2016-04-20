# /spec/models/token_keys_spec.rb
require 'rails_helper'

describe TokenKey, type: :model do
  it 'created with valid attributes' do
    token = build(:token_key)
    expect(token).to be_valid
  end

  it 'empty token is not valid' do
    token = build(:token_key, token: nil)
    expect(token).to be_invalid
  end

  it 'empty access is not valid' do
    token = build(:token_key, access: nil)
    expect(token).to be_invalid
  end

  it 'default token key is cloded' do
    token = TokenKey.create(token: 'some key')
    expect(token.closed?).to eq(true)
  end
end
