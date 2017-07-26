# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

grades = %w(中１ 中２ 中3)
names = %w(船津 橘 リー 萬野 ワイルド)
(1..3).each do |num|
  names.each.with_index(1) do |_name, _i|
    User.create(name: _name, email: "user#{_i}@example.com", grade_id: num, present: '3', card_uuid: '')
  end
end

grades.each do |grade|
  Grade.create(name: grade)
end
