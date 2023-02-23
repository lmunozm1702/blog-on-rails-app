require 'spec_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 2, title: 'Hello 1', text: 'This is my first post') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title length should be <= 250' do
    # rubocop:disable Layout/LineLength
    subject.title = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'
    # rubocop:enable Layout/LineLength
    expect(subject).to_not be_valid
  end

  it 'title can\'t be blank' do
    subject.title = ' '
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be integer' do
    subject.comments_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be >= 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be >= 0' do
    subject.comments_counter = 1
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'likes_counter must be >= 0' do
    subject.comments_counter = 1
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'likes must be integer' do
    subject.likes_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be >= 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'method get last_five_comments gets an ArgumentError in call without parameters' do
    expect { Post.last_five_comments }.to raise_error(ArgumentError)
  end

  it 'method get last_five_comments gets an array' do
    expect(Post.last_five_comments(1)).to be_an(Array)
  end

  it 'method update_user_count gets an ArgumentError in call without parameters' do
    expect { Post.update_user_count }.to raise_error(ArgumentError)
  end

  it 'method update_user_count gets an array' do
    expect(Post.update_user_count(1)).to be_an(Array)
  end
end
