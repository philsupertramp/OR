% Autor Philipp Zettl 841523
close all;
clear all;
format compact;
n = 8;
W = [
  1000 3 4 5 6 7 8 9;
  3 1000 9 8 7 6 5 4;
  4 9 1000 8 7 6 5 9;
  5 8 8 1000 4 5 6 9;
  6 7 7 4 1000 8 2 8;
  7 6 6 5 8 1000 4 3;
  8 5 5 6 2 4 1000 8;
  9 4 9 9 8 3 8 1000
];
W = [2,3,1;7,2,3;7,1,3];
%W = [1,1,1,2;3,2,4,1;4,4,2,4;2,3,3,3];
W = [10, 7,5,3;7,10,2,3;5,2,10,2;3,3,2,10];
V = [1,2,3,4,5,6,7,8];
E = zeros(n); %V' * V

pkg load optim;

# Aufgabe 1.1
# Bestimmen Sie unter Angabe der einzelnen Iterationen mit Hilfe des Verfahrens von
# Lawler eine optimale Zuordnung von S=V nach T=W mit den Kosten (Gewichten) W = (w_ij)

X = zeros(n);
u = zeros(n,1);
v = zeros(n,1);
for i=1:n
  X(1,i) = 1;
end
%[x,y] = aufgabe1_1(W)
[a,b] = zuordnung(W)

## Aufgabe 1.2 Generieren Sie aus der optimalen Lösung des Zuordnungsproblems 
# eine optimale Lösung des zugehörigen Runrdreiseproblems und 
# geben Sie die Rundreise und deren Länge an

# Aufgabe 1.3
# Bestimmen Sie unter Angabe der einzelnen Iterationen eine Lösung des Rundreiseproblems mit Hilfe der Neares-Neighbor-Heuristik