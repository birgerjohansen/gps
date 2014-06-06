load ny_az_data;
Y = data(:, 1);
M = data(:, 2);
D = data(:, 3);
h = data(:, 4);
m = data(:, 5);
s = zeros(size(m));
lat = data(:, 12);
lon = data(:, 13);

orthomap(0, -40);
plotm(lat, lon, '-');
plotm(lat, lon, '.');

[gclat, gclon] = track2(lat(1), lon(1), lat(end), lon(end));
plotm(gclat, gclon, 'r');

lat2 = lat;
lat2(1) = [];
lat2 = [lat2;lat2(end)];
lon2 = lon;
lon2(1) = [];
lon2 = [lon2;lon2(end)];

rng = distance(lat, lon, lat2, lon2)*60;

t = datenum(Y, M, D, h, m, s);
t2 = t;
t2(1) = [];
t2 = [t2;t2(end)];

dt = (t2-t)*24
speed = rng./dt
figure;
plot(t, speed, '.-');
