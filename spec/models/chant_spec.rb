require 'rails_helper'

describe Chant do
  let(:chant) { FactoryGirl.build(:chant) }

  context 'with minimum required attributes' do
    it 'is valid' do
      chant.valid?

      expect(chant).to be_valid
    end
  end

  describe '#title' do
    it 'presence is validated' do
      chant.title = nil

      chant.valid?

      expect(chant.errors[:title].length).to eq(1)
    end
  end
end
