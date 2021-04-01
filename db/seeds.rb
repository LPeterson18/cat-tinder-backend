# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cats = [
  {
    name: 'Mittens',
    age: 5,
    enjoys: 'sunshine and warm spots',
    profile_pic:
      'https://images.unsplash.com/photo-1574158622682-e40e69881006?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80',
  },
  {
    name: 'Raisins',
    age: 4,
    enjoys: 'being queen of the dogs',
    profile_pic:
      'https://images.unsplash.com/photo-1500259571355-332da5cb07aa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
  },
  {
    name: 'Toast',
    age: 1,
    enjoys: 'getting all the attention',
    profile_pic:
      'https://images.unsplash.com/photo-1513245543132-31f507417b26?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80',
  },
  {
    name: 'Trashcan',
    age: 9,
    enjoys: 'sleeping by the trash',
    profile_pic:
      'https://images.unsplash.com/photo-1493406300581-484b937cdc41?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80',
  },
  {
    name: 'Mila',
    age: 3,
    enjoys: 'walking over laptops while youre working',
    profile_pic:
      'https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
  },

]

cats.each do |cat|
  Cat.create cat
  puts "Created cat: #{cat}"
end