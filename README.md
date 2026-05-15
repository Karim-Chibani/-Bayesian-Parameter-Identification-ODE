# 🧬 Inférence Bayésienne pour l'Identification de Paramètres (EDO)

Ce dépôt contient une implémentation de l'inférence Bayésienne pour estimer les constantes de vitesse ($k_1, k_2$) d'un système dynamique modélisé par des équations différentielles ordinaires (EDO). L'objectif est de démontrer la capacité de l'approche statistique à reconstruire la physique d'un système à partir de données expérimentales bruitées.

## 📑 Sommaire
* [Description du Modèle](#-description-du-modèle)
* [Fondements Mathématiques](#-fondements-mathématiques)
* [Méthodologie Statistique](#-méthodologie-statistique)
* [Résultats et Analyse](#-résultats-et-analyse)
* [Installation et Dépendances](#-installation-et-dépendances)

---

## 🧪 Description du Modèle
Le système représente une cinétique chimique de type $A \to B \to C$, décrite par :
$$
\begin{cases}
\frac{dA}{dt} = -k_1 A \\
\frac{dB}{dt} = k_1 A - k_2 B
\end{cases}
$$
Où les paramètres à identifier sont $k_1$ (taux de dégradation de A) et $k_2$ (taux de dégradation de B).

---

## ⚗️ Fondements Mathématiques

### L'espace de solutions (Régularité temporelle)
La matrice $M$ associée au système est constante, avec des coefficients réels ($k_1, k_2 \in \mathbb{R}$). L'opérateur linéaire associé est donc borné et continu. Le cadre fonctionnel pour les solutions $X(t)$ est l'espace **$C^1(I, \mathbb{R}^2)$**, soit les fonctions continûment dérivables sur l'intervalle de temps considéré.

### Existence et Unicité (Théorème de Cauchy-Lipschitz)
L'existence et l'unicité de la solution sont garanties par le théorème de **Cauchy-Lipschitz linéaire** :
1. **Formulation** : Soit $F(t, X) = MX$. $F$ est continue en $t$ et linéaire en $X$.
2. **Caractère Lipschitzien** : Pour tout $X_1, X_2 \in \mathbb{R}^2$ :
   $$\|F(t, X_1) - F(t, X_2)\| = \|M(X_1 - X_2)\| \le \|M\| \cdot \|X_1 - X_2\|$$
3. **Conclusion** : L'application étant globalement Lipschitzienne sur $\mathbb{R}^2$, il existe une solution unique définie sur $\mathbb{R}$.

---

## 📊 Méthodologie Statistique
L'estimation repose sur l'**Inférence Bayésienne** utilisant l'algorithme **MCMC (Metropolis-Hastings)** :
* **Vraisemblance (Likelihood)** : Basée sur l'erreur quadratique entre les données bruitées (CSV) et les solutions numériques des EDO.
* **Priors** : Distributions non-informatives imposant la positivité des paramètres ($k_1, k_2 > 0$).
* **Échantillonnage** : 10 000 itérations pour obtenir la distribution postérieure.

---

## 📈 Résultats et Analyse
Le modèle a été testé avec des données synthétiques contenant un bruit Gaussien. L'algorithme a convergé avec une grande précision :

| Paramètre | Valeur Réelle | Valeur Estimée | Erreur Relative |
| :--- | :---: | :---: | :---: |
| **$k_1$** | 0.5 | **0.5168** | **3.36%** |
| **$k_2$** | 0.2 | **0.2031** | **1.55%** |

### Visualisations
* **Distributions Postérieures** : Les histogrammes montrent des distributions en cloche centrées sur les valeurs réelles, confirmant la convergence du MCMC.
* **Ajustement (Fit)** : Le "Fit Bayésien" filtre efficacement le bruit pour retrouver la trajectoire physique réelle du système.

---

## 🚀 Installation et Dépendances
```bash
# Installation des bibliothèques nécessaires
pip install numpy pandas matplotlib scipy
