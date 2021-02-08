class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    has_secure_password
    
    def mood
        if !self.admin
            if self
                if self.nausea > self.happiness
                    "sad"
                else
                    "happy"
                end
            end
        else
            @admin = "ADMIN"
        end 
    end
    
end
