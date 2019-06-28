function [ x , z ] = aufgabe1_1(W)

pkg load optim;
% wird zuerst in einen Spaltenvektor c konvertiert
[m,n] = size(W);
if (m ~= n)
  sprintf ('Die Matrix W ist nicht quadratisch! Stop.\n')
  x = zeros(n,n);
  z = Inf;
  return
end
  
c = reshape(W,n*n,1);

% Der Vektor b hat die Dimension n. Jede Komponente ist gleich 1.
beq = ones (2*n,1);

% Aufsetzen der 0-1-Matrix Aeq mit Aeq x = beq = [ 1; 1; ... ; 1]
Aeq = zeros(2*n,n);
for i = 1:n
  Aeq(i,(i-1)*n+1:(i-1)*n+n) = ones(1,n);
end
for j = 1:n
  Aeq(n+1:2*n,1+(j-1)*n:n+(j-1)*n) = eye(n);
end
Aeq

% Die unteren und die oberen Schranken werden definiert
LB = zeros(n*n,1);
UB = ones(n*n,1);

% in Octave muss vorher das Paket optim geladen werden! 
% pkg load optim

% Die erste L�sung besteht aus der L�sung des Zuorndungsproblems
[x,z] = linprog(c,[],[],Aeq,beq,LB,UB);

% Die L�sung ist ganzzahlig und wird nun in eine (Permutations-)Matrix konvertiert und ausgegeben
x = reshape(x,n,n);
x
z

% Flag, das anzeigt, ob die L�sung bereits optimal ist, also keine Subtouren enth�lt oder nicht
% nicht optimal: 0
% optimal: 1
optimal = 0;

% Iterator 
r = 0;

% solange noch kein Optimum gefunden wurde
while (optimal == 0)

  % Suche Subtouren
	visited = zeros(n,1);
	v = 1
	while (visited(v,1) == 0)
		visited(v,1) = 1;
		for j = 1:n
			if ( abs(x(v,j)-1.0) < 0.0001)
				v = j;
        break;
			end
		end
	end
  sum(visited)
  % Falls eine Subtour gefunden wurde
	if (sum(visited) < n)
	  sprintf ('gefundene Subtour:\n');
		subtour = visited'

		% F�ge Subtour Elimination Contraint  hierzu: -A x <= -b
		% Anzahl Spalten von A: n*n
    col = n*n;

    % Konstruiere A 
		for i=1:n
			for j=1:n
				if ((visited(i,1) == 1) && (visited(j,1) == 0))
					A(r+1,(i-1)*n+j) = -1;
				else
					A(r+1,(i-1)*n+j) = 0;
				end
			end
		end
		b(r+1,1)=-1;

		% L�se das neue Problem
    param.dual = 2;
    [x,z] = linprog(c,A,b,Aeq,beq,LB,UB, param);
    
		% Wandle die neue L�sung in eine (Permutations-)Matrix um und gebe sie aus
		x = reshape(x,n,n);
		sprintf ('\n neue L�sung:\n');
    x
		z
    
    r = r+1;
	else
    % keine Subtour gefunden: optimal
    sprintf ('\n keine Subtour enthalten: optimal\n');
		optimal = 1;
	end
end
fprintf('Anzahl Iterationen: ')
r
end %function