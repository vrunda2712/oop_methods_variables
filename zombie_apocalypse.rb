class Zombie

  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed,strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end

    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
  end

  def encounter
    if outrun_zombie?
      "Got away"
    elsif survive_attack?
      zombie_speed = rand(@@max_speed)
      zombie_strength = rand(@@max_strength)
      @@horde << Zombie.new(zombie_speed, zombie_strength)
      "New Zombie"
    else
      "Died Zombie"
    end
  end

  def outrun_zombie?
    if rand(@@max_speed) > @speed
      true
    else
      false
    end
  end

  def survive_attack?
    if rand(@@max_strength) > @strength
      true
    else
      false
    end
  end

  def self.all
    @@horde
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def self.some_die_off
    die = rand(11)
    die.times do
      index = rand(@@horde.length)
      @@horde.delete_at(index)
    end
  end

  def self.spawn
    new_zombies = rand(@@plague_level)

    new_zombies.times do
      speed = rand(@@max_speed)
      strength = rand(@@max_strength)

      @@horde << Zombie.new(speed,strength)
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(2)
  end

end


puts Zombie.all.inspect
Zombie.new_day
puts
puts Zombie.all.inspect
puts
Zombie1 = Zombie.all[0]
Zombie2 = Zombie.all[1]
Zombie3 = Zombie.all[2]
puts Zombie1.encounter
puts Zombie2.encounter
puts Zombie3.encounter
Zombie.new_day
puts
puts Zombie.all.inspect
puts
