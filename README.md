# Réseau de neurones sur FPGA

Ce dépôt contient les travaux de modélisation et de synthèse d'un réseau de neurones artificiels réalisés dans le cadre du cours de Logique Programmable en 4EII à l'INSA Rennes. L'objectif est l'implémentation matérielle sur une cible FPGA MAX 10 via la plateforme DE10-Lite.

## Architecture du neurone
  
Le projet repose sur la modélisation d'un neurone biologique constitué d'un corps cellulaire, de dendrites (entrées) et d'un axone (sortie). En version numérique, chaque neurone agit comme un processeur élémentaire: Somme pondérée (Y) : Multiplication des entrées Xi par des poids Wi (représentant la force de la synapse).
Équation : Y = sum_{i=0}^{N-1} Wi*Xi.
Fonction de transfert (Z) : Application d'un seuillage simple pour déterminer l'état de sortie.
Z = Vmax si Y > T.
Z = Vmin sinon.

## Paramètres de Configuration

Les constantes globales du système sont définies dans le package pack_neurones.vhd: 
- Nombre d'entrées (N) : 4.
- Seuil (T) : 100.
- Sortie max (Vmax) : 16.
- Sortie min (Vmin) : 1.
- Poids (Wi) : Initialisés par défaut à 27.

Structure du code VHDL :

- pack_neurones.vhd : Centralise les constantes et définit le type Tab_int_const pour la gestion des bus d'entrées.
- neurone.vhd : Implémente la logique de calcul. La somme est réalisée via une boucle for et la décision par une structure conditionnelle if/else.
- tb_neurone.vhd : Banc de test permettant de simuler différents scénarios (entrées nulles, franchissement de seuil, valeurs maximales).

Environnement technique et simulation ModelSim :
  
- Synthèse : Intel Quartus Prime.
- Cible Matérielle : Intel MAX 10 (carte DE10-Lite).
- Interface : Utilisation des switches SW pour les entrées et des afficheurs 7 segments pour les résultats.

État d'avancement :
  
- [x] Modélisation du neurone élémentaire (VHDL).
- [x] Validation par simulation (Testbench).
- [ ] Synthèse RTL et optimisation des ressources.
- [ ] Modélisation du réseau multicouches.
- [ ] Intégration sur carte DE10-Lite.
