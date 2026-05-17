% Supply Chain Optimization Data Simulation
clear; clc; close all;

% Parameters
num_suppliers = 7;   % Number of suppliers
num_factories = 12;  % Number of factories
num_stores = 37;     % Number of stores
min_cost = 500;      % Minimum transportation cost
max_cost = 2800;     % Maximum transportation cost

% Generate node IDs for suppliers, factories, and stores
supplier_ids = strcat("S", string(1:num_suppliers));
factory_ids = strcat("F", string(1:num_factories));
store_ids = strcat("T", string(1:num_stores));

% Generate transportation costs
% Suppliers -> Factories
supply_to_factory = randi([min_cost, max_cost], num_suppliers, num_factories);

% Factories -> Stores
factory_to_store = randi([min_cost, max_cost], num_factories, num_stores);

% Generate capacities and demands
supplier_capacity = randi([500, 1000], num_suppliers, 1); % Units suppliers can provide
factory_capacity = randi([300, 700], num_factories, 1);   % Units factories can process
store_demand = randi([100, 400], num_stores, 1);          % Units stores require

% Combine all data into a realistic table
% Create edges from suppliers to factories
edges_sf = table;
edges_sf.Source = repmat(supplier_ids', num_factories, 1);
edges_sf.Destination = repelem(factory_ids', num_suppliers, 1);
edges_sf.Cost = supply_to_factory(:);
edges_sf.Capacity = repelem(supplier_capacity, num_factories);

% Create edges from factories to stores
edges_fs = table;
edges_fs.Source = repmat(factory_ids', num_stores, 1);
edges_fs.Destination = repelem(store_ids', num_factories, 1);
edges_fs.Cost = factory_to_store(:);
edges_fs.Capacity = repelem(factory_capacity, num_stores);

% Combine all edges
edges = [edges_sf; edges_fs];

% Generate node information
nodes = table;
nodes.Node = [supplier_ids'; factory_ids'; store_ids'];
nodes.Type = [repmat("Supplier", num_suppliers, 1);
              repmat("Factory", num_factories, 1);
              repmat("Store", num_stores, 1)];
nodes.CapacityOrDemand = [supplier_capacity; factory_capacity; store_demand];

% Write data to CSV files
writetable(edges, 'supply_chain_edges.csv');
writetable(nodes, 'supply_chain_nodes.csv');

disp('Supply Chain Dataset Generated:');
disp('1. supply_chain_edges.csv');
disp('2. supply_chain_nodes.csv');
