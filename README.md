# DFS and Best-first search implemented in Prolog. 

This is a working implementation of the DFS and Best-first search algorithms in Prolog. The program searches for a route to be taken from one city to another by applying the mentioned algorithms. All the distances form one city to another are given as predicates in `final.pl`. Separate working models for DFS and BFS (best-first search) can be found in `sep_models/`.
This was part of an assignment for Artificial Intelligence course at IIIT Delhi. The data for distacnes between cities as a CSV is in `roaddistance.csv`, and the assignment problem statement is in `problem.pdf`.

### DFS explanation

The DFS algorithms works as following :
```
DFS(G,v)   ( v is the vertex where the search starts )
	 Stack S := {};   ( start with an empty stack )
	 for each vertex u, set visited[u] := false;
	 push S, v;
	 while (S is not empty) do
	    u := pop S;
	    if (not visited[u]) then
	       visited[u] := true;
	       for each unvisited neighbour w of u
	          push S, w;
	    end if
	 end while
 END DFS()
```

### BFS(Best-first search) algorithm

The BFS algorithms works as following :
```
Best-First-Search(Graph g, Node start)
    1) Create an empty PriorityQueue
       PriorityQueue pq;
    2) Insert "start" in pq.
       pq.insert(start)
    3) Until PriorityQueue is empty
          u = PriorityQueue.DeleteMin
          If u is the goal
             Exit
          Else
             Foreach neighbor v of u
                If v "Unvisited"
                    Mark v "Visited"                    
                    pq.insert(v)
             Mark u "Examined"                    
End procedure
```

A simpler explanation is :
1. Visit a node
2. Find all its neighbors and their corresponding heuristics
3. Visit the neighbour with the minimum heuristic.