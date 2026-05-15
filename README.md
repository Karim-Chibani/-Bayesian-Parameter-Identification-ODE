# 🧬 Inférence Bayésienne pour l'Identification de Paramètres (EDO)

Ce dépôt contient une implémentation de l'inférence Bayésienne pour estimer les constantes de vitesse ($k_1, k_2$) d'un système dynamique modélisé par des équations différentielles ordinaires (EDO).

## 🧪 Description du Modèle
Le système représente une cinétique chimique de type $A \to B \to C$ :
$$
\begin{cases}
\frac{dA}{dt} = -k_1 A \\
\frac{dB}{dt} = k_1 A - k_2 B
\end{cases}
$$

## ⚗️ Fondements Mathématiques

### Existence et Unicité (Théorème de Cauchy-Lipschitz)
L'existence et l'unicité de la solution sont garanties par le théorème de **Cauchy-Lipschitz linéaire** :
1. **Formulation** : Soit $F(t, X) = MX$. $F$ est continue en $t$ et linéaire en $X$.
2. **Caractère Lipschitzien** : Pour tout $X_1, X_2 \in \mathbb{R}^2$ :
   $$\|F(t, X_1) - F(t, X_2)\| = \|M(X_1 - X_2)\| \le \|M\| \cdot \|X_1 - X_2\|$$
3. **Conclusion** : L'application étant globalement Lipschitzienne sur $\mathbb{R}^2$, il existe une solution unique définie sur $\mathbb{R}$.

---

## 📈 Résultats et Analyse
L'algorithme **MCMC (Metropolis-Hastings)** a permis d'obtenir les résultats suivants :

| Paramètre | Valeur Réelle | Valeur Estimée | Erreur Relative |
| :--- | :---: | :---: | :---: |
| **$k_1$** | 0.5 | **0.5168** | **3.36%** |
| **$k_2$** | 0.2 | **0.2031** | **1.55%** |

### Analyse visuelle
* **Fit Bayésien** : Le modèle filtre efficacement le bruit pour retrouver la trajectoire physique réelle.
* **Convergence** : Les distributions postérieures montrent une grande précision malgré le bruit des données.

---
*Projet réalisé par Karim Chibani - Master USMBA, Fès.*
