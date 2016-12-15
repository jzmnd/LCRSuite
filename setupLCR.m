function status = setupLCR(vac, integ, average, dcbias, mmode)

% Setup for basic list sweep measurements
% Jeremy Smith 2015/09/16
%   vac:           Small signal ac amplitude [V]
%   integ:         Integration time [SHORT, MED, LONG]
%   average:       Number of measurements to average
%   dcbias:        DC bias value [V]
%   mode:          Measurement mode [see manual for all options]

global OBJLCR

try
    fprintf(OBJLCR, ['FUNC:IMP:TYPE ' mmode]);
    fprintf(OBJLCR, ['VOLT ' num2str(vac)]);
    fprintf(OBJLCR, ['APER ' integ ',' num2str(average)]);
    fprintf(OBJLCR, ['BIAS:VOLT ' num2str(dcbias)]);
    fprintf(OBJLCR, 'DISP:PAGE LIST');              % Display list mode page
    fprintf(OBJLCR, 'LIST:MODE SEQ');               % List mode - sequence
    fprintf(OBJLCR, 'TRIG:DEL 0.1');                % Delay time 
    fprintf(OBJLCR, 'TRIG:TDEL 1');                 % Hold itme
catch
    warning('Could not setup LCR parameters');
    status = 0;
    return
end

status = 1;

end