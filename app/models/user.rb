class User < ApplicationRecord
  has_many :in_dates
  has_many :out_dates
  paginates_per 15
end
