"""
Title:  Modellparameter
Author: Kaufmann Stefan
Date:   27.03.2023

"""


# Parameter erweitertes Modell
R  = 2.6          # Ankerwiderstand             [Ohm]
L  = 0.18*1e-3    # Ankerinduktivität           [H]
km = 7.68*1e-3    # Mschinenkonstante           [Nm/A]

kg = 70           # Übersetzungsverhältnis      []
Jm = 3.7143*1e-5   # Trägheitsmoment Motor       [kgm²]
J1 = 5.7364*1e-4    # Trägheitsmoment Last        [kgm²]

ks = 0.8742       # Federkonstante Kupplung     [Nm/rad] 
bs = 2.5*1e-3     # Dämpfung in der Kupplung    [kgm²/s]
b1 = 8.203*1e-3    # Dämpfung vor der Kupplung   [kgm²/s]
b2 = 4.6779*1e-5       # Dämpfung nach der Kupplung  [kgm²/s]

nm = 0.69         # Wirkungsgrad Motor          []
ng = 0.9          # Wirkungsgrad Getriebe       []

# vereinfachtes Modell
Jeq = 2.26528*1e-3   # Gesamtträgheitsmoment    [kgm²] 