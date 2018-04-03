# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing to user/sessions', type: :routing do
  it 'user/login画面へのrouteがあること' do
    expect(get: '/user/login').to route_to(controller: 'user/sessions', action: 'new')
  end
  it '#POST user/loginへのrouteがあること' do
    expect(post: '/user/login').to route_to(controller: 'user/sessions', action: 'create')
  end
  it '#DELETE user/logoutへのrouteがあること' do
    expect(delete: '/user/logout').to route_to(controller: 'user/sessions', action: 'destroy')
  end
end
