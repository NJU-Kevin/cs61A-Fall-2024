"""from ants import *

beehive, layout = Hive(AssaultPlan()), dry_layout
dimensions = (1, 9)
gamestate = GameState(beehive, ant_types(), layout, dimensions)
# Testing Slow
slow = SlowThrower()
bee = Bee(3)
gamestate.places["tunnel_0_0"].add_insect(slow)
gamestate.places["tunnel_0_5"].add_insect(bee)
slow.action(gamestate) # slow throws syrup at bee
gamestate.time = 1
bee.action(gamestate)
print(bee.place.name)
print(slow.slowed_bees)
gamestate.time += 1
bee.action(gamestate)
print(bee.place.name)
print(slow.slowed_bees)# slow causes slowness when gamestate.time is odd. bee should take no action (moving or stinging)
slow.action(gamestate)
for _ in range(5):
    gamestate.time += 1
    bee.action(gamestate)
    print(bee.place.name)
    print(slow.slowed_bees)"""
"""
from ants import *
beehive, layout = Hive(AssaultPlan()), dry_layout
dimensions = (1, 9)
gamestate = GameState(beehive, ant_types(), layout, dimensions)
# Testing normal Bee movement after Slow effect
slow = SlowThrower()
bee = Bee(3)
gamestate.places["tunnel_0_0"].add_insect(slow)
gamestate.places["tunnel_0_8"].add_insect(bee)
slow.action(gamestate) # slow throws syrup at bee
gamestate.time = 0
bee.action(gamestate) # Even time, bee should move
print(bee.place.name)
print(slow.slowed_bees)
'tunnel_0_7'
gamestate.time = 1
bee.action(gamestate) # Odd time, bee should not move
print(bee.place.name)
print(slow.slowed_bees)
'tunnel_0_7'
gamestate.time = 2
bee.action(gamestate) # Even time, bee should move
print(bee.place.name)
print(slow.slowed_bees)
'tunnel_0_6'
gamestate.time = 3
bee.action(gamestate) # Odd time, bee should not move
print(bee.place.name)
print(slow.slowed_bees)
'tunnel_0_6'
gamestate.time = 4
bee.action(gamestate) # Even time, bee should move
print(bee.place.name)
print(slow.slowed_bees)
'tunnel_0_5'
gamestate.time = 5
bee.action(gamestate) # Slow effect ends, bee should move normally
print(bee.place.name)
print(slow.slowed_bees)
'tunnel_0_5'"""

from ants import *
beehive, layout = Hive(AssaultPlan()), dry_layout
dimensions = (1, 9)
gamestate = GameState(beehive, ant_types(), layout, dimensions)
laser = LaserAnt()
ant = HarvesterAnt(2)
bee1 = Bee(2)
bee2 = Bee(2)
bee3 = Bee(2)
bee4 = Bee(2)
gamestate.places["tunnel_0_0"].add_insect(laser)
gamestate.places["tunnel_0_0"].add_insect(bee4)
gamestate.places["tunnel_0_3"].add_insect(bee1)
gamestate.places["tunnel_0_3"].add_insect(bee2)
gamestate.places["tunnel_0_4"].add_insect(ant)
gamestate.places["tunnel_0_5"].add_insect(bee3)
print(laser.insects_in_front())
laser.action(gamestate)
print(bee4.health)