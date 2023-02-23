require 'rails_helper'

RSpec.describe Comment, type: :model do
    it 'method update_comment_count gets an ArgumentError in call without parameters' do
        expect { Comment.update_comments_count() }.to raise_error(ArgumentError)
    end

    it 'method update_comments_count gets an array' do
        expect(Comment.update_comments_count(1)).to be_an(Array)
    end
end