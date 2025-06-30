clf;
hold on;
title('3º Derivada de g(x)')
set(gca,'xtick',0:8);
set(gca,'ytick',-2:2);
xlim ([-0.5 7]);
ylim ([-2.5 2.5]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
x = 0:0.01:6.28; % 10*pi/5 +-= 6.28
y =((-sin(x))-(sin(x).^3)-(cos(x).*(sin(2*x))))./(1+(sin(x).^2)).^2;
plot(x,y, 'r', 'LineWidth', 2);
txt = 'x';
text(6.5,-0.2,txt, 'FontSize', 15, 'FontName', 'Times New Roman', 'Interpreter', 'LaTeX');
txt = 'y';
text(-0.3,2.3,txt, 'FontSize', 15,'FontName', 'Times New Roman', 'Interpreter', 'LaTeX');
txt = '0';
text(-0.1,-0.1,txt,'FontSize', 10)
hold off;