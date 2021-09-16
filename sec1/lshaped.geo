c = 0.1; //resolution

Point(1) = {  0,  0,  0,  c}; // x,y,z, resolution
Point(2) = {  0,  1,  0,  c};
Point(3) = { -1,  1,  0,  c};
Point(4) = { -1, -1,  0,  c};
Point(5) = {  1, -1,  0,  c};
Point(6) = {  1,  0,  0,  c};
Line(1) = {1, 2}; // Point(1) --> Point(2)
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
Line Loop(1) = {1, 2, 3, 4, 5, 6}; // Line(1) --> ... --> Line(6)
Plane Surface(1) = {1}; //Line Loop(1)
