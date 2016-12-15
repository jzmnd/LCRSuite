function [Dataf, DataA, DataB] = listsweepFREQ(listStart, listEnd)

% Runs list sweep over frequency range
% Jeremy Smith 2015/09/21
%   listStart:   Index of first frequency (1-15)
%   listEnd:     Index of last frequency (1-15)

global OBJLCR

fprintf(OBJLCR, '*CLS');               % Clear

fList = '2E1,5E1,1E2,2E2,5E2,1E3,2E3,5E3,1E4,2E4,5E4,1E5,2E5,5E5,1E6';
fListtrim = fList(4*listStart - 3 : 4*listEnd - 1);

fprintf(OBJLCR, ['LIST:FREQ ' num2str(fListtrim)]);

fprintf(OBJLCR, 'BIAS:STAT ON');    % DC Bias on 
fprintf(OBJLCR, 'INIT:CONT ON');    % Enables the automatic trigger to change state from the “Idle” state to the “Wait for Trigger” state
fprintf(OBJLCR, 'TRIG:IMM');        % Tiggers measurement
fprintf(OBJLCR, 'FETC?');           % Fetch data
%fprintf(OBJLCR, '*WAI');            % Wait for fetch
%pause(1);

try
    Data_str = fscanf(OBJLCR);
    Data = textscan(Data_str, '%f', 'Delimiter', ',');
    disp(Data_str);
catch
    warning('Could not fetch data');
    Dataf = 0;
    DataA = 0;
    DataB = 0;
    return
end

Dataf = textscan(fListtrim, '%f', 'Delimiter', ',');
DataA = Data{1}(1:4:end);
DataB = Data{1}(2:4:end);
Dataf = Dataf{1};

fprintf(OBJLCR, 'BIAS:STAT OFF');   % DC Bias off
fprintf(OBJLCR, 'ABOR');            % Resets the trigger system. The trigger state is then in the “Idle” state

end