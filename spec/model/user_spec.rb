#require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Luis', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Microverse.', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name can\'t be blank' do
    subject.name = ' '
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be integer' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be >= 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be >= 0' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'method get 3 posts for user gets an ArgumentError in call without parameters' do
    expect { User.last_three_posts }.to raise_error(ArgumentError)
  end

  it 'method get 3 posts for user gets an array' do
    expect(User.last_three_posts(1)).to be_an(Array)
  end
end
