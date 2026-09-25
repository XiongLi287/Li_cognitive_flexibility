close all
clear all

cd 'C:\Users\BSNO\Desktop\Li_cognitive_flexibility\Codes\Fig3'
load('Fig3i_k_rule_neuron_activity.mat')

% Fig3i
Object_rule_color = [0.4392, 0.8039, 0.4039];
Height_rule_color = [0.9921, 0.7019, 0.4196];

neuron_oj_index = (find(F_rule_multi_align_norm_sorted(:,341)<=170))';
neuron_ht_index = (find(F_rule_multi_align_norm_sorted(:,341)>170))';
n_neuron = size(neuron_oj_index,2)+size(neuron_ht_index,2);

T = [ones(size(neuron_oj_index,2), 1); 
    2*ones(size(neuron_ht_index,2), 1);];

figure;
layout1 = tiledlayout(1,36,'TileSpacing','loose');

ax1 = nexttile([1 2]);
image(zeros(size(F_rule_multi_align_norm_sorted,1),1)-1, 1:size(F_rule_multi_align_norm_sorted,1), T);
axis off
box off
c = [Object_rule_color;     
    Height_rule_color;];
colormap(ax1, c)
h = text(-4,0.5*size(neuron_oj_index,2), ['O-rule' newline 'neurons'],'HorizontalAlignment', 'center', 'Rotation', 90, 'FontSize', 15);
h = text(-4,size(neuron_oj_index,2)+0.5*size(neuron_ht_index,2), ['H-rule' newline 'neurons'],'HorizontalAlignment', 'center', 'Rotation', 90, 'FontSize', 15);

layout2 = tiledlayout(layout1,1,17,'TileSpacing','compact');
layout2.Layout.Tile = 3;
layout2.Layout.TileSpan = [1 17];

ax1 = nexttile(layout2, [1 4]);
time_points = 1:40;
activity = F_rule_multi_align_norm_sorted(:,1:40);
image(time_points, 1:size(F_rule_multi_align_norm_sorted, 1), activity,'CDataMapping','scaled');
clim([0 1])
yticks([]);
xticks([]);
box off
x1 = xline(10,'-w');
ax1.YAxis.Visible = 'off';
ax1.XAxis.Visible = 'off';

ax2 = nexttile(layout2, [1 4]);
time_points = 1:40;
activity = F_rule_multi_align_norm_sorted(:,41:80);
image(time_points, 1:size(F_rule_multi_align_norm_sorted, 1), activity,'CDataMapping','scaled');
clim([0 1])
yticks([]);
xticks([]);
ax2.YAxis.Visible = 'off';
ax2.XAxis.Visible = 'off';
box off
x1 = xline(30,'-w');
title('O-rule ICG','FontWeight','normal','FontSize',15)

ax3 = nexttile(layout2, [1 9]);
time_points = 1:90;
activity = F_rule_multi_align_norm_sorted(:,81:170);
image(time_points, 1:size(F_rule_multi_align_norm_sorted, 1), activity,'CDataMapping','scaled');
clim([0 1])
yticks([]);
xticks([]);
ax3.YAxis.Visible = 'off';
ax3.XAxis.Visible = 'off';
box off
x1 = xline(10,'-w');


layout3 = tiledlayout(layout1,1,17,'TileSpacing','compact');
layout3.Layout.Tile = 20;
layout3.Layout.TileSpan = [1 17];

ax1 = nexttile(layout3, [1 4]);
time_points = 1:40;
activity = F_rule_multi_align_norm_sorted(:,171:210);
image(time_points, 1:size(F_rule_multi_align_norm_sorted, 1), activity,'CDataMapping','scaled');
clim([0 1])
box off
x1 = xline(10,'-w');
yticks([]);
xticks([]);
xlabel('Time (s)','FontSize',15)
ax1.YAxis.Color = 'none';
ax1.XAxis.Color = 'none';

ax2 = nexttile(layout3, [1 4]);
time_points = 1:40;
activity = F_rule_multi_align_norm_sorted(:,211:250);
image(time_points, 1:size(F_rule_multi_align_norm_sorted, 1), activity,'CDataMapping','scaled');
clim([0 1])
yticks([]);
xticks([]);
ax2.YAxis.Color = 'none';
ax2.XAxis.Color = 'none';
box off
x1 = xline(30,'-w');
title('H-rule ICG','FontWeight','normal','FontSize',15)

ax3 = nexttile(layout3, [1 9]);
time_points = 1:90;
activity = F_rule_multi_align_norm_sorted(:,251:340);
image(time_points, 1:size(F_rule_multi_align_norm_sorted, 1), activity, 'CDataMapping', 'scaled');
clim([0 1])
yticks([]);
xticks([]);
ax3.YAxis.Color = 'none';
ax3.XAxis.Color = 'none';
box off
x1 = xline(10,'-w');

hold on 
plot([71; 90], [n_neuron+9; n_neuron+9], '-k', 'LineWidth', 2.5)
text(80, n_neuron+15, ['1 s'],'HorizontalAlignment', 'center','FontSize', 15);
hold off

cb = colorbar(); 
set(cb,'position',[.91 .12 .01 .3]) 
cb.Label.Position(1) = 1.5;
cb.FontSize = 15;
cb.Ticks = [0,1];
ylabel(cb,'Norm. \it\DeltaF/F','Rotation', 90)

ax = gca;
ax.Clipping = "off";

fig=gcf;
fig.Position(3:4)=[500,600];
movegui(gcf, 'center')


% Fig3k
Height_rule_color = [0.9883, 0.5, 0.0313];
Object_rule_color = [0.0664, 0.6758, 0.0078];

data = F_rule_multi_align_norm_sorted(:, 1:340);
[coeff, score, latent, tsquared, explained, mu] = pca(data);
score_manual = (data- mean(data))*coeff;
neuron_score = score(:, [1:20]);

neuron_oj_index = (find(F_rule_multi_align_norm_sorted(:,341)<=170))';
neuron_ht_index = (find(F_rule_multi_align_norm_sorted(:,341)>170))';

figure
hold on
p1 = scatter(neuron_score(neuron_oj_index,1), neuron_score(neuron_oj_index,2), 15, 'filled', 'MarkerFaceColor', Object_rule_color);
p2 = scatter(neuron_score(neuron_ht_index,1), neuron_score(neuron_ht_index,2), 15,  'filled',  'MarkerFaceColor', Height_rule_color);
hold off
set(gca,'FontSize',15)
ylim([-10 5])
xlim([-8 8])
xticks([-8:8:8]);
xlabel('PC1')
ylabel('PC2')

lgd = legend([p1 p2], {"O-rule"+ newline+ "neurons", "H-rule"+ newline+ "neurons"} ,'Orientation','vertical', 'Location', 'northeastoutside');
lgd.ItemTokenSize = [15,10];
lgd.Box = 'off';
lgd.NumColumns = 1;
set(gca,'TickDir','out');

fig=gcf;
fig.Position(3:4)=[450,300];