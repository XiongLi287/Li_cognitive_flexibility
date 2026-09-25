close all
clear all

cd 'C:\Users\BSNO\Desktop\Li_cognitive_flexibility\Codes\Fig3'
load('Fig3d_population_activity.mat')

data = F_multi_align_norm;
[coeff, score, latent, tsquared, explained, mu] = pca(data');
object_score = score([1:170],[1:3]);
height_score = score([171:340],[1:3]);

figure
hold on

Height_rule_color = [0.9883, 0.5, 0.0313];
Object_rule_color = [0.0664, 0.6758, 0.0078];

object_score_filt = [];
height_score_filt = [];

for PC = 1:3
    object_score_PC = object_score(:,PC);
    height_score_PC = height_score(:,PC);
    w = gausswin(10);
    w = w/sum(w);
    object_score_PC_filt = filtfilt(w, 1, object_score_PC);
    height_score_PC_filt = filtfilt(w, 1, height_score_PC);
    object_score_filt = [object_score_filt, object_score_PC_filt];
    height_score_filt = [height_score_filt, height_score_PC_filt];
end

before = findall(gca);
fnplt(cscvn(object_score_filt(1:1:71,1:3)'),'r', 2)
fnplt(cscvn(object_score_filt(71:1:170,1:3)'),'r', 1);
added = setdiff(findall(gca), before);
set(added, 'Color', Object_rule_color)
scatter3(object_score_filt(11,1),object_score_filt(11,2),object_score_filt(11,3),30,'LineWidth',2,'MarkerEdgeColor',Object_rule_color, 'MarkerFaceColor', Object_rule_color);
scatter3(object_score_filt(71,1),object_score_filt(71,2),object_score_filt(71,3),30,'LineWidth',2,'MarkerEdgeColor',Object_rule_color, 'MarkerFaceColor', Object_rule_color);
scatter3(object_score_filt(91,1),object_score_filt(91,2),object_score_filt(91,3),30,'LineWidth',2,'MarkerEdgeColor',Object_rule_color, 'MarkerFaceColor', Object_rule_color);

before = findall(gca);
fnplt(cscvn(height_score_filt(1:1:71,1:3)'),'r', 2)
fnplt(cscvn(height_score_filt(71:1:170,1:3)'),'r', 1)
added = setdiff(findall(gca), before);
set(added, 'Color', Height_rule_color)
scatter3(height_score_filt(11,1),height_score_filt(11,2),height_score_filt(11,3),30,'LineWidth',2,'MarkerEdgeColor',Height_rule_color, 'MarkerFaceColor', Height_rule_color);
scatter3(height_score_filt(71,1),height_score_filt(71,2),height_score_filt(71,3),30,'LineWidth',2,'MarkerEdgeColor',Height_rule_color, 'MarkerFaceColor', Height_rule_color);
scatter3(height_score_filt(91,1),height_score_filt(91,2),height_score_filt(91,3),30,'LineWidth',2,'MarkerEdgeColor',Height_rule_color, 'MarkerFaceColor', Height_rule_color);
hold off

lgd = legend( {'','O-rule','','','','','H-rule'},'Orientation','vertical');
lgd.ItemTokenSize = [15,10];
lgd.Box = 'off';
set(lgd,'color','none');
set(gca,'TickDir','out');

font_size = 15;
xlabel('PC1')
ylabel('PC2')
zlabel('PC3')
set(gca,'FontSize',font_size)

grid on
view([40 17])

fig=gcf;
fig.Position(3:4)=[320,350];
