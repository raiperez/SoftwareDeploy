class SeriesActor < ApplicationRecord
	  belongs_to :actor, inverse_of: :series_actor
  	belongs_to :series, inverse_of: :series_actor
end