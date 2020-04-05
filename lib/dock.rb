class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    rental_log[boat] = renter
  end

  def charge(boat)
    correct_amount = what_to_charge(boat)
    total_charge = {:card_number => @rental_log[boat].credit_card_number, :amount => correct_amount}
  end

  def what_to_charge(boat)
    if (boat.hours_rented * boat.price_per_hour) < (boat.price_per_hour * max_rental_time)
      (boat.hours_rented * boat.price_per_hour)
    else
      (boat.price_per_hour * max_rental_time)
    end
  end

end
