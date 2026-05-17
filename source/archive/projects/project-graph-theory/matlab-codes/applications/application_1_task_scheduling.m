tasks = {'Task A', 'Task B', 'Task C', 'Task D', 'Task E'};

% Dependencies: A->B, A->C, B->D, C->D, D->E
edges = [
    1 2; 
    1 3; 
    2 4; 
    4 3; 
    4 5
    ]; 

G = HW6Px_construct_directed_graph(1:5, edges, 'Task Graph');

if HW6Px_is_DAG(G)
    G.topo_order = HW6Px_topological_sort(G);
else
    G.topo_order = [];
end

fprintf('Topological Order for Task Scheduling:\n');
disp(tasks(G.topo_order)); % Display tasks in execution order

% Expected Output for Task Scheduling
% Given the task dependencies:
% 
% A → B → D → E
% A → C → D → E