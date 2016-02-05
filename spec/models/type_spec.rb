require 'rails_helper'

describe Type, type: :model do
  it 'has name' do
    type = create :type

    expect(type.name).to eq 'Sobremesa'
  end
end
