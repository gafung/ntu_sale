class Item < ActiveRecord::Base
    has_many :reservations
    has_many :users, through: :reservations

    def position(reservations)
        result=reservations.find_by(item: self)
        if result.nil?
            false
        else
            result.queue
        end
    end
end
