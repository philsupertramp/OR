/* Objective function */
max: 80 x1 + 90 x2 + 85 x3 + 93 x4 + 100 x5 + 102 x6 + 85 x7 + 135 x8 + 210 x9 + 12 x10;
10 x1 + 11 x2 + 8 x3 + 9 x4 + 12 x5 + 10 x6 + 7 x7 + 13 x8 + 15 x9 + 12 x10 <= 75;
/* Variable bounds */
x1 >= 0;
x2 >= 0;
x3 >= 0;
x4 >= 0;
x5 >= 0;
x6 >= 0;
x7 >= 0;
x8 >= 0;
x9 >= 0;
x10 >= 0;
x1 <= 1;
x2 <= 1;
x3 <= 1;
x4 <= 1;
x5 <= 1;
x6 <= 1;
x7 <= 1;
x8 <= 1;
x9 <= 1;
x10 <= 1;
/* Integer */
int x1;
int x2;
int x3;
int x4;
int x5;
int x6;
int x7;
int x8;
int x9;
int x10;