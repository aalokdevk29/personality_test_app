# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.find_by_email('test@example.com')
  user = User.new(
    email: 'test@example.com',
    password: '123456'
  )
  user.save!
end

question1 = Question.create(body: "Given the choice, I would prefer to: ")
question2 = Question.create(body: "At parties I: ")
question3 = Question.create(body: "When I have free time I: ")
question4 = Question.create(body: "All things being equal, I: ")
question5 = Question.create(body: "When I go out socially, it's usually with a large group of friends. ")

question1.question_options.create(body: "get acquainted with a lot of people and become friends with as many as I can manage. ", personlity_type: "Extrovert")
question1.question_options.create(body: "get acquainted with a lot of people and become friends with a few. ", personlity_type: "Introvert")
question1.question_options.create(body: "get acquainted with some people and become intimate friends with a chosen few. ", personlity_type: "Extrovert")
question1.question_options.create(body: "have one or two very intimate friends, without getting acquainted with very many people. ", personlity_type: "Introvert")

question2.question_options.create(body: "almost always leave as soon as I can. ", personlity_type: "Extrovert")
question2.question_options.create(body: "usually leave as soon as I can. ", personlity_type: "Introvert")
question2.question_options.create(body: "sometimes leave earlier than I have to", personlity_type: "Extrovert")
question2.question_options.create(body: "usually stay as late as I can. ", personlity_type: "Introvert")

question3.question_options.create(body: "almost always prefer to do something with others. ", personlity_type: "Extrovert")
question3.question_options.create(body: "usually prefer to do something with others. ", personlity_type: "Introvert")
question3.question_options.create(body: "sometimes like to be with others but also enjoy spending time by myself. ", personlity_type: "Extrovert")
question3.question_options.create(body: "usually prefer to spend time alone. ", personlity_type: "Introvert")

question4.question_options.create(body: "almost always prefer working in a team. ", personlity_type: "Extrovert")
question4.question_options.create(body: "usually prefer working in a team. ", personlity_type: "Introvert")
question4.question_options.create(body: "enjoy both teamwork and working alone. ", personlity_type: "Extrovert")
question4.question_options.create(body: "usually prefer working alone. ", personlity_type: "Introvert")

question5.question_options.create(body: "Most of the time", personlity_type: "Extrovert")
question5.question_options.create(body: "Often", personlity_type: "Introvert")
question5.question_options.create(body: "Sometimes", personlity_type: "Extrovert")
question5.question_options.create(body: "Rarely", personlity_type: "Introvert")