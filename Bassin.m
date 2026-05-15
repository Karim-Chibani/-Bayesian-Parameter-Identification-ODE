% Paramètres
k1 = 0.5; 
k2 = 0.2;

% Création d'une grille pour colorer le bassin
[A_grid, B_grid] = meshgrid(0:0.1:12, 0:0.1:12);

figure; hold on;

% 1. Visualisation du Bassin (Coloration de la zone de convergence)
% Comme tout converge vers (0,0), on colore toute la zone utile.
surf(A_grid, B_grid, -ones(size(A_grid)), 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'FaceColor', [0.2 0.8 0.2]);
view(2); % Vue de dessus

% 2. Champ de vecteurs
[Af, Bf] = meshgrid(0:1:12, 0:1:12);
quiver(Af, Bf, -k1*Af, k1*Af-k2*Bf, 'Color', [0.3 0.3 0.3]);

% 3. Tracé de l'attracteur
plot(0, 0, 'ro', 'MarkerSize', 12, 'MarkerFaceColor', 'r', 'DisplayName', 'Attracteur stable');

% 4. Ajout d'une trajectoire spécifique (X0 = 10, 0)
[t, sol] = ode45(@(t, X) [-k1*X(1); k1*X(1)-k2*X(2)], [0 30], [10; 0]);
plot(sol(:,1), sol(:,2), 'k-', 'LineWidth', 2, 'DisplayName', 'Trajectoire principale');

% Mise en forme
xlabel('A'); ylabel('B');
title('Visualisation du Bassin d''Attraction (Zone verte)');
legend('Bassin d''attraction', 'Champ de vecteurs', 'Attracteur (0,0)', 'Orbite');
grid on; axis([0 12 0 12]);
saveas(gcf, 'Bassin.png');