# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing to operator/home', type: :routing do
  it 'operator/home画面へのrouteがあること' do
    expect(get: '/operator').to route_to(controller: 'operator/home', action: 'index')
  end
end
