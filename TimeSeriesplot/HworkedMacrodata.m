load('macrotimeseries1.mat')
%%
load('Recessions.mat')
start=Recessions(:,1);
finish=Recessions(:,2);
%%

startdate = datenum('Q1-1964','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy');
enddate = datenum('Q4-2021','QQ-yyyy');%startdate = datenum('04-1997','mm-yyyy'); 
dt = linspace(startdate,enddate,232);

%%

fig1 =figure('color','w') 


set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR 
%figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
%set(0,'defaultaxesfontname','cambria math') 
set(0,'defaultaxesfontname','cambria math', 'defaulttextinterpreter', 'latex');

[h1]=plot(dt,labobs);
shadeyears(start,finish);
hold on;
% Create a plot with 2 y axes using the plotyy function
[ax, h1, h2] = plotyy(dt,labobs,dt, yobs, 'plot');
axis tight;  
datetick('x','yyyy','keepticks');
% Add title and x axis label
%xlabel('Years','FontSize',30);
set(ax(1),'XLim',[datenum(1964,3,1) datenum(2021,12,1)],'FontSize',30);  
set(ax(2),'Xlim',[datenum(1964,3,1) datenum(2021,12,1)],'FontSize',30); 
set(ax(1),'ycolor',[165,3,3]/255)
set(ax(2),'ycolor',[1,39,89]/255)
grid on
% Use the axis handles to set the labels of the y axes
set(get(ax(1), 'Ylabel'),'String','Billions of Hours','FontSize',38,'Color',[165,3,3]/255 );
set(get(ax(2), 'Ylabel'),'String','Billions of Dollars','FontSize',38,'Color',[1,39,89]/255); %U.S. Dollars per Barrell
yt=get(gca,'YTick');
set(ax(1),'YTickLabel',sprintf('%.0f\n',yt))
set(ax(2),'YTickLabel',sprintf('%.0f\n',yt))
% set color of lines
set(h1,'LineWidth',2.5,'Color',[165,3,3]/255)
set(h2,'LineWidth',2.5,'Color',[1,39,89]/255)
lgd = legend([h1;h2],'Total Hours Worked','Gross Domestic Product','Location','best');
lgd.FontSize = 32;

%export_fig hoursgdp -m2.5 -painters
exportgraphics(fig1, 'hoursgdp.pdf', 'ContentType', 'vector');

%%
% Hours of Wage and Salary Workers on Nonfarm Payrolls: Total (TOTLQ)
% Billions of Hours,
% Seasonally Adjusted Annual Rate

% gdp Billions of Dollars, Seasonally Adjusted Annual Rate



%% plot hours per gdp

Productivity_variable = yobs./labobs;

startdate = datenum('Q1-2000','QQ-yyyy');
enddate = datenum('Q4-2021','QQ-yyyy');
%%
dt = linspace(startdate, enddate, 89); % Adjust the number of points accordingly

%%

%validIndices = dt >= startdate & dt <= enddate;
NProductivity_variable = Productivity_variable(144:232);
Nyobs = yobs(144:232);
%%



%%



%%


fig2= figure('color','w') 
%figure('Position', [1, 1, 1800, 1050]); % Adjust the size as needed

set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math', 'defaulttextinterpreter', 'latex');
%set(0, 'defaultaxesfontname', 'Helvetica', 'defaulttextinterpreter', 'latex');

% Your plotting code
plot(dt, NProductivity_variable, 'LineWidth', 2.5, 'Color', [165, 3, 3]/255);
axis tight;  
shadeyears(start, finish);
hold on;

% Datetick
datetick('x', 'yyyy', 'keepticks');

% Add title and x axis label using LaTeX interpreter
%title('Your Title', 'Interpreter', 'latex', 'FontSize', 19);
%xlabel('Years', 'Interpreter', 'latex', 'FontSize', 30);

% Set the axis handle for the y-axis
ax = gca;

% Use LaTeX interpreter for y-axis label
ylabel('GDP per Hour $\$/h$', 'Interpreter', 'latex', 'FontSize', 38, 'Color', [165, 3, 3]/255);

% Set the x-axis limits
set(ax, 'XLim', [datenum(2000, 3, 1) datenum(2021, 12, 1)], 'FontSize', 30);  

% Set the color of y-axis ticks
set(ax, 'ycolor', [165, 3, 3]/255);


% Adjust other properties
ax.YAxis.Exponent = 0;
ax.FontSize = 38; 

grid on

% Save the figure using export_fig



%export_fig hoursgdpPoductiv -m2.5 -painters
exportgraphics(fig2, 'hoursgdpPoductiv.pdf', 'ContentType', 'vector');
