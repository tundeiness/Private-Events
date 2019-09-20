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

    describe 'GET signin' do
        it 'renders :signin template' do
            get :signin
        expect(response).to render_template(:signin)
        end    
    end

    describe 'GET signup' do
        it 'renders :signup template' do
            get :signup
        expect(response).to render_template(:signup)
        end    
    end

end
