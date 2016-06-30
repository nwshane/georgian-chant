require 'rails_helper'

describe Chant do
  context 'with minimum required attributes' do
    it 'is valid' do
      chant = FactoryGirl.build(:chant)

      chant.save!

      expect(chant).to be_valid
    end
  end
end
