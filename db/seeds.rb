Dir.glob(Rails.root.join('db/seeds/*.rb')).each { |f| load f }
