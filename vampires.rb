class Vampire

  @@coven = []

  attr_accessor :name,:age
  attr_reader :in_coffin, :drank_blood_today

  def initialize(name,age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def self.create(name,age)
    new_vampire = Vampire.new(name,age)
    @@coven << new_vampire
    new_vampire
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.sunrise
    @@coven.each do |vampire|
      if vampire.in_coffin == false || vampire.drank_blood_today == false
        @@coven.delete(vampire)
      end
    end
    @@coven
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.in_coffin == false
      vampire.drank_blood_today == false
    end
  end

  def go_home
    @in_coffin = true
  end

  def self.all
    @@coven
  end

end


vampire1 = Vampire.create("blade",200)
vampire2 = Vampire.create("selene",150)

puts vampire1.inspect
puts vampire2.inspect
puts
puts Vampire.sunset
puts Vampire.all.inspect
puts
puts vampire2.go_home
puts vampire1.drink_blood
puts
puts Vampire.all.inspect
puts Vampire.sunrise
puts
puts Vampire.all.inspect
