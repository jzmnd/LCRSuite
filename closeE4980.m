function status = closeE4980()

% Closes connection to E4980
% Modified by Jeremy Smith 2015/09/21

% Returns all serial port objects existing in memory
objs = instrfind;

if (isempty(objs) ~= 1)
    disp('Closing:');
    disp(objs);
    fclose(objs);
    delete(objs);
end

clear global OBJLCR

status = 0;

end