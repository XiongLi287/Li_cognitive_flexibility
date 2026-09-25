close all
clear all

cd 'C:\Users\BSNO\Desktop\Li_cognitive_flexibility\Codes\Fig1'
load('Fig1d_e_performance_data.mat')

Height_rule_color = [0.9883, 0.5, 0.0313];
Object_rule_color = [0.0664, 0.6758, 0.0078];

figure

activity = performance_oj_start;
time_points = 1:3;
p1_lines = plot(time_points,activity','Color', [0.875 0.875 0.875]);
hold on
scatter(time_points, activity', 10, 'LineWidth', 1,'MarkerFaceColor', [0.875 0.875 0.875],'MarkerEdgeColor', [0.875 0.875 0.875])
p1 = plot(time_points,mean(activity,1),'Color', Object_rule_color);
p1_scatter = scatter(time_points, mean(activity,1), 50, 'LineWidth', 1, 'MarkerFaceColor', 'white', 'MarkerEdgeColor', Object_rule_color);

activity = performance_oj_end;
time_points = 4:6;
p2_lines = plot(time_points,activity','Color', [0.875 0.875 0.875]);
scatter(time_points, activity', 10, 'LineWidth', 1,'MarkerFaceColor', [0.875 0.875 0.875],'MarkerEdgeColor', [0.875 0.875 0.875])
p2 = plot(time_points,mean(activity,1),'Color', Object_rule_color);
p2_scatter = scatter(time_points, mean(activity,1), 50, 'LineWidth', 1, 'MarkerFaceColor', 'white', 'MarkerEdgeColor', Object_rule_color);

fill([3.35 3.45 3.65 3.55],[0.275 0.325 0.325 0.275],'w','EdgeColor','none');
plot([3.35 3.45], [0.275, 0.325] ,'k-', 'LineWidth', 1);
plot([3.55 3.65], [0.275, 0.325] ,'k-', 'LineWidth', 1);

yticks(0:0.2:1);
set(gca,'xtick',[1 2 3 4 5 6],'xticklabel',{'1','2','3', 'n-2', 'n-1', 'n'})
xlim([0.5 time_points(end)+0.25]);
ylim([0.3 1])

font_size = 15;
xlabel('Session','FontSize',font_size)
ylabel('Fraction correct','FontSize',font_size)
title('Object rule','FontWeight','normal','FontSize',font_size)
set(gca,'FontSize',font_size)
set(gca,'TickDir','out');
box off
hold off

ax = gca;
ax.Clipping = "off";

fig=gcf;
fig.Position(3:4)=[350,300];


figure

activity = performance_ht_start;
time_points = 1:3;
p1_lines = plot(time_points,activity','Color', [0.875 0.875 0.875]);
hold on
scatter(time_points, activity', 10, 'LineWidth',1,'MarkerFaceColor',[0.875 0.875 0.875],'MarkerEdgeColor',[0.875 0.875 0.875])
p1 = plot(time_points,mean(activity,1),'Color', Height_rule_color);
p1_scatter = scatter(time_points, mean(activity,1), 50, 'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor', Height_rule_color);

activity = performance_ht_end;
time_points = 4:6;
p2_lines = plot(time_points,activity','Color', [0.875 0.875 0.875]);
scatter(time_points, activity', 10, 'LineWidth',1,'MarkerFaceColor',[0.875 0.875 0.875],'MarkerEdgeColor',[0.875 0.875 0.875])
p2 = plot(time_points,mean(activity,1),'Color', Height_rule_color);
p2_scatter = scatter(time_points, mean(activity,1), 50, 'LineWidth',1,'MarkerFaceColor','white','MarkerEdgeColor', Height_rule_color);

fill([3.35 3.45 3.65 3.55],[0.275 0.325 0.325 0.275],'w','EdgeColor','none');
plot([3.35 3.45], [0.275, 0.325] ,'k-','LineWidth',1);
plot([3.55 3.65], [0.275, 0.325] ,'k-','LineWidth',1);

yticks(0:0.2:1);
set(gca,'xtick',[1 2 3 4 5 6],'xticklabel',{'1','2','3', 'n-2', 'n-1', 'n'})
xlim([0.5 time_points(end)+0.25]);
ylim([0.3 1])

font_size = 15;
xlabel('Session','FontSize',font_size)
ylabel('Fraction correct','FontSize',font_size)
title('Height rule','FontWeight','normal','FontSize',font_size)
set(gca,'FontSize',font_size)
set(gca,'TickDir','out');
box off
hold off

ax = gca;
ax.Clipping = "off";

fig=gcf;
fig.Position(3:4)=[350,300];