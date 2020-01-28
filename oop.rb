class Person
    attr_reader :age, :gender
    attr_accessor :name
    @@people = 0

    FREEZING_POINT = 0
    def initialize(name, age, gender)
      @name = name
      @age = age
      @gender = gender
      @@people += 1
    end

    def greet
        puts "hello #{@name}. Welcome!"
    end

    def people
        @@people
    end
end

class Soldier < Person
    attr_reader :rank
    def initialize(rank)
      super(Person)
      @rank = rank
    end
end

semiyu = Soldier.new('Abdulsamii', 21, 'M', 'General')

semiyu.greet
puts semiyu.inspect

puts semiyu.name
puts semiyu.age
puts semiyu.gender

ramota = Person.new('Akintola', 16, 'F')
puts ramota.people


family = %w[father, mother, children]
family.push('uncle')
puts family.inspect
family.freeze
f = family.dup
f.push('aunt')
ff = family.clone
ff.push('aunt') # this will throw an error

=begin
lowercase
UPPERCASE
camelCase
PascalCase
snake_case
=end
