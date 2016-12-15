function status = switchOffCorr()

% Switches off open and short corrections
% Jeremy Smith 2015/09/21

global OBJLCR

try
    fprintf(OBJLCR, 'CORR:LENG 1');             % Cable length correction
    fprintf(OBJLCR, 'CORR:LOAD:STAT OFF');      % Load correction
    fprintf(OBJLCR, 'CORR:OPEN:STAT OFF');      % Open correction
    fprintf(OBJLCR, 'CORR:SHOR:STAT OFF');      % Short correction
    status = 1;
catch
    warning('Cannot switch off correction');
    status = 0;
    return
end