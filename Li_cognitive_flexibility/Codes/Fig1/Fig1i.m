close all
clear all

cd 'C:\Users\BSNO\Desktop\Li_cognitive_flexibility\Codes\Fig1'
load('Fig1i_behavior_data.mat')

n_trial = size(outcome, 2);

congruency = double(congruency);
outcome = double(outcome);
choice_location = double(choice_location);

trial_index_ICG = find(congruency == 1);
trial_index_CG = find(congruency == 0);

trial_index_correct = find(outcome == 1);
trial_index_incorrect = find(outcome == 0);

trial_index_left = find(choice_location == 0);
trial_index_right = find(choice_location == 1);

n_session = size(session_index, 2);
switch_ICG_index = [];
for session = 1:(n_session-1)
    if session == 1
        switch_ICG_index(end+1) = size(intersect(cell2mat(session_index(session)), trial_index_ICG), 2) + 1;
    else
        switch_ICG_index(end+1) = switch_ICG_index(end) + size(intersect(cell2mat(session_index(session)), trial_index_ICG), 2);
    end
end

ICG_session_accuracy = [];
CG_session_accuracy = [];

Height_rule_color = [0.9883, 0.5, 0.0313];
Object_rule_color = [0.0664, 0.6758, 0.0078];

correct_color = [0.4660 0.6740 0.1880];
incorrect_color = [0.8500 0.3250 0.0980];

text_size = 15;

figure

for session = 2:size(switch_index,2)
    ICG_session_index = trial_index_ICG(find(switch_index(session-1) <= trial_index_ICG & trial_index_ICG < switch_index(session)));
    ICG_session_accuracy = [ICG_session_accuracy,movmean(outcome(ICG_session_index), 10)];

    CG_session_index = trial_index_CG(find(switch_index(session-1) <= trial_index_CG & trial_index_CG < switch_index(session)));
    CG_session_accuracy = [CG_session_accuracy,movmean(outcome(CG_session_index), 10)];

    start_trial_index = double(switch_index(session-1));
    end_trial_index = double(switch_index(session)-1);
    x = (start_trial_index+end_trial_index)/2;
    y = 1.1;
    if rule_session(session-1) == 0
        text(x, y ,'O','FontSize',text_size,'Color', Object_rule_color,'HorizontalAlignment','center')
    elseif rule_session(session-1) == 1
        text(x, y ,'H','FontSize',text_size,'Color', Height_rule_color,'HorizontalAlignment','center')
    end
    hold on
end

% last block
session = size(switch_index,2);

ICG_session_index = trial_index_ICG(find(trial_index_ICG >= switch_index(session)));
ICG_session_accuracy = [ICG_session_accuracy,movmean(outcome(ICG_session_index), 10)];

CG_session_index = trial_index_CG(find(trial_index_CG >= switch_index(session)));
CG_session_accuracy = [CG_session_accuracy,movmean(outcome(CG_session_index), 10)];

start_trial_index = double(switch_index(session));
end_trial_index = double(n_trial);
x = (start_trial_index+end_trial_index)/2;
y = 1.1;
if rule_session(session) == 0
    text(x, y ,'O','FontSize',text_size,'Color', Object_rule_color,'HorizontalAlignment','center')
elseif rule_session(session) == 1
    text(x, y ,'H','FontSize',text_size,'Color', Height_rule_color,'HorizontalAlignment','center')
end
hold on

% accuracy across all trials 
ICG_index_across = [trial_index_ICG(1):trial_index_ICG(end)];
CG_index_across = [trial_index_CG(1):trial_index_CG(end)];

ICG_accuracy_across = [ICG_session_accuracy(1)];
CG_accuracy_across = [CG_session_accuracy(1)];

for trial = 2:size(trial_index_ICG, 2)
    trial_index = trial_index_ICG(trial);
    pre_trial_index = trial_index_ICG(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        ICG_accuracy_across(end+1) = ICG_session_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            ICG_accuracy_across(end+1) = ICG_session_accuracy(trial-1);
        end
        ICG_accuracy_across(end+1) = ICG_session_accuracy(trial);
    end
end

for trial = 2:size(trial_index_CG, 2)
    trial_index = trial_index_CG(trial);
    pre_trial_index = trial_index_CG(trial-1);
    index_diff = trial_index - pre_trial_index;
    if index_diff == 1
        CG_accuracy_across(end+1) = CG_session_accuracy(trial);
    elseif index_diff > 1
        for i = 1:(index_diff-1)
            CG_accuracy_across(end+1) = CG_session_accuracy(trial-1);
        end
        CG_accuracy_across(end+1) = CG_session_accuracy(trial);
    end
end


for session = 2:size(switch_index, 2)
    switch_index_session = switch_index(session);
    first_CG_index = trial_index_CG(find(trial_index_CG >= switch_index_session, 1));
    first_ICG_index = trial_index_ICG(find(trial_index_ICG >= switch_index_session, 1));
    if switch_index_session == first_CG_index
        for i = switch_index_session:(first_ICG_index-1)
            ICG_accuracy_across(i-trial_index_ICG(1)+1) = ICG_accuracy_across(first_ICG_index-trial_index_ICG(1)+1);
        end
    elseif switch_index_session == first_ICG_index
        for i = switch_index_session:(first_CG_index-1)
            CG_accuracy_across(i-trial_index_CG(1)+1) = CG_accuracy_across(first_CG_index-trial_index_CG(1)+1);
        end
    end
end

half_width = 0.5;

CG_correct_index = intersect(trial_index_CG, trial_index_correct);
for i = CG_correct_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [-0.2 -0.2 -0.1 -0.1];
    patch(x,y,correct_color,'EdgeColor','none')
    hold on
end

CG_incorrect_index = intersect(trial_index_CG, trial_index_incorrect);
for i = CG_incorrect_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [-0.2 -0.2 -0.1 -0.1];
    patch(x,y,incorrect_color,'EdgeColor','none')
    hold on
end

ICG_correct_index = intersect(trial_index_ICG, trial_index_correct);
for i = ICG_correct_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [-0.3 -0.3 -0.2 -0.2];
    patch(x,y,correct_color,'EdgeColor','none')
    hold on
end

ICG_incorrect_index = intersect(trial_index_ICG, trial_index_incorrect);
for i = ICG_incorrect_index
    i = double(i);
    x = [i-half_width i+half_width i+half_width i-half_width];
    y = [-0.3 -0.3 -0.2 -0.2];
    patch(x,y,incorrect_color,'EdgeColor','none')
    hold on
end

for index = switch_index(2:end)
    index = double(index);
    plot([index-0.5 index-0.5],[-0.32, 1.2],'Color',[0.4,0.4,0.4],'LineStyle','--', 'Linewidth', 1)
end

p1 = plot(CG_index_across, CG_accuracy_across, 'Color', [0.3010 0.7450 0.9330], 'LineWidth',1);
p2 = plot(ICG_index_across, ICG_accuracy_across, 'Color',[0 0 0], 'LineWidth',1);

lgd = legend([p1 p2],{'CG','ICG'},'Orientation','vertical');
lgd.ItemTokenSize = [10,5];
lgd.Location = 'northeastoutside';
lgd.FontSize = text_size;
lgd.Box = 'off';

text(-4, -0.15 ,'CG','FontSize',text_size,'HorizontalAlignment','right')
text(-4, -0.25 ,'ICG','FontSize',text_size,'HorizontalAlignment','right')

hold off
box off
xlabel('Trial number')
ylabel('Fraction correct')
xlim([-2 n_trial+2])
ylim([-0.32 1])
set(gca,'xtick',0:30:150,'xticklabel',{'0','30','60','90','120','150'})
yticks([0:0.2:1])
ax = gca;
ax.Clipping = "off";
ax.OuterPosition(4) = 0.9;
set(gca,'FontSize',text_size)
set(gca,'TickDir','out');

fig=gcf;
fig.Position(3:4)=[500,300];