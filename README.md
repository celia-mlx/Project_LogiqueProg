# Réseau de neurones sur FPGA

Ce dépôt contient les travaux de modélisation et de synthèse d'un réseau de neurones artificiels réalisés dans le cadre du cours de Logique Programmable en 4EII à l'INSA Rennes. L'objectif est l'implémentation matérielle sur une cible FPGA MAX 10 via la plateforme DE10-Lite.

## Architecture du neurone
  
Le projet repose sur la modélisation d'un neurone biologique constitué d'un corps cellulaire, de dendrites (entrées) et d'un axone (sortie). En version numérique, chaque neurone agit comme un processeur élémentaire : un vecteur $$X$$ subit un produit scalaire avec un vecteur de poids synaptique $$W$$ et le résultat est la somme pondérée $$Y$$. Elle est ensuite appliquée à une fonction de décision dont la sortie est désignée par Z. Dans ce projet, Z est déterminé par un simple seuillage.
```math
Y = X \cdot W = \sum_{k=1}^n x_i w_i
```
```math
Z(Y) = \begin{cases}
V_{min} & \text{if } Y \leq T \\
V_{max} & \text{if } Y \gt T
\end{cases}
```

## Paramètres de Configuration

Les constantes globales du système sont définies dans le package pack_neurones.vhd: 
- Nombre d'entrées (N) : 4.
- Seuil (T) : 100.
- Sortie max (Vmax) : 16.
- Sortie min (Vmin) : 1.
- Poids (Wi) : Initialisés par défaut à 27.

## Structure du code VHDL

- pack_neurones.vhd : Centralise les constantes et définit le type Tab_int_const pour la gestion des bus d'entrées.
- neurone.vhd : Implémente la logique de calcul. La somme est réalisée via une boucle for et la décision par une structure conditionnelle if/else.
- tb_neurone.vhd : Banc de test permettant de simuler différents scénarios (entrées nulles, franchissement de seuil, valeurs maximales).

## Environnement technique et simulation ModelSim
  
- Synthèse : Intel Quartus Prime.
- Cible Matérielle : Intel MAX 10 (carte DE10-Lite).
- Interface : Utilisation des switches SW pour les entrées et des afficheurs 7 segments pour les résultats.

## État d'avancement
  
- [x] Modélisation du neurone élémentaire (VHDL).
- [x] Validation par simulation (Testbench).
- [ ] Synthèse RTL et optimisation des ressources.
- [ ] Modélisation du réseau multicouches.
- [ ] Intégration sur carte DE10-Lite.
