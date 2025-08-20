/* https://jsxgraph.uni-bayreuth.de/wiki/index.php/B-splines */
/* Accessed August 2017                                      */

var brd = JXG.JSXGraph.initBoard('jsxgraph-IC',
{boundingbox:[-4,8,4,-4],
  keepaspectratio:false,
  axis:true,
  showNavigation:false,
  showCopyright:false});

  var x0 = 0;
  var y0 = brd.create('slider',[[0,-3],[0,6],[-3,0,6]],
                    { // Slider Properties
                      //name: 'y(0)',
                      withLabel: false,
                      size: 3,
                      highline: {strokeWidth: 0},
                      snapWidth: 0.5
                    });

  var x_i = 1.6;
  var y_i = 4.2;
  var x_s = 1.6;
  var y_s = 3.5;


  var C = function(x,y){ return (y-3)/Math.exp(x*x); }
  var f = function(x){ return C(x0,y0.Value())*Math.exp(x*x)+3; };

  var L1 = function(x){ return ((y_i-y0.Value())/x_i)*x + y0.Value(); }
  var L2 = function(x){ return ((y_s-f(0.5))/(x_s-0.5))*x + y_s - ((y_s-f(0.5))/(x_s-0.5))*x_s ; }
  //var L2 = function(x){ return ((y_s-f(0.5))/0.5)*x + y_s - (y_s-f(0.5))/0.5)*x_s; }
  var f1 = function(x){ return C(0,-2)*Math.exp(x*x)+3; };
  var f2 = function(x){ return C(0,0)*Math.exp(x*x)+3; };
  var f3 = function(x){ return C(0,2)*Math.exp(x*x)+3; };
  var f4 = function(x){ return C(0,2.8)*Math.exp(x*x)+3; };
  var f5 = function(x){ return C(0,3)*Math.exp(x*x)+3; };
  var f6 = function(x){ return C(0,3.4)*Math.exp(x*x)+3; };
  var f7 = function(x){ return C(0,4)*Math.exp(x*x)+3; };
  var f8 = function(x){ return C(0,6)*Math.exp(x*x)+3; };

  var plot_soln = brd.create('functiongraph',[f,-4, 4],
                          {strokecolor:'blue', strokeOpacity:0.6, strokeWidth:4});

  var plot_ic_label_line = brd.create('functiongraph',[L1,0,x_i],
                          {strokecolor:'black', strokeOpacity:1, strokeWidth:1});

  var plot = brd.create('functiongraph',[f1,-4, 4],{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3});
  var plot = brd.create('functiongraph',[f2,-4, 4],{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3});
  var plot = brd.create('functiongraph',[f3,-4, 4],{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3});
  var plot = brd.create('functiongraph',[f4,-4, 4],{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3});
  var plot = brd.create('functiongraph',[f5,-4, 4],{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3});
  var plot = brd.create('functiongraph',[f6,-4, 4],{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3});
  var plot = brd.create('functiongraph',[f7,-4, 4],{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3});
  var plot = brd.create('functiongraph',[f8,-4, 4],{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3});

  brd.create('text',[x_i+0.1,y_i,function(){ return 'y(0) = '+(y0.Value()); }],{fontSize: 16});
  brd.create('text',[x_s+0.1,y_s,function(){ return 'y = '+(C(0,y0.Value())).toFixed(1)+'e^{x^2} + 3'; }],{fontSize: 16});

p.push(brd.create('point',[2,1],{strokeColor:col,fillColor:col}));
p.push(brd.create('point',[0.75,2.5],{strokeColor:col,fillColor:col}));
p.push(brd.create('point',[-0.3,0.3],{strokeColor:col,fillColor:col}));
p.push(brd.create('point',[-3,1],{strokeColor:col,fillColor:col}));
p.push(brd.create('point',[-0.75,-2.5],{strokeColor:col,fillColor:col}));
p.push(brd.create('point',[1.5,-2.8],{strokeColor:col,fillColor:col}));
p.push(brd.create('point',[2,-0.5],{strokeColor:col,fillColor:col}));

//var c = brd.create('curve', JXG.Math.Numerics.bspline(p,4),
//               {strokecolor:'blue', strokeOpacity:0.6, strokeWidth:5});
