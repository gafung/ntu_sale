class Reservation < ActiveRecord::Base
    belongs_to :user
    belongs_to :item

  validates :queue, uniqueness: { scope: :item, message: "Should not have duplicated queue position for one item!!" }

end
