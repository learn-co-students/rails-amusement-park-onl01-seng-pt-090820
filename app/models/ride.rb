class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    
    def take_ride
        denials = []
        if self.user.tickets < self.attraction.tickets
            denials << "You do not have enough tickets to ride the #{attraction.name}."
        end 
        if self.user.height < self.attraction.min_height
            denials << "You are not tall enough to ride the #{attraction.name}."
        end
        if !denials.empty?
            notice = denials.unshift("Sorry.").join(" ")
        else
            self.user.update(tickets: self.user.tickets -= self.attraction.tickets)
            self.user.update(nausea: self.user.nausea += self.attraction.nausea_rating)
            self.user.update(happiness: self.user.happiness += self.attraction.happiness_rating)
            notice = "Thanks for riding the #{attraction.name}!"
        end
    end
end
