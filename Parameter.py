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
Jm = 6.255*1e-7   # Trägheitsmoment Motor       [kgm²]
J1 = 8.16*1e-4    # Trägheitsmoment Last        [kgm²]

ks = 2.2622       # Federkonstante Kupplung     [Nm/rad] 
bs = 9.3*1e-3     # Dämpfung in der Kupplung    [kgm²/s]
b1 = 0.25-1e-3    # Dämpfung vor der Kupplung   [kgm²/s]
b2 = 1.7e-5       # Dämpfung nach der Kupplung  [kgm²/s]

nm = 0.69         # Wirkungsgrad Motor          []
ng = 0.9          # Wirkungsgrad Getriebe       []

# vereinfachtes Modell
Jeq = 2.26528*1e-3   # Gesamtträgheitsmoment    [kgm²] 