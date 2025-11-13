filename = 'log-20251105T155145.197.csv';
headerLines = 11;

% ==== Dateioptionen ====
opts = detectImportOptions(filename, ...
    'NumHeaderLines', headerLines, ...
    'Delimiter', ',', ...
    'VariableNamingRule', 'modify');

% Erste Spalte explizit als Text erzwingen
opts.VariableTypes{1} = 'char';

% ==== Datei einlesen ====
data = readtable(filename, opts);

% ==== Zeitspalte in datetime konvertieren ====
try
    data.Timestamp = datetime(strtrim(string(data.Timestamp)), ...
        'InputFormat', 'HH:mm:ss.SSS');
catch
    % Fallback ohne Millisekunden
    data.Timestamp = datetime(strtrim(string(data.Timestamp)), ...
        'InputFormat', 'HH:mm:ss');
end

% ==== Spaltennamen zeigen ====
disp('Erkannte Spalten:');
disp(data.Properties.VariableNames);

% ==== Plots ====
figure('Name','LCX200 Messdaten','NumberTitle','off');
tiledlayout(3,1);

nexttile;
plot(data.Timestamp, data.Ls_H_, 'LineWidth',1.5);
ylabel('L_s [H]');
grid on; title('Induktivität');

nexttile;
plot(data.Timestamp, data.Z_Ohm_, 'LineWidth',1.5);
ylabel('Z [\Omega]');
grid on; title('Impedanz');

nexttile;
plot(data.Timestamp, data.Frequency_Hz_/1000, 'LineWidth',1.5);
ylabel('Frequenz [kHz]');
xlabel('Zeit');
grid on; title('Frequenzverlauf');

linkaxes(findall(gcf,'type','axes'),'x');