class ReservationsController < ApplicationController
    def create
        item_id = params[:ii]
        cu = session[:current_user]['id']
        np = Reservation.where(item_id: item_id).count + 1
        Reservation.create(queue: np, user: User.find(cu), item: Item.find(item_id))
        redirect_to root_url
    end
end
