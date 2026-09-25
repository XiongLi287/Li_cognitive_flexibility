close all
clear all

cd 'C:\Users\BSNO\Desktop\Li_cognitive_flexibility\Codes\Fig4'

% Fig4f labeled rule
load('Fig4f_calight_labeled_rule.mat')

correct_color = [0.4660 0.6740 0.1880];
incorrect_color = [0.8500 0.3250 0.0980];
CG_color = [0 0.6784 0.9333];
ICG_color = [0 0 0];

CG_control_index_across = [CG_control_index(1):CG_control_index(end)];
ICG_control_index_across = [ICG_control_index(1):ICG_control_index(end)];
CG_opto_index_across = [CG_opto_index(1):CG_opto_index(end)];
ICG_opto_index_across = [ICG_opto_index(1):ICG_opto_index(end)];

window = 25;
CG_control_accuracy = movmean(outcome(CG_control_index), window);
ICG_control_accuracy =  movmean(outcome(ICG_control_index), window);
CG_opto_accuracy =  movmean(outcome(CG_opto_index), window);
ICG_opto_accuracy = movmean(outcome(ICG_opto_index), window);

CG_control_accuracy_across = [CG_control_accuracy(1)];
ICG_control_accuracy_across = [ICG_control_accuracy(1)];
CG_opto_accuracy_across = [CG_opto_accuracy(1)];
ICG_opto_accuracy_across = [ICG_opto_accuracy(1)];

for trial = 2:size(CG_control_index, 2)
    trial_index = CG_control_index(trial);
    pre_trial_index = CG_control_index(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        CG_control_accuracy_across(end+1) = CG_control_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            CG_control_accuracy_across(end+1) = CG_control_accuracy(trial-1);
        end
        CG_control_accuracy_across(end+1) = CG_control_accuracy(trial);
    end
end

for trial = 2:size(ICG_control_index, 2)
    trial_index = ICG_control_index(trial);
    pre_trial_index = ICG_control_index(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        ICG_control_accuracy_across(end+1) = ICG_control_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            ICG_control_accuracy_across(end+1) = ICG_control_accuracy(trial-1);
        end
        ICG_control_accuracy_across(end+1) = ICG_control_accuracy(trial);
    end
end

for trial = 2:size(CG_opto_index, 2)
    trial_index = CG_opto_index(trial);
    pre_trial_index = CG_opto_index(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        CG_opto_accuracy_across(end+1) = CG_opto_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            CG_opto_accuracy_across(end+1) = CG_opto_accuracy(trial-1);
        end
        CG_opto_accuracy_across(end+1) = CG_opto_accuracy(trial);
    end
end

for trial = 2:size(ICG_opto_index, 2)
    trial_index = ICG_opto_index(trial);
    pre_trial_index = ICG_opto_index(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        ICG_opto_accuracy_across(end+1) = ICG_opto_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            ICG_opto_accuracy_across(end+1) = ICG_opto_accuracy(trial-1);
        end
        ICG_opto_accuracy_across(end+1) = ICG_opto_accuracy(trial);
    end
end

figure
hold on
p1 = plot(CG_control_index_across, CG_control_accuracy_across, ':', 'Color', CG_color, 'LineWidth',1);
p2 = plot(CG_opto_index_across, CG_opto_accuracy_across, 'Color', CG_color, 'LineWidth',1);
p3 = plot(ICG_control_index_across, ICG_control_accuracy_across, ':', 'Color', ICG_color, 'LineWidth',1);
p4 = plot(ICG_opto_index_across, ICG_opto_accuracy_across, 'Color', ICG_color, 'LineWidth',1);

half_width = 0.45;

for i = ICG_control_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [0.4 0.4 0.45 0.45];
    if outcome(i) == 1
        patch(x,y,correct_color,'EdgeColor','none')
    elseif outcome(i) == 0
        patch(x,y,incorrect_color,'EdgeColor','none')
    end
end

for i = ICG_opto_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [0.35 0.35 0.4 0.4];
    if outcome(i) == 1
        patch(x,y,correct_color,'EdgeColor','none')
    elseif outcome(i) == 0
        patch(x,y,incorrect_color,'EdgeColor','none')
    end
end

for i = CG_control_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [1.1 1.1 1.15 1.15];
    if outcome(i) == 1
        patch(x,y,correct_color,'EdgeColor','none')
    elseif outcome(i) == 0
        patch(x,y,incorrect_color,'EdgeColor','none')
    end
end

for i = CG_opto_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [1.05 1.05 1.1 1.1];
    if outcome(i) == 1
        patch(x,y,correct_color,'EdgeColor','none')
    elseif outcome(i) == 0
        patch(x,y,incorrect_color,'EdgeColor','none')
    end
end

hold off

xlabel('Trial number')
ylabel('Fraction correct')
title('NpHR labeled rule','FontSize', 15, 'FontWeight','normal')

xlim([-1, 150])
ylim([0.33, 1.15])
xticks(0:50:150)
yticks([0.5:0.25:1])

text_size = 15;

lgd = legend([p1 p2 p3 p4],{'CG off', 'CG on', 'ICG off', 'ICG on'},'Orientation','vertical');
lgd.ItemTokenSize = [10,5];
lgd.Location = 'eastoutside';
lgd.FontSize = text_size;
lgd.Box = 'off';

text(-20, 0.4 ,'ICG','FontSize',text_size,'HorizontalAlignment','right')
text(-10, 0.425 ,'off','FontSize',text_size,'HorizontalAlignment','center')
text(-10, 0.375 ,'on','FontSize',text_size,'HorizontalAlignment','center')

text(-20, 1.1 ,'CG','FontSize',text_size,'HorizontalAlignment','right')
text(-10, 1.125 ,'off','FontSize',text_size,'HorizontalAlignment','center')
text(-10, 1.075 ,'on','FontSize',text_size,'HorizontalAlignment','center')

ax = gca;
ax.Clipping = "off";
set(gca,'FontSize',text_size)
set(gca,'TickDir','out');

fig=gcf;
fig.Position(3:4)=[500,350];


% Fig4f labeled rule
load('Fig4g_calight_opposite_rule.mat')

CG_control_index_across = [CG_control_index(1):CG_control_index(end)];
ICG_control_index_across = [ICG_control_index(1):ICG_control_index(end)];
CG_opto_index_across = [CG_opto_index(1):CG_opto_index(end)];
ICG_opto_index_across = [ICG_opto_index(1):ICG_opto_index(end)];

CG_control_accuracy = movmean(outcome(CG_control_index), window);
ICG_control_accuracy =  movmean(outcome(ICG_control_index), window);
CG_opto_accuracy =  movmean(outcome(CG_opto_index), window);
ICG_opto_accuracy = movmean(outcome(ICG_opto_index), window);

CG_control_accuracy_across = [CG_control_accuracy(1)];
ICG_control_accuracy_across = [ICG_control_accuracy(1)];
CG_opto_accuracy_across = [CG_opto_accuracy(1)];
ICG_opto_accuracy_across = [ICG_opto_accuracy(1)];

for trial = 2:size(CG_control_index, 2)
    trial_index = CG_control_index(trial);
    pre_trial_index = CG_control_index(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        CG_control_accuracy_across(end+1) = CG_control_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            CG_control_accuracy_across(end+1) = CG_control_accuracy(trial-1);
        end
        CG_control_accuracy_across(end+1) = CG_control_accuracy(trial);
    end
end

for trial = 2:size(ICG_control_index, 2)
    trial_index = ICG_control_index(trial);
    pre_trial_index = ICG_control_index(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        ICG_control_accuracy_across(end+1) = ICG_control_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            ICG_control_accuracy_across(end+1) = ICG_control_accuracy(trial-1);
        end
        ICG_control_accuracy_across(end+1) = ICG_control_accuracy(trial);
    end
end

for trial = 2:size(CG_opto_index, 2)
    trial_index = CG_opto_index(trial);
    pre_trial_index = CG_opto_index(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        CG_opto_accuracy_across(end+1) = CG_opto_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            CG_opto_accuracy_across(end+1) = CG_opto_accuracy(trial-1);
        end
        CG_opto_accuracy_across(end+1) = CG_opto_accuracy(trial);
    end
end

for trial = 2:size(ICG_opto_index, 2)
    trial_index = ICG_opto_index(trial);
    pre_trial_index = ICG_opto_index(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        ICG_opto_accuracy_across(end+1) = ICG_opto_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            ICG_opto_accuracy_across(end+1) = ICG_opto_accuracy(trial-1);
        end
        ICG_opto_accuracy_across(end+1) = ICG_opto_accuracy(trial);
    end
end

figure
hold on
p1 = plot(CG_control_index_across, CG_control_accuracy_across, ':', 'Color', CG_color, 'LineWidth',1);
p2 = plot(CG_opto_index_across, CG_opto_accuracy_across, 'Color', CG_color, 'LineWidth',1);
p3 = plot(ICG_control_index_across, ICG_control_accuracy_across, ':', 'Color', ICG_color, 'LineWidth',1);
p4 = plot(ICG_opto_index_across, ICG_opto_accuracy_across, 'Color', ICG_color, 'LineWidth',1);

half_width = 0.45;

for i = ICG_control_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [0.4 0.4 0.45 0.45];
    if outcome(i) == 1
        patch(x,y,correct_color,'EdgeColor','none')
    elseif outcome(i) == 0
        patch(x,y,incorrect_color,'EdgeColor','none')
    end
end

for i = ICG_opto_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [0.35 0.35 0.4 0.4];
    if outcome(i) == 1
        patch(x,y,correct_color,'EdgeColor','none')
    elseif outcome(i) == 0
        patch(x,y,incorrect_color,'EdgeColor','none')
    end
end

for i = CG_control_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [1.1 1.1 1.15 1.15];
    if outcome(i) == 1
        patch(x,y,correct_color,'EdgeColor','none')
    elseif outcome(i) == 0
        patch(x,y,incorrect_color,'EdgeColor','none')
    end
end

for i = CG_opto_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [1.05 1.05 1.1 1.1];
    if outcome(i) == 1
        patch(x,y,correct_color,'EdgeColor','none')
    elseif outcome(i) == 0
        patch(x,y,incorrect_color,'EdgeColor','none')
    end
end

hold off

xlabel('Trial number')
ylabel('Fraction correct')
title('NpHR opposite rule','FontSize', 15, 'FontWeight','normal')

xlim([-1, 182])
ylim([0.33, 1.15])
xticks(0:60:180)
yticks([0.5:0.25:1])

lgd = legend([p1 p2 p3 p4],{'CG off', 'CG on', 'ICG off', 'ICG on'},'Orientation','vertical');
lgd.ItemTokenSize = [10,5];
lgd.Location = 'eastoutside';
lgd.FontSize = text_size;
lgd.Box = 'off';

text(-20, 0.4 ,'ICG','FontSize',text_size,'HorizontalAlignment','right')
text(-10, 0.425 ,'off','FontSize',text_size,'HorizontalAlignment','center')
text(-10, 0.375 ,'on','FontSize',text_size,'HorizontalAlignment','center')

text(-20, 1.1 ,'CG','FontSize',text_size,'HorizontalAlignment','right')
text(-10, 1.125 ,'off','FontSize',text_size,'HorizontalAlignment','center')
text(-10, 1.075 ,'on','FontSize',text_size,'HorizontalAlignment','center')

ax = gca;
ax.Clipping = "off";
set(gca,'FontSize',text_size)
set(gca,'TickDir','out');

fig=gcf;
fig.Position(3:4)=[500,350];
