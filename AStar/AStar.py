from ast import literal_eval
import math

# utility functions for dealing with square grids
def from_id_width(id, width):
    return (id % width, id // width)


def draw_tile(graph, id, style, width):
    r = "."
    if 'number' in style and id in style['number']: r = "%d" % style['number'][id]
    if 'point_to' in style and style['point_to'].get(id, None) is not None:
        (x1, y1) = id
        (x2, y2) = style['point_to'][id]
        if x2 == x1 + 1: r = "\u2192"
        if x2 == x1 - 1: r = "\u2190"
        if y2 == y1 + 1: r = "\u2193"
        if y2 == y1 - 1: r = "\u2191"
    if 'start' in style and id == style['start']: r = "R1"
    if 'goal' in style and id == style['goal']: r = "G1"
    if 'start2' in style and id == style['start2']: r = "R2" #2nd robot start
    if 'goal2' in style and id == style['goal2']: r = "G2"  #2nd robot goal
    if 'path' in style and id in style['path']: r = "@" 
    if 'finished' in style and id == style['finished']: r = "R1"
    if id in graph.walls: r = "#" 
    return r

def draw_grid(graph, width=2, **style):
    for y in range(graph.height):
        for x in range(graph.width):
            print("%%-%ds" % width % draw_tile(graph, (x, y), style, width), end="")
        print()


class SquareGrid:
    def __init__(self, width, height,robot2):
        self.width = width
        self.height = height
        self.walls = []
        self.robot2 = robot2
    
    
    
    def in_bounds(self, id):
        (x, y) = id
        return 0 <= x < self.width and 0 <= y < self.height
    
    def passable(self, id):
        return id not in self.walls

    def avoidRobot(self, id): #avoid robot coordinates
        return id not in self.robot2    
    
    def neighbors(self, id):
        (x, y) = id
        results = [(x+1, y), (x, y-1), (x-1, y), (x, y+1)]
        if (x + y) % 2 == 0: results.reverse() # aesthetics
        results = filter(self.in_bounds, results)
        results = filter(self.passable, results)
        results = filter(self.avoidRobot, results)#to avoid colliding with the other robot
        return results

class GridWithWeights(SquareGrid):
    def __init__(self, width, height,robot2):
        super().__init__(width, height,robot2)
        self.traps = {}
    
    def cost(self, from_node, to_node): #consider traps
        return self.traps.get(to_node, 1)

    def setRobot2(self,robot):
    	self.robot2 = robot    


import heapq

class PriorityQueue:
    def __init__(self):
        self.elements = []
    
    def empty(self):
        return len(self.elements) == 0
    
    def put(self, item, priority):
        heapq.heappush(self.elements, (priority, item))
    
    def get(self):
        return heapq.heappop(self.elements)[1]


def reconstruct_path(came_from, start, goal):
    current = goal
    path = [current]
    while current != start:
        current = came_from[current]
        path.append(current)
    path.append(start) # optional
    path.reverse() # optional   
    return path 

#this function takes in both paths of the robots and checks collision at a particular step
def pathCollision(graph,path,path2):
	minimum = min(len(path),len(path2)) #gets shortest list
	graph.robot2=[]
	for x in range(0,minimum):
		if(path2[x] == path[x]): #check if any of the step matches
			graph.robot2.append(path[x]) #if match avoid


def heuristic(a, b):
    (x1, y1) = a
    (x2, y2) = b
    return abs(x1 - x2) + abs(y1 - y2)

def euclideanHeuristic(a, b):
    (x1, y1) = a
    (x2, y2) = b
    c = ((x2-x1)**2) + ((y2-y1)**2)
    return math.sqrt(c)

def a_star_search(graph, start, goal):
    frontier = PriorityQueue()
    frontier.put(start, 0)
    came_from = {}
    cost_so_far = {}
    came_from[start] = None
    cost_so_far[start] = 0
    
    while not frontier.empty():
        current = frontier.get()
       
        if current == goal:
            break
        for next in graph.neighbors(current):
            new_cost = cost_so_far[current] + graph.cost(current, next)
            if next not in cost_so_far or new_cost < cost_so_far[next]:
                cost_so_far[next] = new_cost
                priority = new_cost + heuristic(goal, next) #change heuristic here
                frontier.put(next, priority)
                came_from[next] = current

    return came_from, cost_so_far

  





