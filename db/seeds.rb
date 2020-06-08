require_relative( "../models/member")
require_relative( "../models/gym_class")

require( "pry" )

GymClass.delete_all()
# Member.delete_all()

gymclass1 = GymClass.new({
    "time" => "12:00pm",
    "capacity" => 10,
    "class_name" => "Serious Squats!"
})

gymclass1.save()

gymclass2 = GymClass.new({
    "time" => "1:00pm",
    "capacity" => 5,
    "class_name" => "Drop Dead Lifts!"
})

gymclass2.save()

gymclass3 = GymClass.new({
    "time" => "2:30pm",
    "capacity" => 15,
    "class_name" => "Ding Dong put the tea on, Kettlebells!"
})

gymclass3.save()


member1 = Member.new({
    "first_name" => "Mr.",
    "last_name" => "Tea'n'cake"
})

member1.save()

member2 = Member.new({
    "first_name" => "Robert",
    "last_name" => "Bruce"
})

member2.save()

member3 = Member.new({
    "first_name" => "Upside",
    "last_name" => "Down"
})

member3.save()