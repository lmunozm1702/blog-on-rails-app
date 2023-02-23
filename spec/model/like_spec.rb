require 'rails_helper'

RSpec.describe Like, type: :model do
    it 'method update_likes_count gets an ArgumentError in call without parameters' do
        expect { Like.update_likes_count() }.to raise_error(ArgumentError)
    end

    it 'method update_likes_count gets an array' do
        expect(Like.update_likes_count(1)).to be_an(Array)
    end
end