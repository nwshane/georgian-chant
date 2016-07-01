require 'rails_helper'

describe ChantsController do
  describe 'GET index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'assigns existing chants to @chants' do
      chant = FactoryGirl.create(:chant)
      chant2 = FactoryGirl.create(:chant)

      get :index

      expect(assigns(:chants)).to eq([chant, chant2])
    end
  end
end
