# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing to admin/home', type: :routing do
  it 'admin/home画面へのrouteがあること' do
    expect(get: '/admin').to route_to(controller: 'admin/home', action: 'index')
  end
end
