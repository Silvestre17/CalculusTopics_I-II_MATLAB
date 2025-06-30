x = sym('x');
f = @(x) 1./x;
a = 0;
b = 1;
T = zeros(20,2); % o (x) é  max do n-1
for n = 2:21
    s= IntMPM(f,a,b,n);
    T(n-1,:) = [n s];
end