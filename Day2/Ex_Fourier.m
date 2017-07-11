N = 128; %Number of points (make sure it's a power of 2)

%Define a discrete function (feel free to play with this)
%This example uses a two Gaussian bump function
sigma = 5;
idx = 1:N; idx = idx(:);
x = exp(-(idx-20).^2/(2*sigma.^2));
x = x + exp(-(idx-80).^2/(2*sigma.^2));
sigma = 1;
x = x + exp(-(idx-50).^2/(2*sigma.^2));

%TODO: Replace this with Fourier Basis
H = HaarMatrix(N);

AnimationSpeed = 5; %Number of frames per second
y = zeros(N, 1);
for k = 1:N
    projFac = H(k, :)*x;
    proj = projFac*H(k, :)';
    y = y + proj;
    
    clf;
    plot(y, 'k');
    hold on;
    plot(proj, 'r');
    plot(x, 'b--', 'LineWidth', 2);
    ylim([min(x(:)), max(x(:))]);
    xlim([0, N]);
    title(sprintf('Basis Element %i, Projection = %.3g', k, projFac));
    pause(1/AnimationSpeed);
end