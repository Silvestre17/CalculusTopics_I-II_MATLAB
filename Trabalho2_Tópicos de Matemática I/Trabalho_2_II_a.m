x=sym('x');
g=@(x) atan(sin(x));
a=0;
lista_n=[0 5 13 23 35 48 63 79 97 116 135]';
i=1;
for B=0:pi/5:10*pi/5
    b=B;
    s=IntTrap(g, a,b,lista_n(i,1));
   [B s]
    i=i+1;
end