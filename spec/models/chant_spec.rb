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
    it 'validates presence' do
      chant.title = nil

      chant.valid?

      expect(chant.errors[:title].length).to eq(1)
    end

    it 'validates uniqueness' do
      FactoryGirl.create(:chant, title: chant.title)

      chant.valid?

      expect(chant.errors[:title].length).to eq(1)
    end
  end
end
