function [M, J] = zuordnung(W)
% zuordnung() loest das zuordnungsproblem S = T, sodass Kantengwicht optimal
% Implementierung von alternativer Formulierung des Verfahrens von Lawler
%
% Input:
%       W = quadr. Matrix mit Gewichten der Kanten
% Output: 
%       ? lol
[m, n] = size(W);
if m ~= n
  error('Matrix nicht quadr.')
end %if

% Initialisierung
M = [];

X = W;
v = zeros(m, 1);
u = zeros(m, 1);

u_dach = u;
v_dach = v;

J = [t];
J

[~, t] = min(W(1,:)(W(1,:)>0));
X(1, :) = 0;
X(1, t) = 1;
v(t) = W(1,t);
for i=2:n
  v(i) = W(1,t);
end
%[x,z] = linprog(c,[],[],Aeq,beq,LB,UB);
I = 2;
while I<=n
  for i=1:n
    for j=1:n
      if !ismember(j, J)
        X(i,j) = W(i,j) + u(i) - v(j);
      else
        X(i,j) = 0;
      end % if j in J
    end % for j
  end
  v_dach(J) = 0;
  % using the Dijkstra-Algorithm to
  % determine k as the shortes way from I
  k = dijkstra(X(I,:)')
  % ermittle P = kuerzester Weg von I nach k
  v_dach = X(k,:);
  u_dach = X(:,k);
  
  for ii = 1:n
    if ii <= I
      u(ii) = u(ii) + min(u_dach(ii), v_dach(k));
    else
      u(ii) = u(ii) + v_dach(ii);  
    end
    v(ii) = v(ii) + min(v_dach(ii), v_dach(k));
  end % for u and v
  J(I) = k;
  J
  M = [M; k];
  X(I,:) = 0;
  X(I,k) = 1;
  I = I + 1;
end % for i

end % function
