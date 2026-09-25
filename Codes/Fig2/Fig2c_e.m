close all
clear all

cd 'C:\Users\BSNO\Desktop\Li_cognitive_flexibility\Codes\Fig2'
load('Fig2c_e_chemo_inhibition_data.mat')

% Fig2c
yrange = 150;
ydata = wt_hM4Di_trials_to_criterion;
[r, c] = size(ydata);
SEM = std(ydata)/sqrt(r);
coord_scale = 1;
xdata = repmat((1:c)/coord_scale, r, 1);

[h,p,ci,stats] = ttest(ydata(:,1),ydata(:,2));

if p > 0.05
    sig_level = 'NS';
elseif p > 0.01
    sig_level = '*';
elseif p > 0.001
    sig_level = '**';
else
    sig_level = '***';
end

gap = 0.1;
for group = 1:c
    group_coord = group/coord_scale;
    for i = 1:r
        value = ydata(i,group);
        equal_index = find(abs(ydata(:,group)-value) < 3);
        repeat_number = size(equal_index,1);
        xdata(equal_index, group) = group_coord-(repeat_number-1)*gap/2:gap:group_coord+(repeat_number-1)*gap/2;
    end
end

figure

CNO_color = [0.96 0.17 0.22];

for i = 1:r
    plot(xdata(i,:),ydata(i,:),'Color', [0.85 0.85 0.85])
    hold on;
end

p1 = scatter(xdata(:,1), ydata(:,1),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor','black');
p2 = scatter(xdata(:,2), ydata(:,2),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor',CNO_color);

mean_offset = 0.25;
plot([(1:c)/coord_scale-mean_offset; (1:c)/coord_scale+mean_offset], repmat(mean(ydata, 1), 2, 1), 'k-','Linewidth',2)

for i = 1:c
    errorbar(i/coord_scale,mean(ydata(:,i)), SEM(i),'Color',[0.3 0.3 0.3],'CapSize',10)
end

bar_lower_end = yrange*0.05;
bar_peak = yrange*0.075;
NS_position =  yrange*0.125;
asteris_position = yrange*0.1;

plot([1 1 2 2],[max(ydata(:)+bar_lower_end) max(ydata(:)+bar_peak) max(ydata(:)+bar_peak) max(ydata(:)+bar_lower_end)],'k-','Linewidth',1);
if strcmp('NS',sig_level) == 1
    text(1.5,max(ydata(:)+NS_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
else
    text(1.5,max(ydata(:)+asteris_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
end

hold off
box off

ylim([0 150])
yticks(0:30:150)
xlim([0.25 2.75])

ylabel('Trials to criterion')

set(gca,'xtick',[1 2],'xticklabel',{'Saline','CNO'})
set(gca,'FontSize',15)
set(gca,'TickDir','out');

fig=gcf;
fig.Position(3:4)=[300,400];


% Fig2d
figure

% CG
ydata = wt_hM4Di_accuracy_CG;
yrange = 1;

[r, c] = size(ydata);
SEM = std(ydata)/sqrt(r);
coord_scale = 1;
xdata = repmat((1:c)/coord_scale, r, 1);

[h,p,ci,stats] = ttest(ydata(:,1),ydata(:,2))

if p > 0.05
    sig_level = 'NS';
elseif p > 0.01
    sig_level = '*';
elseif p > 0.001
    sig_level = '**';
else
    sig_level = '***';
end

gap = 0.15;
for group = 1:c
    group_coord = group/coord_scale;
    for i = 1:r
        value = ydata(i,group);
        equal_index = find(abs(ydata(:,group)-value) < 0.015);
        repeat_number = size(equal_index,1);
        xdata(equal_index, group) = group_coord-(repeat_number-1)*gap/2:gap:group_coord+(repeat_number-1)*gap/2;
    end
end

CNO_color = [0.96 0.17 0.22];

for i = 1:r
    plot(xdata(i,:),ydata(i,:),'Color', [0.85 0.85 0.85])
    hold on;
end

p1 = scatter(xdata(:,1), ydata(:,1),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor','black');
p2 = scatter(xdata(:,2), ydata(:,2),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor',CNO_color);

mean_offset = 0.25;
plot([(1:c)/coord_scale-mean_offset; (1:c)/coord_scale+mean_offset], repmat(mean(ydata, 1), 2, 1), 'k-','Linewidth',2)

for i = 1:c
    errorbar(i/coord_scale,mean(ydata(:,i)), SEM(i),'Color',[0.3 0.3 0.3],'CapSize',10)
end

bar_lower_end = yrange*0.05;
bar_peak = yrange*0.075;
NS_position =  yrange*0.125;
asteris_position = yrange*0.1;

plot([1 1 2 2],[max(ydata(:)+bar_lower_end) max(ydata(:)+bar_peak) max(ydata(:)+bar_peak) max(ydata(:)+bar_lower_end)],'k-','Linewidth',1);
if strcmp('NS',sig_level) == 1
    text(1.5,max(ydata(:)+NS_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
else
    text(1.5,max(ydata(:)+asteris_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
end

% ICG
ydata = wt_hM4Di_accuracy_ICG;

[r, c] = size(ydata);
SEM = std(ydata)/sqrt(r);
coord_scale = 1;
xdata = repmat((1:c)/coord_scale, r, 1);

[h,p,ci,stats] = ttest(ydata(:,1),ydata(:,2))

if p > 0.05
    sig_level = 'NS';
elseif p > 0.01
    sig_level = '*';
elseif p > 0.001
    sig_level = '**';
else
    sig_level = '***';
end

gap = 0.15;
for group = 1:c
    group_coord = group/coord_scale;
    for i = 1:r
        value = ydata(i,group);
        equal_index = find(abs(ydata(:,group)-value) < 0.015);
        repeat_number = size(equal_index,1);
        xdata(equal_index, group) = group_coord-(repeat_number-1)*gap/2:gap:group_coord+(repeat_number-1)*gap/2;
    end
end

CNO_color = [0.96 0.17 0.22];

for i = 1:r
    plot(xdata(i,:)+2,ydata(i,:),'Color', [0.85 0.85 0.85])
    hold on;
end

p1 = scatter(xdata(:,1)+2, ydata(:,1),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor','black');
p2 = scatter(xdata(:,2)+2, ydata(:,2),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor',CNO_color);

mean_offset = 0.25;
plot([(1:c)/coord_scale-mean_offset+2; (1:c)/coord_scale+mean_offset+2], repmat(mean(ydata, 1), 2, 1), 'k-','Linewidth',2)

for i = 1:c
    errorbar(i/coord_scale +2,mean(ydata(:,i)), SEM(i),'Color',[0.3 0.3 0.3],'CapSize',10)
end

plot([3 3 4 4],[max(ydata(:)+bar_lower_end) max(ydata(:)+bar_peak) max(ydata(:)+bar_peak) max(ydata(:)+bar_lower_end)],'k-','Linewidth',1);
if strcmp('NS',sig_level) == 1
    text(3.5,max(ydata(:)+NS_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
else
    text(3.5,max(ydata(:)+asteris_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
end

hold off
box off

ylim([0 1])
yticks(0:0.2:1)
xlim([0.25 4.75])

lgd = legend([p1 p2],{'Saline','CNO'},'Orientation','vertical');
lgd.ItemTokenSize = [15,10];
lgd.Location = 'south';
lgd.Box = 'off';

ylabel('Fraction correct')

set(gca,'xtick',[1.5 3.5],'xticklabel',{'CG','ICG'})
set(gca,'FontSize',15)
set(gca,'TickDir','out');

ax = gca;
ax.Clipping = "off";
ax.OuterPosition(4) = 0.9;

fig=gcf;
fig.Position(3:4)=[325,400];


% Fig 2e
figure

% CG
ydata = wt_hM4Di_response_time_CG;

yrange = 4;

[r, c] = size(ydata);
SEM = std(ydata)/sqrt(r);
coord_scale = 1;
xdata = repmat((1:c)/coord_scale, r, 1);

[h,p,ci,stats] = ttest(ydata(:,1),ydata(:,2))

if p > 0.05
    sig_level = 'NS';
elseif p > 0.01
    sig_level = '*';
elseif p > 0.001
    sig_level = '**';
else
    sig_level = '***';
end

gap = 0.15;
for group = 1:c
    group_coord = group/coord_scale;
    for i = 1:r
        value = ydata(i,group);
        equal_index = find(abs(ydata(:,group)-value) < 0.06);
        repeat_number = size(equal_index,1);
        xdata(equal_index, group) = group_coord-(repeat_number-1)*gap/2:gap:group_coord+(repeat_number-1)*gap/2;
    end
end

CNO_color = [0.96 0.17 0.22];

for i = 1:r
    plot(xdata(i,:),ydata(i,:),'Color', [0.85 0.85 0.85])
    hold on;
end

p1 = scatter(xdata(:,1), ydata(:,1),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor','black');
p2 = scatter(xdata(:,2), ydata(:,2),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor',CNO_color);

mean_offset = 0.25;
plot([(1:c)/coord_scale-mean_offset; (1:c)/coord_scale+mean_offset], repmat(mean(ydata, 1), 2, 1), 'k-','Linewidth',2)

for i = 1:c
    errorbar(i/coord_scale,mean(ydata(:,i)), SEM(i),'Color',[0.3 0.3 0.3],'CapSize',10)
end

bar_lower_end = yrange*0.05;
bar_peak = yrange*0.075;
NS_position =  yrange*0.125;
asteris_position = yrange*0.1;

plot([1 1 2 2],[max(ydata(:)+bar_lower_end) max(ydata(:)+bar_peak) max(ydata(:)+bar_peak) max(ydata(:)+bar_lower_end)],'k-','Linewidth',1);
if strcmp('NS',sig_level) == 1
    text(1.5,max(ydata(:)+NS_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
else
    text(1.5,max(ydata(:)+asteris_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
end


% ICG
ydata = wt_hM4Di_response_time_ICG;

[r, c] = size(ydata);
SEM = std(ydata)/sqrt(r);
coord_scale = 1;
xdata = repmat((1:c)/coord_scale, r, 1);

[h,p,ci,stats] = ttest(ydata(:,1),ydata(:,2))

if p > 0.05
    sig_level = 'NS';
elseif p > 0.01
    sig_level = '*';
elseif p > 0.001
    sig_level = '**';
else
    sig_level = '***';
end

gap = 0.15;
for group = 1:c
    group_coord = group/coord_scale;
    for i = 1:r
        value = ydata(i,group);
        equal_index = find(abs(ydata(:,group)-value) < 0.06);
        repeat_number = size(equal_index,1);
        xdata(equal_index, group) = group_coord-(repeat_number-1)*gap/2:gap:group_coord+(repeat_number-1)*gap/2;
    end
end

CNO_color = [0.96 0.17 0.22];

for i = 1:r
    plot(xdata(i,:)+2,ydata(i,:),'Color', [0.85 0.85 0.85])
    hold on;
end

p1 = scatter(xdata(:,1)+2, ydata(:,1),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor','black');
p2 = scatter(xdata(:,2)+2, ydata(:,2),'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor',CNO_color);

mean_offset = 0.25;
plot([(1:c)/coord_scale-mean_offset+2; (1:c)/coord_scale+mean_offset+2], repmat(mean(ydata, 1), 2, 1), 'k-','Linewidth',2)

for i = 1:c
    errorbar(i/coord_scale +2,mean(ydata(:,i)), SEM(i),'Color',[0.3 0.3 0.3],'CapSize',10)
end

plot([3 3 4 4],[max(ydata(:)+bar_lower_end) max(ydata(:)+bar_peak) max(ydata(:)+bar_peak) max(ydata(:)+bar_lower_end)],'k-','Linewidth',1);
if strcmp('NS',sig_level) == 1
    text(3.5,max(ydata(:)+NS_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
else
    text(3.5,max(ydata(:)+asteris_position),sig_level,'FontSize',15,'HorizontalAlignment','center')
end

hold off
box off

ylim([0 4])
yticks(0:1:4)
xlim([0.25 4.75])

lgd = legend([p1 p2],{'Saline','CNO'},'Orientation','vertical');
lgd.ItemTokenSize = [15,10];
lgd.Location = 'south';
lgd.Box = 'off';

ylabel('Response time (s)')

set(gca,'xtick',[1.5 3.5],'xticklabel',{'CG','ICG'})
set(gca,'FontSize',15)
set(gca,'TickDir','out');

fig=gcf;
fig.Position(3:4)=[325,400];