function [U] = EdEuler (f, t0, y0, h, n)
    U = zeros(n+1, 4);
    for i = 0:n
        f0 = f(t0, y0);
        U(i+1, :) = [i, t0, f0, y0];
        y0 = y0 + h .* f0;
        t0 = t0 + h;
    end      
end