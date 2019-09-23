require 'rails_helper'

describe LandingPagesController do

    describe 'GET home' do
        it 'renders :home template' do
            get :home
        expect(response).to render_template(:home)
        end
    end

    describe 'GET event' do
        it 'renders :event template' do
            get :event
        expect(response).to render_template(:event)
        end
    end

end
