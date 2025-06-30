clf;
hold on;
title('2º Derivada de f(x)')
set(gca,'xtick',-1:1);
set(gca,'ytick',-2:1);
xlim ([-0.5 1.5]);
ylim ([-2.5 1]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

x = 0:0.01:1;
y =(4*x.^2-2)./(exp(x.^2));
plot(x,y, 'r', 'LineWidth', 2);
txt = 'x';
text(1.4,-0.2,txt, 'FontSize', 15, 'FontName', 'Times New Roman', 'Interpreter', 'LaTeX');
txt = 'y';
text(-0.1,0.8,txt, 'FontSize', 15,'FontName', 'Times New Roman', 'Interpreter', 'LaTeX');
txt = '0';
text(-0.1,-0.1,txt,'FontSize', 10)
hold off;