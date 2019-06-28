function [ V,T,Wneed,Wert ] = knapSack( v,w,n,W )
%KNAPSACK 
% Dynamische Implementierung des Rucksack-Problems
% Input
% v                 Array mit den Werten der Elemente
% w                 Array mit den Gewichten der Elemente
% n                 Anzahl der Elemente
% W                 max. Gewicht, das zulaessig ist
% Output
% V                 Matrix; der Eintrag V(i,wi) gibt an, wie viel Wert die
%                   Elemente im Rucksack beinhalten, wenn nur 
%                   die Elemente 1-i benutzt wurden und das max. Gewicht wi
%                   zulaessig ist
% T                 enthaelt die Teilmenge der Elementen, die es in den
%                   Rucksack geschafft haben
% Wneed             benötigtes Gewicht fuer die Teilmenge T
% Wert              der max. Wert der Elemente aus T

% n+1, da die erste Spalte fuer 0 Elemente steht ( Matlab startet bei 1 )
% W+1, da ebenfalls die erste Spalte fuer das Gewicht 0 steht
V = zeros(n+1,W+1);
keep = zeros(n+1,W+1);
T = zeros(n,1);

for i = 2:n+1
    for wg = 1:W+1
        % Achtung, V fängt mit nem 0. Element an und w und v mit dem ersten
       if ( w(i-1) <= wg-1 ) && ( v(i-1) + V(i-1,wg - w(i-1)) > V(i-1,wg) )
          V(i,wg) = v(i-1) + V(i-1,wg - w(i-1)); 
          keep(i,wg) = 1;
       else
          V(i,wg) = V(i-1,wg);
          keep(i,wg) = 0;
       end
    end
end
    K = W;
    zaehler = 0;
    Wert = 0;
    for i = n:-1:1
        % keep faengt mit dem 0. Element an
       if keep(i+1,K+1) == 1
           zaehler = zaehler +1;
           T(zaehler) = i;
           K = K - w(i);
           Wert = Wert + v(i);
       end
    end
    Wneed = W - K;
    T = T(1:zaehler);
end
