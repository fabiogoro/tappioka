require 'rails_helper'

describe Cuisine, type: :model do
  it 'has name' do
    cuisine = create :cuisine

    expect(cuisine.name).to eq 'Mineira'
  end
end
