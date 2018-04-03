# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing to user/users', type: :routing do
  it 'アカウント詳細画面へのrouteがあること' do
    expect(get: '/user/account').to route_to(controller: 'user/user', action: 'show')
  end
  it 'アカウント編集画面へのrouteがあること' do
    expect(get: '/user/edit').to route_to(controller: 'user/user', action: 'edit')
  end
  it '#PUT user/accountへのrouteがあること' do
    expect(put: '/user/account').to route_to(controller: 'user/user', action: 'update')
  end
end
