function status = openE4980()

% Opens connection to E4980 LCR meter
% Modified by Jeremy Smith 2015/09/21

objs = instrfind;
if (isempty(objs) ~= 1)
    disp('ERROR: Already Connected')
    status = 1;
    return
end

%1.  Create the GPIB object
global OBJLCR

% The GPIB controller card number, this is the LOGICAL UNIT in the Agilent IO config software
BoardNumber = 7;        
DeviceNumber = 20;      % This is device settable

try
    OBJLCR = gpib('agilent', BoardNumber, DeviceNumber);
catch
    warning('No GPIB interface found');
    status = 0;
    return
end

%2.  Configure the gpib object
% Large input buffer.  This makes room for bringing in a lot of data.
set(OBJLCR, 'InputBufferSize', 4000000);

%3. Connect to the object
fopen(OBJLCR);                              % Open communication
fprintf(OBJLCR, '*RST');                    % Reset
fprintf(OBJLCR, '*CLS');                    % Clear
fprintf(OBJLCR, 'FORM ASC');                % ACSII mode
fprintf(OBJLCR, 'DISP:LINE GPIBCONTROL');   % Displays message
fprintf(OBJLCR, 'TRIG:SOUR BUS');           % GPIB triggering mode
fprintf(OBJLCR, 'AMPL:ALC ON');             % Auto level control on
fprintf(OBJLCR, 'CORR:LENG 1');             % Cable length correction

%warning('off', 'instrument:fscanf:unsuccessfulRead');
warning('off', 'MATLAB:nonIntegerTruncatedInConversionToChar');
warning('off', 'MATLAB:xlswrite:AddSheet');

disp('Connected to:');
disp(OBJLCR);

status = 1;

end