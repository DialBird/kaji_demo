# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing to home', type: :routing do
  it 'Home画面へのrouteがあること' do
    expect(get: '/').to route_to(controller: 'home', action: 'index')
  end
end
