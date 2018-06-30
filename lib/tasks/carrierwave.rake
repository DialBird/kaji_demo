# frozen_string_literal: true

require 'carrierwave'
namespace :carrierwave do
  desc 'clear uploader cache files'
  task clean: :environment do
    CarrierWave.clean_cached_files!
  end
end
