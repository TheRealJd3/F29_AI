from AStar import *

#problem 1
robot2 = []
matrix = GridWithWeights(8, 5,robot2)
matrix.walls = [(0,2), (2, 0), (3, 0), (3, 1), (3, 3), (4, 3),(5,1),(7,1)]
matrix.traps = {loc: 6 for loc in [(3,2)]} #traps

#run 1st robot and show and get its path
print("1st Robot Path")
came_from, cost_so_far = a_star_search(matrix, (0, 4), (5, 2))
draw_grid(matrix, width=3, point_to=came_from, start=(0, 4), goal=(5, 2),start2=(6,0),goal2=(2,4))
print()
draw_grid(matrix, width=3, number=cost_so_far, start=(0, 4), goal=(5, 2))
print()
draw_grid(matrix, width=3, path=reconstruct_path(came_from, start=(0, 4), goal=(5,2)))
print()
path=reconstruct_path(came_from, start=(0, 4), goal=(5,2))

#run 2nd robot and get path
came_from, cost_so_far = a_star_search(matrix, (6, 0), (2, 4))
path2=reconstruct_path(came_from, start=(6, 0), goal=(2, 4))

#check for collisions
pathCollision(matrix,path,path2)

#run 2nd robot again with collisions avoided
print("2nd Robot Path")
came_from, cost_so_far = a_star_search(matrix, (6, 0), (2, 4))
draw_grid(matrix, width=3, point_to=came_from, start2=(6, 0), goal2=(2, 4))
print()
draw_grid(matrix, width=3, number=cost_so_far, start2=(6, 0), goal2=(2, 4))
print()
draw_grid(matrix, width=3, path=reconstruct_path(came_from, start=(6, 0), goal=(2, 4)))
print()


