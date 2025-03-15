close all; clc;

%% cltc
cltc_c_cycle = 'data/CSV/CLTC-C-2019.csv';
T = readtable(cltc_c_cycle,'ReadVariableNames',true);
cltc_cycle = table2array(T);
% figure(6)
% plot(cltc_cycle(:,1), cltc_cycle(:,2), 'k', 'linewidth', 1.5);
cltc_cycle = [cltc_cycle, zeros(size(cltc_cycle, 1), 1)];
cltc_cycle(1:end-1, 3) = ((cltc_cycle(2:end, 2) - cltc_cycle(1:end-1, 2))) ./ (cltc_cycle(2:end, 1) - cltc_cycle(1:end-1, 1)) / 3.6;
t_cltc_minus = cltc_cycle(:,1) - dt;
t_sample_cltc = reshape([t_cltc_minus, cltc_cycle(:,1)]', [], 1);
a_sample_cltc = reshape([cltc_cycle(:, 3), cltc_cycle(:, 3)]', [], 1);
a_sample_cltc = [a_sample_cltc(1); a_sample_cltc];
a_sample_cltc(end) = [];
sim('cltc.slx');
figure(7); hold on;
plot(cltc_cycle(:,1), cltc_cycle(:,2), 'k', 'linewidth', 1.5);
plot(t_cltc, v_cltc, 'b', 'linewidth', 1.5);
legend('cltc\_original\_vel', 'cltc\_acc\_integral\_vel');
xlabel('time/[s]');
ylabel('velocity/[km/h]');
box on;
figure(7);