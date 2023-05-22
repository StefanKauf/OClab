"""
Title:  Bibliothek mit Kostenfuntkionen
Author: Kaufmann Stefan
Date:   22.05.2023


Nützliche Funktionen welche häufig verwendet werden.
 - Runge Kutta Verfahren

"""

import numpy as np
xN = np.array([0,np.pi/2,0])
xf = np.transpose(np.array([xN]))



# Cost function


######## ***************************************  
## Quadratische Kostenfunktion
######## ***************************************  


# Quadratisches Gütemaß
Q = np.diag([0, 20, 0])          # don't turn too sharply
R = np.diag([1])               # keep inputs small

S = np.diag([0, 10, 0])             # get close to final point

def cost_quad(x,u, dt=1/1000):
    # x = [x0 x1 x2 x3 ..], und u = [u0,u1,u2,u3,...]    
    N = len(u)
    cost = x[:,N-1].T@S@x[:,N-1]/2            # Endkostenterm 0.5*xSx
    for k in range(0,N-2):        
                
        cost += dt*((x[:,k].T-xN)@Q@(x[:,k]-xN))/2 
        cost += dt*u[k]*R*u[k]/2
            
    return cost


######## ***************************************  
## Quadratische Kostenfunktion
######## ***************************************  

def cost_Scheinleistung(x,u, dt=1/1000):
    # x = [x0 x1 x2 x3 ..], und u = [u0,u1,u2,u3,...]    
    # mit x0 = [i, phi, omega] 
    N = len(u) -1
     
    cost = 0
    for k in range(0,N-1):  
        cost += np.abs(dt*((x[k]-xN[0])*u[k]))      #  laufende Kosten  U*I*dt       
       
    return cost