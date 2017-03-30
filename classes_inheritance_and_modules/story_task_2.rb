require_relative 'task_2'

frodo = Hobbit.new
sam= Hobbit.new
merry = Hobbit.new
pippin = Hobbit.new
aragorn = Human.new
boromir = Human.new
legolas = Elf.new
gimli = Dwarf.new
gandalf = Mayar.new
azog = Orc.new
saruman = Mayar.new

frodo.name = 'Frodo'
sam.name = 'Sam'
merry.name = 'Merry'
pippin.name = 'Pippin'
aragorn.name = 'Aragorn'
boromir.name = 'Boromir'
legolas.name = 'Legolas'
gimli.name = 'Gimli'
gandalf.name = 'Gandalf'
azog.name = 'Azog'
saruman.name = 'Saruman'


puts "Author: So, the Fellowship of the Ring contains: #{
    frodo.name + ', ' + sam.name + ', ' + merry.name + ', ' + pippin.name + ', ' + aragorn.name + ', ' +
    + boromir.name + ', ' + legolas.name + ', ' + gimli.name + ', ' + gandalf.name
  }"
frodo.receive_ring
puts 'Author: And they left Rivendale'

boromir.ask_about_ring(aragorn)
aragorn.has_ring?
boromir.ask_about_ring(frodo)
frodo.has_ring?
legolas.what_weapon(gimli)
azog.kill_char(boromir)

frodo.is_good?(saruman)
saruman.become_evil
frodo.is_good?(saruman)