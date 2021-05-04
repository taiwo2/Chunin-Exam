require "rails_helper"

RSpec.describe Admin::UserController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/user').to route_to('user#index')
    end

    it 'routes to #show' do
      expect(get: '/user/1').to route_to('user#show', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/user/1').to route_to('user#destroy', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/user/1/edit').to route_to('user#edit', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/user/1').to route_to('admin/user#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/user/1').to route_to('user#update', id: '1')
    end
  end
end
