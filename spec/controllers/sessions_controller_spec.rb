require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
<<<<<<< HEAD

=======
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
>>>>>>> 0d36ce64fa941d89f6dc182548d194166f04275a
end
