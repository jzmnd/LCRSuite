connected = get(handles.text12, 'String');

startFreq = get(handles.popupmenu1, 'Value') - 1;
stopFreq = get(handles.popupmenu2, 'Value') - 1;
if (startFreq > stopFreq)
    stopFreq = startFreq + 1;
    set(handles.popupmenu2, 'Value', stopFreq + 1);
end

dcbias_str = get(handles.popupmenu3, 'String');
dcbias_i = get(handles.popupmenu3, 'Value');
if (strcmp(dcbias_str(dcbias_i), 'DC bias') == false)
    dcbias = str2double(dcbias_str(dcbias_i));
else
    dcbias = 'None';
end
    
vac = 1e-3*str2double(get(handles.edit3, 'String'));
average = str2num(get(handles.edit4, 'String'));

mmode_str = get(handles.popupmenu4, 'String');
mmode_i = get(handles.popupmenu4, 'Value');
if (strcmp(mmode_str{mmode_i}, 'Mode') == false)
    mmode = mmode_str{mmode_i};
else
    mmode = 'None';
end

integ_str = get(handles.popupmenu5, 'String');
integ_i = get(handles.popupmenu5, 'Value');
if (strcmp(integ_str{integ_i}, 'Integ') == false)
    integ = integ_str{integ_i};
else
    integ = 'None';
end

filename = get(handles.edit5, 'String');
deviceID = get(handles.edit6, 'String');
