
from pddlstream.algorithms.search import Pddl_Domain
from pddlstream.language.constants import And,Or,Type,Not,ForAll,Exists
import os


# Load domain.pddl
domain_pddl = Pddl_Domain(os.path.dirname(__file__)+'/pacman_bool.pddl')

###
# Solve problem from problem.pddl
###

plan,cost = domain_pddl.solve_from_file(os.path.dirname(__file__)+'/test_problem.pddl',planner = "ff-astar")
print("Plan from file:",plan)
print("Cost:",cost)

###
# Solve PDDL problem described in python.
###

#  Describe problem in python. 
foods = ['f1','f2','f3']
objects = [Type(x,"object") for x in foods] # Hint Use Type "object" for all none type objects.
init = [
    ('at_home',),
    ("enemy_at_home",)
    ] + [("food_at_playground", x) for x in foods]

temp_goal = [("food_gained",x) for x in foods] + [Not(("enemy_at_home",))]
goal =  And(*temp_goal)
print(goal)

#solve problem
plan, cost = domain_pddl.solve(objects,init, goal,planner="ff-astar",debug=False)
print('Plan from python:', plan)
print('Cost:', cost)

goal =  And([("have","o2"),("no_money")])


