class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    
    def mood
        if self.happiness && self.nausea && self.happiness < self.nausea
            "sad"
        else
            "happy"
        end
    end

    def admin?
        if self.admin
            "ADMIN"
        end
    end
end
