class Group < ApplicationRecord
    has_many :concerts, :dependent => :destroy
   
    enum membersgender: [:Man, :Woman, :Band]

    def to_s
        name
    end

    def total_concerts #total conciertos
        concerts.where(group_id: id).count
    end

    def attendance #asistentes
        concerts.where(group_id: id).map{|concert| concert.public}.sum
    end

    def last_concert #ultimo concierto
        concerts.where(group_id: id).map{|concert| concert.concert_date.strftime("%Y:%B:%A")}.last
    end

    def max_people #max de personas en un concierto
        concerts.pluck(:public).max
    end

    def max_duration #duracion max de un concierto
        concerts.pluck(:duration).max
    end


end
