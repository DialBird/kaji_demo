# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing to staff/home', type: :routing do
  it 'staff/home画面へのrouteがあること' do
    expect(get: '/staff').to route_to(controller: 'staff/home', action: 'index')
  end
end
