namespace :db do

  desc 'Runs all seed files under seed folder'
  task seed: :environment do
    Studio::Util::Data::Seeder.run!
  end


end
