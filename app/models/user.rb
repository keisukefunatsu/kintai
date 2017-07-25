class User < ApplicationRecord
  has_many :in_dates, dependent: :destroy
  has_many :out_dates, dependent: :destroy
  paginates_per 15

  def self.reset_status
    all.update_all(present: '3')
  end
end
