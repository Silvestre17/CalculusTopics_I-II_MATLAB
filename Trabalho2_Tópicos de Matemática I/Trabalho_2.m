g=[0 0.1804 0.6005 1.0888 1.5089 1.6899 1.5092 1.0891 0.6010 0.1809 0];
inicio = 0.00;
h = pi/5;
D = Deriv2(g, inicio, h);

% Na matriz D temos: 1� coluna x; 2� coluna g(x); 3� coluna: derivada numerica;
% 4� coluna: segunda derivada numerica.

V = [];
V = horzcat(V, D);    % faz concatena��o de colunas; acrescenta as colunas de D a V, � direita
sym 'x';
glinha = @(x)(atan(sin(x)));
R = flinha(D(:, 1)); % calcula os valores da 1� derivada nos pontos x

V = horzcat(V, R);   % a 5� coluna de V tem a primeira derivada verdadeira

g2linhas = @(x)((cos(x)./(1+sin(x).^2)));
R = f2linhas(D(:,1)); % calcula os valores da 2� derivada nos pontos x

V = horzcat(V,R);     % a 6� coluna de V tem a segunda derivada verdadeira

V(:, 7) = abs(V(:,3) - V(:,5));  % a 7� coluna de V tem o erro absoluto da primeira derivada 
  
[row_V, col_V] = size(V);   % n� de linhas e colunas de V
for i = 1 : col_V
    if (abs(V(i,5)) < 1e-6)  % um valor pequeno, em vez de zero; 
        V(i, 8) = NaN;
    else
        V(i,8) = V(i,7) / abs(V(i,5)) * 100;  % o erro relativo vem em percentagem (8� coluna)
    end
end

V(:,9) = abs(V(:,4) - V(:,6));  % a 9� coluna de V tem o erro absoluto da segunda derivada 
for i = 1 : col_V
    if (abs(V(i,6)) < 1e-6)  % um valor pequeno, em vez de zero;
        V(i, 10) = NaN;
    else
        V(i, 10) = V(i, 9) / abs(V(i, 6)) * 100;  % o erro relativo vem em percentagem (10� coluna)
    end
end

V
xlswrite('Trabalho_2.xlsx',V);  % pode abrir este ficheiro no excel