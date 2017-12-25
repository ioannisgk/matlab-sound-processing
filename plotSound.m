function [] = plotSound(sound, rate)
% Function to plot sound with some customizations

% Plot sound
plot((0:length(sound)-1)/rate, sound);

% Add labels to axis
xlabel('Time (s)'); ylabel('Amplitude');

% Set maximum axis length to remove empty space
axis([0 length(sound)/rate -1 1]);

% Set grid and make font smaller
grid on;
ax = gca;
ax.FontSize = 8;