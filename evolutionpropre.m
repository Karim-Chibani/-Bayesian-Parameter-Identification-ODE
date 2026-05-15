% Paramètres du système
k1 = 0.5; 
k2 = 0.2;

% Définition du système d'équations différentielles
% X(1) correspond à A, X(2) correspond à B
dXdt = @(t, X) [ -k1 * X(1); 
                  k1 * X(1) - k2 * X(2) ];

% Conditions initiales : A(0) = 10, B(0) = 0
X0 = [10; 0];

% Intervalle de temps (de 0 à 20 unités de temps)
tspan = [0 20];

% Résolution avec ode45
[t, sol] = ode45(dXdt, tspan, X0);

% Extraction des résultats
A = sol(:, 1);
B = sol(:, 2);

% Visualisation
figure;
plot(t, A, 'r-', 'LineWidth', 2); hold on;
plot(t, B, 'b--', 'LineWidth', 2);
grid on;

% Mise en forme du graphique
xlabel('Temps (t)');
ylabel('Concentration');
title('Évolution du système X(t)');
legend('A(t)', 'B(t)');
%  (plot, xlabel, title...)
saveas(gcf, 'resultat.png');