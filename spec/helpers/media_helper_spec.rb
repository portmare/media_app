# /spec/helpers/media_helper_spec.rb
require 'rails_helper'

describe MediaHelper, type: :helper do
  describe '#link_to_delete' do
    helper do
      def current_user
        false
      end
    end

    let(:media) { create(:media) }

    it 'displays for authenticated user' do
      allow(helper).to receive(:current_user).and_return(true)
      expect(helper.link_to_delete(media)).to match /<a (.*)Delete<\/a>/
    end

    it 'return nil for not authenticated user' do
      expect(helper.link_to_delete(media)).to be_nil
    end
  end
end
