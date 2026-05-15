% 1. Paramètres et résolution
k1 = 0.5; 
k2 = 0.2;
tspan = [0 20];
X0 = [10; 0];

% Résolution du système
[t, sol] = ode45(@(t, X) [-k1*X(1); k1*X(1)-k2*X(2)], tspan, X0);
A_pure = sol(:, 1);
B_pure = sol(:, 2);

% 2. Ajout du bruit (Simulation de données labo)
niveau_bruit = 0.05 * max(B_pure);
B_bruite = B_pure + niveau_bruit * randn(size(B_pure));

% 3. CRÉATION DU FICHIER CSV (C'est ici qu'on génère la data)
% On crée d'abord un tableau (Table)
T = table(t, A_pure, B_pure, B_bruite, ...
    'VariableNames', {'Temps', 'A_Theorique', 'B_Theorique', 'B_Mesure_Bruitee'});

% On l'écrit dans un fichier CSV
writetable(T, 'evolution_systeme_bruit.csv');

% Message de confirmation
fprintf('Le fichier CSV "evolution_systeme_bruit.csv" a été créé avec succès.\n');

% 4. Visualisation
figure;
plot(t, B_pure, 'k-', 'LineWidth', 2); hold on;
plot(t, B_bruite, 'r.', 'MarkerSize', 10);
grid on;
xlabel('Temps');
ylabel('Concentration B');
title('Visualisation des données générées');
legend('Théorie', 'Données avec bruit (CSV)');
saveas(gcf, 'noise.png');
        