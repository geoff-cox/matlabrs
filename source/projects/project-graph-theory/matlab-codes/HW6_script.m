clear; clc; close all;

V = 1:6;
E = [
    1 2 1; 
    1 3 7; 
    1 4 6; 
    2 3 2; 
    3 4 8; 
    3 5 3; 
    4 5 4; 
    4 6 6; 
    5 6 4
    ];
G0 = HW6P5_construct_directed_graph(V, E, 'G0');
components = HW6P6_get_components(G0)
%% 
[distances, paths] = HW6P6_min_cost_paths(G0, 1)

%% 

V = 1:4;
E = [
    1, 2, 3;
    1, 3, 1;
    2, 4, 2;
    3, 4, 6
    ];
G1 = HW6P5_construct_directed_graph(V, E, 'G1');
[distances, paths] = HW6P6_min_cost_paths(G1, 1)
%% 

V = 1:3;
E = [
    1, 2, 5; 
    2, 3, 4
    ];
G2 = HW6P5_construct_directed_graph(V, E, 'G2');
[distances, paths] = HW6P6_min_cost_paths(G2, 2)
%% 

V = 1:3;
E = [];
G3 = HW6P5_construct_directed_graph(V, E, 'G3');
[distances, paths] = HW6P6_min_cost_paths(G3, 3)

%% 

V = 1:5;
E = [ 1 2; 
      2 3; 
      4 5 ];
G4 = HW6P5_construct_directed_graph(V, E, 'G4');
components = HW6P6_get_components(G4)

V = 1:3;
E = [ 1 2 5; 
      2 3 1; 
      1 3 7 ];
G5 = HW6P5_construct_directed_graph(V, E, 'G5');
components = HW6P6_get_components(G5)

V = 1:4;
E = [];
G6 = HW6P5_construct_directed_graph(V, E, 'G6');
components = HW6P6_get_components(G6)