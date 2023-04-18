function [t_interp, phi_interp, u_interp] = exportTrajectForQuanser(...
    phi_in, omega_in, u_in, t_in, dt_controller, filename, folder)
%exportTrajectForQuanser Export trajectory for quanser testrig
% Automatic correction of timesteps according to dt_controller

%   Z_in, t_in  ... Position and time of slider (can be random timestep)
%   dt_controller [s]   ... timestep of controller for export of trajectory
%   filename and folder ... place where the trajectory should be safed and
%                           name of the file; ".txt" does not need to be
%                           provided

%% Calculate time and interpolate trajectory
% Calculate timeline
t_interp = 0:dt_controller:t_in(end)+dt_controller;

% Interpolate trajectory to get the intermediary points
phi_interp = interp1(t_in, phi_in, t_interp, 'pchip', phi_in(end));
omega_interp = interp1(t_in, omega_in, t_interp, 'pchip', omega_in(end));
u_interp = interp1(t_in, u_in, t_interp, 'pchip', 0);

%% Export of Trajectory
% Check if filename was provided and display warning if not
if nargin < 6
    warning('no filename for export was provided - date used as filename')
    ExportString = 'traject';
elseif nargin >= 5
    ExportString = filename;
end

% Check if ".txt" exists
%if nargin > 3 && filename(end-3:end) ~= ".txt" 
if ~contains(ExportString, '.txt') % Better than above - might not work on all matlab Versions - automatic datatype addition
    ExportString = strcat(ExportString,'.txt');
end

ExportString = strcat(datestr(now,'yyyymmdd__HHMMSS_'), ExportString)

% Add folder to name - if provided
if nargin > 6
    ExportString = strcat(folder,'/',ExportString);
end


%% Plot trajectory to check result

% figure
% subplot(2,1,1)
% plot(t_in, phi_in)
% hold on
% stairs(t_in, phi_in)
% legend('values in', 'interpolated values')
% 
% subplot(2,1,2)
% plot(t_in, u_in)
% hold on
% stairs(t_in, u_in)
% legend('values in', 'interpolated values')


%% Actually export
fileID = fopen(ExportString,'w');

% Print first lines that are required
nbytes = fprintf(fileID, "// Define Variables: \n");
nbytes = fprintf(fileID, "float phi_ref[%d];\n", length(phi_interp));
nbytes = fprintf(fileID, "float omega_ref[%d];\n", length(u_interp));
nbytes = fprintf(fileID, "float u_ref[%d];\n", length(u_interp));

nbytes = fprintf(fileID, " \n");
% Print phi_ref trajectory
for index0 = 0:(length(phi_interp)-1)
    nbytes = fprintf(fileID, "phi_ref[%d] = %.8f;\n", index0, phi_interp(index0+1));
end

nbytes = fprintf(fileID, " \n");
% Print omgega_ref trajectory
for index = 0:(length(u_interp)-1)
    nbytes = fprintf(fileID, "omega_ref[%d] = %.8f;\n", index, omega_interp(index+1)); 
end

nbytes = fprintf(fileID, " \n");
% Print u_ref trajectory
for index = 0:(length(u_interp)-1)
    nbytes = fprintf(fileID, "u_ref[%d] = %.8f;\n", index, u_interp(index+1)); 
end

% Print the last lines that are required
nbytes = fprintf(fileID, " \n");
nbytes = fprintf(fileID, "// Define variables to export \n");
nbytes = fprintf(fileID, "k_lauf_max = %d; // Needs to be the highest index from u_ref and phi_ref \n", index);
nbytes = fprintf(fileID, " \n");
nbytes = fprintf(fileID, "// Actually export trajectories \n");
nbytes = fprintf(fileID, "phi_out = phi_ref[idx_requested]; \n");
nbytes = fprintf(fileID, "omega_out = phi_ref[idx_requested]; \n");
nbytes = fprintf(fileID, "u_out = u_ref[idx_requested]; \n");
    
% nbytes = fprintf(fileID, "gk_end = %d;", index);

fclose(fileID);


end