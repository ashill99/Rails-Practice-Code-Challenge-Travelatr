class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts

    def avg_blogger_age
        self.bloggers.average(:age) do |blogger|
            blogger.age 
        end 
    end 
end

