clear all
lastname = 'Key';
program_name = "HW8P7_approx_polygon_area_";
calling_function = str2func(program_name + lastname);

%% Example 1
vertices1(1:4) = struct('x',[],'y',[]);
[vertices1.x] = deal(8,23,25,20);
[vertices1.y] = deal(20,30,12,26);
box1 = struct('x1',0,'x2',40,'y1',0,'y2',40);

plot([vertices1.x vertices1(1).x],[vertices1.y vertices1(1).y],'-o')
axis([box1.x1 box1.x2 box1.y1 box1.y2])
grid on;

approx_area = HW8P7_approx_polygon_area_Key(vertices1,box1)
%exact area is 46

%% Example 2
vertices2(1:4) = struct('x',[],'y',[]);
[vertices2.x] = deal(8,23,25,20);
[vertices2.y] = deal(20,30,12,26);
box2 = struct('x1',5,'x2',30,'y1',10,'y2',35);

plot([vertices2.x vertices2(1).x],[vertices2.y vertices2(1).y],'-o')
axis([box2.x1 box2.x2 box2.y1 box2.y2])
grid on;

approx_area = HW8P7_approx_polygon_area_Key(vertices2,box2)
%exact area is 46

%% Example 3
vertices3(1:13) = struct('x',[],'y',[]);
[vertices3.x] = deal(35,35,21, 4, 5, 7,20, 3,18,7,21,28,29);
[vertices3.y] = deal(12,22,37,34,25,32,34,17,26,9,20,10,24);
box3 = struct('x1',0,'x2',40,'y1',0,'y2',40);

plot([vertices3.x vertices3(1).x],[vertices3.y vertices3(1).y],'-o')
axis([box3.x1 box3.x2 box3.y1 box3.y2])
grid on;

approx_area = HW8P6_approx_polygon_area_Key(vertices3,box3)
polygon_area = HW8P8_exact_polygon_area_Key(vertices3)
%exact area is 503.5

%% Example 4
% vertices4(1:13) = struct('x',[],'y',[]);
% [vertices4.x] = deal(35,35,21, 4, 5, 7,20, 3,18,7,21,28,29);
% [vertices4.y] = deal(12,22,37,34,25,32,34,17,26,9,20,10,24);
% x0 = 22;
% y0 = 25;
% 
% plot([vertices4.x vertices4(1).x],[vertices4.y vertices4(1).y],'-o')
% hold on
% plot(x0,y0,'d','MarkerSize',12,'LineWidth',5)
% hold off
% grid on;
% 
% is_in_poly = calling_function(x0,y0,vertices4)
% %should return true
% 
% %% Example 5
% vertices5(1:13) = struct('x',[],'y',[]);
% [vertices5.x] = deal(35,35,21, 4, 5, 7,20, 3,18,7,21,28,29);
% [vertices5.y] = deal(12,22,37,34,25,32,34,17,26,9,20,10,24);
% x0 = 30;
% y0 = 30;
% 
% plot([vertices5.x vertices5(1).x],[vertices5.y vertices5(1).y],'-o')
% hold on
% plot(x0,y0,'d','MarkerSize',12,'LineWidth',5)
% hold off
% grid on;
% 
% is_in_poly = calling_function(x0,y0,vertices5)
% %should return false
% 
% %% Example 6
% vertices6(1:13) = struct('x',[],'y',[]);
% [vertices6.x] = deal(35,35,21, 4, 5, 7,20, 3,18,7,21,28,29);
% [vertices6.y] = deal(12,22,37,34,25,32,34,17,26,9,20,10,24);
% x0 = 30;
% y0 = 20;
% 
% plot([vertices6.x vertices6(1).x],[vertices6.y vertices6(1).y],'-o')
% hold on
% plot(x0,y0,'d','MarkerSize',12,'LineWidth',5)
% hold off
% grid on;
% 
% is_in_poly = calling_function(x0,y0,vertices6)
% %should return false