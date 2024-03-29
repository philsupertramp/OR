% Philipp Zettl 841523
% Aufgabe 1.1 Optimallösung des Rucksackproblems

%P02: 
c=26;
p=[  24, 13, 23, 15, 16];
w=[ 12, 7, 11, 8, 9];
fprintf('Lösung P02\n')
[ V,T,Wneed,Wert ]=knapSack(p,w,length(w),c)

%P05
c=104;

p=[350, 400, 450, 20, 70, 8, 5, 5];
w=[25, 35, 45, 5, 25, 3, 2, 2];

fprintf('Lösung P05\n')
[ V,T,Wneed,Wert ]=knapSack(p',w',length(w'),c)

%P07
c=750;

p=[135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240];
w=[ 70, 73, 77, 80, 82, 87, 90, 94, 98, 106, 110, 113, 115, 118, 120];

fprintf('Lösung P07\n')
[ V,T,Wneed,Wert ]=knapSack(p,w,length(w),c)

%P08
c=6404180;

p=[825594, 1677009, 1676628, 1523970, 943972, 97426, 69666, 1296457, 1679693, ...
  1902996, 1844992, 1049289, 1252836, 1319836, 953277, 2067538, 675367, 853655, ...
  1826027, 65731, 901489, 577243, 466257, 369261];
w=[382745, 799601, 909247, 729069, 467902, 44328, 34610, 698150, 823460, 903959, ...
  853665, 551830, 610856, 670702, 488960, 951111, 323046, 446298, 931161, 31385, ...
  496951, 264724, 224916, 169684];

fprintf('Lösung P08\n')
[ V,T,Wneed,Wert ]=knapSack(p,w,length(w),c)
