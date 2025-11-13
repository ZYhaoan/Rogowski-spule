%% read_and_plot_coil_log.m
%  读取 LCX200 测试日志 CSV 并绘制主要参数
%  作者: ChatGPT (GPT-5)
%  日期: 2025-11-05

clc; clear; close all;

%% === 用户参数 ===
filename = 'log-20251105T155145.197.csv';  % CSV 文件名
headerLines = 11;                          % 前11行为说明性文字

%% === 读取数据 ===
opts = detectImportOptions(filename, 'NumHeaderLines', headerLines);
data = readtable(filename, opts);

disp('--- 数据前几行 ---');
disp(head(data));

%% === 绘图 ===
figure('Name', 'Coil Log Data', 'NumberTitle', 'off');

subplot(3,1,1);
plot(data.Timestamp, data.("Ls[H]"), 'LineWidth', 1.2);
xlabel('Timestamp'); ylabel('Inductance Ls [H]');
title('Inductance vs Time'); grid on;

subplot(3,1,2);
plot(data.Timestamp, data.("Z[Ohm]"), 'LineWidth', 1.2);
xlabel('Timestamp'); ylabel('Impedance Z [Ω]');
title('Impedance vs Time'); grid on;

subplot(3,1,3);
plot(data.Timestamp, data.("Frequency[Hz]"), 'LineWidth', 1.2);
xlabel('Timestamp'); ylabel('Frequency [Hz]');
title('Frequency vs Time'); grid on;

sgtitle('LCX200 Coil Measurement Log');