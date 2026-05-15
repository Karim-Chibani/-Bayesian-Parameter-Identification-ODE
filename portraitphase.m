% Paramètres
k1 = 0.5; 
k2 = 0.2;

% Définition du système pour le champ de vecteurs
[A_grid, B_grid] = meshgrid(0:1:12, 0:1:12);
dA = -k1 * A_grid;
dB = k1 * A_grid - k2 * B_grid;

figure;
hold on; grid on;

% 1. Champ de vecteurs (Comportement global)
quiver(A_grid, B_grid, dA, dB, 'Color', [0.7 0.7 0.7]);

% 2. Les Orbites (Trajectoires depuis différentes conditions initiales)
cond_init = [10 0; 8 2; 5 10; 2 5]; % Différents points de départ
colors = lines(size(cond_init, 1));

for i = 1:size(cond_init, 1)
    [t, sol] = ode45(@(t, X) [-k1*X(1); k1*X(1)-k2*X(2)], [0 30], cond_init(i,:));
    plot(sol(:,1), sol(:,2), 'Color', colors(i,:), 'LineWidth', 1.5, ...
         'DisplayName', sprintf('Orbite: X0=[%.0f,%.0f]', cond_init(i,1), cond_init(i,2)));
end

% 3. L'Attracteur (Point fixe stable)
% Le seul point où dA/dt = 0 et dB/dt = 0 est (0,0)
plot(0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r', 'DisplayName', 'Attracteur (Stable)');

% 4. Séparatrices et Nullclines (Aide à la compréhension du flux)
% Nullcline dA/dt = 0 -> A = 0 (Axe vertical)
% Nullcline dB/dt = 0 -> B = (k1/k2)*A
fplot(@(a) (k1/k2)*a, [0 12], 'k--', 'LineWidth', 1, 'DisplayName', 'Nullcline dB/dt=0');

% Configuration des axes et titres
xlabel('Concentration A');
ylabel('Concentration B');
title('Portrait de Phase : Système Linéaire A \rightarrow B \rightarrow C');
legend('Location', 'northeast');
axis([0 12 0 12]);

% Annotations textuelles sur le graphique
text(0.5, 0.5, '\leftarrow Point Fixe (0,0)', 'FontSize', 10, 'Color', 'r');
text(6, 11, 'Convergence vers l''origine', 'FontSize', 9, 'FontWeight', 'bold');
saveas(gcf, 'portraitphase.png');