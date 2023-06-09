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
import datetime


######## ***************************************  
## Einstellung Plotts
######## ***************************************  

plt.rcParams.update({
    "text.usetex": True,
    #"font.family": "monospace",
    #"font.monospace": 'Computer Modern Typewriter',  
    "font.size": 28.0,
    "axes.titlesize" : 30,
    "axes.labelsize" : 28,
    "lines.linewidth" : 3,
    "lines.markersize" : 10,
    "xtick.labelsize" : 28,
    "ytick.labelsize" : 28
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

A_simple = np.array([[-param.R/param.L, 0, -(param.km*param.kg)/(param.L)],
              [0,                0,                          1  ],
              [(param.ng*param.nm*param.km*param.kg)/(param.Jeq),0,-param.b1/param.Jeq]])

B_simple = np.array([1/param.L,
              0,
              0])
C_simple = np.array([0,1,0])
D_simple = 0

f_simple_dynamic = lambda x,u: A_simple@x+B_simple*u

######## ***************************************  
## Systemdynamik erweitertes Lineares Modell
######## ***************************************  s
Nenner = param.Jm*param.ng

A_ex = np.array([[-param.R/param.L, 0, -(param.km*param.kg)/(param.L), 0, 0],
              [0,                0,                          1  ,0,0],
              [(param.nm*param.km*param.kg)/(param.Jm),  -param.ks/Nenner,  (-param.bs-param.b1)/Nenner, param.ks/Nenner, param.bs/Nenner],
              [0,  0,0, 0,1],
              [0,  +param.ks/param.J1, +param.bs/param.J1, -param.ks/param.J1, (-param.bs-param.b2)/param.J1]])

B_ex = np.array([1/param.L,
              0,
              0,
              0,
              0])
C_ex = np.array([0,0,0,1,0])
D_ex = 0

f_ex_dynamic = lambda x,u: A_ex@x+B_ex*u


######## ***************************************  
## Systemdynamik erweitertes Lineares Modell mit Jeq
######## ***************************************  
Nenner2 = param.Jm*param.ng*param.kg**2
A_ex2 = np.array([[-param.R/param.L, 0, -(param.km*param.kg)/(param.L), 0, 0],
              [0,                0,                          1  ,0,0],
              [(param.nm*param.km)/(param.Jm*param.kg),  -param.ks/Nenner2,  (-param.bs-param.b1)/Nenner2, param.ks/Nenner2, param.bs/Nenner2],
              [0,  0,0, 0,1],
              [0,  +param.ks/param.J1, +param.bs/param.J1, -param.ks/param.J1, (-param.bs-param.b2)/param.J1]])

B_ex2 = np.array([1/param.L,
              0,
              0,
              0,
              0])
C_ex2 = np.array([0,0,0,1,0])
D_ex2 = 0

f_ex2_dynamic = lambda x,u: A_ex2@x+B_ex2*u
######## ***************************************  
## Export Trajektorie
######## ***************************************  

def exportTrajectForQuanser(phi_1_in, omega_1_in, u_in, t_in, dt_controller, filename, folder=None,
                            current_in=None, phi_2_in=None, omega_2_in=None):
    
    # Calculate time and interpolate trajectory
    # Calculate timeline
    t_interp = np.arange(0, t_in[-1]+dt_controller, dt_controller)
    
    # Interpolate trajectory to get the intermediary points
    phi_1_interp = np.interp(t_interp, t_in, phi_1_in)
    omega_1_interp = np.interp(t_interp, t_in, omega_1_in)
    u_interp = np.interp(t_interp, t_in, u_in)
    
    # If provided, the following are exported as well
    if current_in is not None:
        current_interp = np.interp(t_interp, t_in, current_in)
        if phi_2_in is not None:
            phi_2_interp = np.interp(t_interp, t_in, phi_2_in)
            if omega_2_in is not None:
                omega_2_interp = np.interp(t_interp, t_in, omega_2_in)
            else:
                omega_2_interp = np.zeros_like(phi_1_interp)
        else:
            phi_2_interp = np.zeros_like(phi_1_interp)
            omega_2_interp = np.zeros_like(phi_1_interp)
    else:
        current_interp = np.zeros_like(phi_1_interp)
        phi_2_interp = np.zeros_like(phi_1_interp)
        omega_2_interp = np.zeros_like(phi_1_interp)
    
    # Export of Trajectory
    # Check if filename was provided and display warning if not
    if filename is None:
        import warnings
        warnings.warn('No filename for export was provided - date used as filename')
        ExportString = 'traject'
    else:
        ExportString = filename
    
    # Check if ".txt" exists
    if not ExportString.endswith('.txt'):
        ExportString = ExportString + '.txt'
    
    ExportString = datetime.datetime.now().strftime("%Y%m%d__%H%M%S_") + ExportString
    
    # Add folder to name - if provided
    if folder is not None:
        ExportString = folder + '/' + ExportString
    
    # Actually export
    fileID = open(ExportString, 'w')
    
    # Print first lines that are required
    fileID.write("// Define Variables: \n")
    fileID.write("float phi_1_ref[{}];\n".format(len(phi_1_interp)))
    fileID.write("float phi_2_ref[{}];\n".format(len(phi_1_interp)))
    fileID.write("float omega_1_ref[{}];\n".format(len(phi_1_interp)))
    fileID.write("float omega_2_ref[{}];\n".format(len(phi_1_interp)))
    fileID.write("float i_ref[{}];\n".format(len(phi_1_interp)))
    fileID.write("float u_ref[{}];\n".format(len(phi_1_interp)))
    fileID.write("\n")
        
    # Print phi_ref trajectory
    for index in range(len(phi_1_interp)):
        fileID.write("phi_1_ref[{}] = {:.8f};\n".format(index, phi_1_interp[index]))
    fileID.write("\n")

    # Print omega_ref trajectory
    for index in range(len(phi_1_interp)):
        fileID.write("omega_1_ref[{}] = {:.8f};\n".format(index, omega_1_interp[index]))
    fileID.write("\n")

    # Print phi_ref trajectory
    for index in range(len(phi_1_interp)):
        fileID.write("phi_2_ref[{}] = {:.8f};\n".format(index, phi_2_interp[index]))
    fileID.write("\n")

    # Print omega_ref trajectory
    for index in range(len(phi_1_interp)):
        fileID.write("omega_2_ref[{}] = {:.8f};\n".format(index, omega_2_interp[index]))
    fileID.write("\n")

    # Print i_ref trajectory
    for index in range(len(phi_1_interp)):
        fileID.write("i_ref[{}] = {:.8f};\n".format(index, current_interp[index]))
    fileID.write("\n")

    # Print u_ref trajectory
    for index in range(len(phi_1_interp)):
        fileID.write("u_ref[{}] = {:.8f};\n".format(index, u_interp[index]))
    fileID.write("\n")


    # Print the last lines that are required
    fileID.write("\n")
    fileID.write("// Define variables to export \n")
    fileID.write("k_lauf_max = {}; // Needs to be the highest index from u_ref and phi_ref \n".format(index))

    fileID.write("\n")
    fileID.write("// Actually export trajectories \n")
    fileID.write("phi_1_out = phi_1_ref[idx_requested]; \n")
    fileID.write("phi_2_out = phi_2_ref[idx_requested]; \n")
    fileID.write("omega_1_out = omega_1_ref[idx_requested]; \n")
    fileID.write("omega_2_out = omega_2_ref[idx_requested]; \n")
    fileID.write("i_out = i_ref[idx_requested]; \n")
    fileID.write("u_out = u_ref[idx_requested]; \n")

    fileID.write("\n")
    fileID.write("// Export Endpoints \n")
    fileID.write("phi_1_end = phi_1_ref[{}]; \n".format(index))
    fileID.write("phi_2_end = phi_2_ref[{}]; \n".format(index))

    fileID.close()



