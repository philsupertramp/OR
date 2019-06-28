function [x, maxW, J] = zuordnung(W)
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
  %% 1
  x = zeros(n);
  v = zeros(n,1);
  u = zeros(n,1);
  uq = zeros(n,1);
  vq = zeros(n,1);
  
  %% 2
  [~, t] = min(W(1,1:n));
  x(1,t) = 1;
  v(t) = W(1,t);
  u(2:n) = W(1,t);
  I = 2;
  c = W;

  j=t;
  
  while I <= n
    %% 3
    I
    Eb = x == 0;
    Er = x == 1;
    G = Eb | Er;
    c = (W + repmat(u,1,n) - repmat(v',n,1)) .* Eb
    c(Er == 1) = 0
    
    I
    J = find(sum(x,1))
    for ind=1:n
      if ind < I
        uq(ind) = uq(ind) + c(I, ind);
      elseif ind == I
          uq(ind) = 0
      else  
        uq(ind) = Inf;
      end
    end
  
    uq
    [uqi, k] = min(uq)
    for z=1:length(J)
      uq(z) = c(I, J(z));
    end  
    uq(k) = 0;  
    %[P, k] = min(c(I, find(~sum(x,1))));
    
    J_ = find(sum(x,1));
    %% 4
    x(I,k) = 1;
    
    uq
    vq = c(I,:)'
    
    for q=1:n
      if q<=I
        u(q) = u(q) + min(uq(q),vq(k));
      else
        u(q) = u(q) + vq(k);
      end %if 
      v(q) = v(q) + min(vq(q), vq(k));
    end %for
    I = I+1;
    v
    u
  end%While
  maxW = sum(W(find(x)));
  J = find(x);
end % function
