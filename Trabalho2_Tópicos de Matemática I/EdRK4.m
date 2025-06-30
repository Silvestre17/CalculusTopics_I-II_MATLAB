function [U] = EdRK4 (f, t0, y0, h, n)
    U = zeros(n+1, 7);
    h2 = h ./ 2;
    h6 = h ./ 6;
    for i = 0:n
        k1 = f(t0, y0);
        k2 = f(t0+h2, y0 + h2 .* k1);
        k3 = f(t0+h2, y0 + h2 .* k2);
        k4 = f(t0+h,  y0 + h  .* k3);
        K = [k1, k2, k3, k4];
        U(i+1, :) = [i, K, t0, y0];
        K = h6 .* [k1, 2.*k2, 2.*k3, k4];
        y0 = y0 + sum(K,2);
        t0 = t0 + h;
    end      
end