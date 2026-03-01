function Calculator

clc
close all

% -------------------------------------------------
% SCIENTIFIC CALCULATOR
% Author : Chele Rajesh
% -------------------------------------------------

% Calculator window
fig = figure('Name','Scientific Calculator',...
'NumberTitle','off',...
'Position',[480 0 420 580],...
'Resize','off',...
'Color',[0.94 0.94 0.94]);

% -------------------------------------------------
% DISPLAY SCREEN
% -------------------------------------------------

display = uicontrol(fig,...
'Style','edit',...
'Position',[20 490 380 70],...
'FontSize',16,...
'HorizontalAlignment','right',...
'BackgroundColor','white');

% -------------------------------------------------
% BUTTON GRID SETTINGS
% -------------------------------------------------

cols = 6;
rows = 8;

btnW = 60;
btnH = 50;

gap = 5;

xStart = 20;
yStart = 415;

% -------------------------------------------------
% BUTTON LAYOUT
% -------------------------------------------------

buttons = {

'sin','cos','tan','sqrt','^','DEG'
'asin','acos','atan','log','ln','RAD'
'exp','abs','pi','e','!','mod'
'7','8','9','/','(',')'
'4','5','6','*','[',']'
'1','2','3','-','det','inv'
'0','.','=','+','C','DEL'
'x^2','x^3','1/x','rand','A','B'

};

% -------------------------------------------------
% CREATE BUTTONS
% -------------------------------------------------

for r = 1:rows
for c = 1:cols

label = buttons{r,c};

x = xStart + (c-1)*(btnW+gap);
y = yStart - (r-1)*(btnH+gap);

uicontrol(fig,...
'Style','pushbutton',...
'String',label,...
'Position',[x y btnW btnH],...
'FontSize',10,...
'Callback',@(src,event)press(label));

end
end

% -------------------------------------------------
% DEGREE / RADIAN MODE
% -------------------------------------------------

mode = 'RAD';

% -------------------------------------------------
% BUTTON FUNCTION
% -------------------------------------------------

function press(val)

txt = get(display,'String');

switch val

% -------------------------------------------------
% CALCULATE
% -------------------------------------------------

case '='

try
    
expr = txt;

if strcmp(mode,'DEG')

expr = strrep(expr,'sin(','sind(');
expr = strrep(expr,'cos(','cosd(');
expr = strrep(expr,'tan(','tand(');

end

result = eval(expr);

set(display,'String',num2str(result))

catch

set(display,'String','Error')

end

% -------------------------------------------------
% CLEAR
% -------------------------------------------------

case 'C'

set(display,'String','')

% -------------------------------------------------
% DELETE
% -------------------------------------------------

case 'DEL'

if ~isempty(txt)
set(display,'String',txt(1:end-1))
end

% -------------------------------------------------
% MODE CHANGE
% -------------------------------------------------

case 'DEG'
mode = 'DEG';

case 'RAD'
mode = 'RAD';

% -------------------------------------------------
% SCIENTIFIC FUNCTIONS
% -------------------------------------------------

case 'sin'
set(display,'String',[txt 'sin('])

case 'cos'
set(display,'String',[txt 'cos('])

case 'tan'
set(display,'String',[txt 'tan('])

case 'asin'
set(display,'String',[txt 'asin('])

case 'acos'
set(display,'String',[txt 'acos('])

case 'atan'
set(display,'String',[txt 'atan('])

case 'sqrt'
set(display,'String',[txt 'sqrt('])

case 'log'
set(display,'String',[txt 'log10('])

case 'ln'
set(display,'String',[txt 'log('])

case 'exp'
set(display,'String',[txt 'exp('])

case 'abs'
set(display,'String',[txt 'abs('])

case 'pi'
set(display,'String',[txt num2str(pi)])

case 'e'
set(display,'String',[txt num2str(exp(1))])

case '!'
set(display,'String',[txt 'factorial('])

case 'mod'
set(display,'String',[txt 'mod('])

case 'det'
set(display,'String',[txt 'det('])

case 'inv'
set(display,'String',[txt 'inv('])

case 'x^2'
set(display,'String',[txt '.^2'])

case 'x^3'
set(display,'String',[txt '.^3'])

case '1/x'
set(display,'String',[txt '1/('])

case 'rand'
set(display,'String',[txt num2str(rand)])

case 'A'
set(display,'String',[txt 'A'])

case 'B'
set(display,'String',[txt 'B'])

otherwise

set(display,'String',[txt val])

end

end

end