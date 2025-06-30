T = [-1 -0.848 -0.693 -0.540 -0.391 -0.249 -0.117 0.002 0.107 0.195];
inicio = 0.00;
h = 0.15;
D = Deriv2(T, inicio, h);

% Na matriz D temos: 1a. coluna x; 2� coluna f(x) = T; 3a. coluna: derivada numerica;
% 4� coluna: segunda derivada numerica.

V = [];
V = horzcat(V, D);              % faz concatenacao de colunas; acrescenta as colunas de D a V, �a direita
sym 'x';
flinha = @(x)(cos(x) + (1/2) * sin(x/2));
R = flinha(D(:, 1)); % calcula os valores da 1a derivada nos pontos x

V = horzcat(V, R);     % a 5a. coluna de V tem a primeira derivada verdadeira

f2linhas = @(x)(-sin(x) + (1/4) * cos(x/2));
R = f2linhas(D(:, 1)); % calcula os valores da 2a derivada nos pontos x

V = horzcat(V, R);     % a 6a. coluna de V tem a segunda derivada verdadeira

V(:, 7) = abs(V(:,3) - V(:, 5));  % a 7a. coluna de V tem o erro absoluto da primeira derivada 

[row_V col_V] = size(V);   % no. de linhas e colunas de V
for i = 1 : col_V
    if (abs(V(i, 5)) < 1e-6)  % um valor pequeno, em vez de zero; 
        V(i, 8) = NaN;
    else
        V(i, 8) = V(i, 7) / abs(V(i, 5)) * 100;  % o erro relativo vem em percentagem
    end
end

V(:, 9) = abs(V(:,4) - V(:, 6));  % a 9a. coluna de V tem o erro absoluto da segunda derivada 
for i = 1 : col_V
    if (abs(V(i, 6)) < 1e-6)  % um valor pequeno, em vez de zero; 
        V(i, 10) = NaN;
    else
        V(i, 10) = V(i, 9) / abs(V(i, 6)) * 100;  % o erro relativo vem em percentagem
    end
end

V
xlswrite('exercicio_1_3.xlsx',V);  % pode abrir este ficheiro no excel

