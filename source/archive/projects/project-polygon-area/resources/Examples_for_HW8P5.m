clear all
lastname = 'Key';
program_name = "HW8P5_is_polygon_simple_";
calling_function = str2func(program_name + lastname);

%% Example 0
vertices0(1:5) = struct('x',[],'y',[]);

[vertices0.x] = deal(2,4,6,5,4);
[vertices0.y] = deal(2,4,2,6,5);
plot([vertices0.x vertices0(1).x],[vertices0.y vertices0(1).y],'-o')
grid on;

is_simple = calling_function(vertices0)
%should return true

%% Example 1
vertices1(1:4) = struct('x',[],'y',[]);

[vertices1.x] = deal(8,23,25,20);
[vertices1.y] = deal(20,30,12,26);
plot([vertices1.x vertices1(1).x],[vertices1.y vertices1(1).y],'-o')
grid on;

is_simple = calling_function(vertices1)
%should return true

%% Example 2
vertices2(1:6) = struct('x',[],'y',[]);

[vertices2.x] = deal(35,12,32,20,10,8);
[vertices2.y] = deal(8,29,18,32,35,27);
plot([vertices2.x vertices2(1).x],[vertices2.y vertices2(1).y],'-o')
grid on;

is_simple = calling_function(vertices2)
%should return true

%% Example 3
vertices3(1:4) = struct('x',[],'y',[]);

[vertices3.x] = deal(30,30,37,29);
[vertices3.y] = deal(23,31,27,25);
plot([vertices3.x vertices3(1).x],[vertices3.y vertices3(1).y],'-o')
grid on;

is_simple = calling_function(vertices3)
%should return false

%% Example 4
vertices4(1:13) = struct('x',[],'y',[]);

[vertices4.x] = deal(35,35,21, 4,20, 7,20, 3,18,7,21,28,29);
[vertices4.y] = deal(12,22,37,34,15,32,34,17,26,9,20,10,24);
plot([vertices4.x vertices4(1).x],[vertices4.y vertices4(1).y],'-o')
grid on;

is_simple = calling_function(vertices4)
%should return false

%% Example 5
vertices5(1:12) = struct('x',[],'y',[]);

[vertices5.x] = deal(35,35,21, 4, 7,20, 3,18, 7,21,28,29);
[vertices5.y] = deal(12,22,37,34,32,32,17,26,10,10,10,24);
plot([vertices5.x vertices5(1).x],[vertices5.y vertices5(1).y],'-o')
grid on;

is_simple = calling_function(vertices5)
%should return true