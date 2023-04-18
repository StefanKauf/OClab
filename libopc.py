"""
Title:  Bibliothek mit Hilfsfunktionen
Author: Kaufmann Stefan
Date:   16.03.2023


Nützliche Funktionen welche häufig verwendet werden.
 - Runge Kutta Verfahren

"""

import numpy as np
import Parameter as param
import matplotlib as plt



######## ***************************************  
## Einstellung Plotts
######## ***************************************  

plt.rcParams.update({
    "text.usetex": True,
    #"font.family": "monospace",
    #"font.monospace": 'Computer Modern Typewriter',  
    "font.size": 15.0 
})



######## ***************************************  
## Runge Kutta Verfahren ode45
######## ***************************************  

def runge_kutta_k4(f,x,u,h=1):
    """ Runge Kutta Verfahren mit variabler Schrittweite 
        Params
         --------
        f:             Funktion welche integriert werden soll
        x:             Startvektor x0 = [x1 x2 x3 x4 x5 .... xN]
        u:             Eingangsvektor u = [u1 u2 u3 .... uM]
        h:             Schrittweite 
        t:             Hilfsvariable --> wird benötigt da f eine Funktion aus f(t,x,u) ist


        Returns
        --------
        x + dx:       neuer Zustandsvektor  [x1 x2 .... xN]   
                
    """
    #RK4 integration with zero-order hold on u
        
    f1 = f(x, u)
    f2 = f(x + 1/2*h*f1, u)
    f3 = f(x + 1/2*h*f2, u)
    f4 = f(x + h*f3, u)

    return x + (h/6.0)*(f1 + 2*f2 + 2*f3 + f4)



######## ***************************************  
## Systemdynamik vereinfachtes Lineares Modell
######## ***************************************  

A_simple = np.array([[-param.R/param.L, 0, -(param.km*param.kg)/param.L],
              [0,                0,                          1  ],
              [param.ng*param.nm*param.km/param.Jeq,0,-param.b1/param.Jeq]])

B_simple = np.array([1/param.L,
              0,
              0])
C_simple = np.array([0,1,0])
D_simple = 0

f_simple_dynamic = lambda x,u: A_simple@x+B_simple*u