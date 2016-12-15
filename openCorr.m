function status = openCorr()

% Performs open correction
% Jeremy Smith 2015/09/21

global OBJLCR

try
    fprintf(OBJLCR, 'CORR:LENG 1');             % Cable length correction
    fprintf(OBJLCR, 'CORR:LOAD:STAT OFF');      % Load correction
    fprintf(OBJLCR, 'CORR:OPEN:STAT ON');       % Open correction
    fprintf(OBJLCR, 'CORR:SHOR:STAT ON');       % Short correction

    fprintf(OBJLCR, 'CORR:OPEN:EXEC');          % Perform correction (all frequencies)
    status = 1;
catch
    warning('Cannot perform correction');
    status = 0;
    return
end