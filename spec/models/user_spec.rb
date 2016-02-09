require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has email' do
    user = create :user

    expect(user.email).to eq 'fabiogo@outlook.com'
  end
end
