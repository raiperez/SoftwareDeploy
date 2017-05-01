class SeriesDirector < ApplicationRecord
	  belongs_to :director, inverse_of: :series_director
  	belongs_to :series, inverse_of: :series_director
end