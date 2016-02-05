require 'rails_helper'

describe Preference, type: :model do
  it 'has name' do
    preference = create :preference

    expect(preference.name).to eq 'Vegetariana'
  end
end
