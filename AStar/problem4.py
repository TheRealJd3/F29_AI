from AStar import *

#problem 1
robot2 = []
matrix = GridWithWeights(4, 4,robot2)

#run to get paths
print("1st Robot Path")
came_from, cost_so_far = a_star_search(matrix, (0, 0), (1, 2))
draw_grid(matrix, width=3, point_to=came_from, start=(0, 0), goal=(1, 2),start2=(0,2),goal2=(1,0))
print()
draw_grid(matrix, width=3, number=cost_so_far, start=(0, 0), goal=(1, 2),start2=(0,2),goal2=(1,0))
print()
draw_grid(matrix, width=3, path=reconstruct_path(came_from, start=(0, 0), goal=(1,2)))
print()
path=reconstruct_path(came_from, start=(0, 0), goal=(1,2))

came_from, cost_so_far = a_star_search(matrix, (0, 2), (1, 0))
path2=reconstruct_path(came_from, start=(0, 2), goal=(1, 0))



pathCollision(matrix,path,path2)

#run to get simaltanious paths
print("2nd Robot Path")
came_from, cost_so_far = a_star_search(matrix, (0, 2), (1, 0))
draw_grid(matrix, width=3, point_to=came_from, start2=(0, 2), goal2=(1, 0),finished=(1,2))
print()
draw_grid(matrix, width=3, number=cost_so_far, start2=(0, 2), goal2=(1, 0),finished=(1,2))
print()
draw_grid(matrix, width=3, path=reconstruct_path(came_from, start=(0, 2), goal=(1, 0)))
print()

