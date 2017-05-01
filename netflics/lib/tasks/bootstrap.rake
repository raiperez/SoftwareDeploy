namespace :bootstrap do
      desc "Add the defaults Series"
      task :default_series => :environment do
        series = Series.create( :genre => 2, :country => 3, :language => 5, :summary => 'Discover what happens in the life of a school teacher when he discovers he has cancer.', :name => "Breaking Bad")
        season = Season.create( :year => 2015, :number => 1, :summary => 'This is the first season of the amazing story of Walter White.', :series_id => series.id )
        Episode.create( :name => "Pilot", :length => 40, :number => 1, :summary => 'Inmerse yourself in the life of the common school teacher when he discovers some terrible news.', :season_id => season.id )
      end

      desc "Run all bootstrapping tasks"
      task :all => [:default_series]
    end