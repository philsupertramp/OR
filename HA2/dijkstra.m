function [next_k] = dijkstra(C, J)
  X = C;
  X(C==0) = Inf
  [~,next_k] = min(X)
  
%  [m,~] = size(C);
%  
%  for i=1:m
%      abst(i) = Inf;
%      vorg(i) = NaN;
%  end % for i
%  abst(J(end)) = 0
%  Q = [1:m];
%  Q(J) = []
%  while length(Q) > 0
%    [~, u] = min(C(C>0))
%    zeros = find(~C)
%    for ids=1:length(zeros)
%      if zeros(ids) <= u
%        u += 1
%      else
%        break
%      end  
%    end % for  
%    Q(find(u, Q)) = []
%    for v=1:m
%      if ismember(v, Q)
%        if abst(u) == Inf
%          alternative = C(u)
%        else
%          alternative = abst(u) + C(u)
%        end
%        abst(v)  
%        if alternative < abst(v)
%          abst(v) = alternative
%          vorg(v) = u
%        end % if alternative < abst(v)
%      end % if v in Q  
%    end % for v  
%    
%  end % while
%  abst
%  [~, next_k] = min(abst(abst>0))
end
