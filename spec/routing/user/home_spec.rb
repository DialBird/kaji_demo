# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing to user/home', type: :routing do
  it 'user/home画面へのrouteがあること' do
    expect(get: '/user').to route_to(controller: 'user/home', action: 'index')
  end
end
