%z = u+iv
%c = x+iy
%f(z) = z^2+c
%mandel_g: two of the absolute values in which the sequence remains bounded

clc
clear

mandel_x = [];
mandel_y = [];

mandel_g1 = [];
mandel_g2 = [];

N = 1000;
d = 100;
iter = 1000;
threshold = 100;

for i=-N:N
    x = i/d;
    for j=-N:N
        y = j/d;
        u = 0;
        v = 0;
        for k=0:iter
            u_next = u^2 - v^2 + x;
            v_next = 2*u*v + y;
            u_prev = u;
            v_prev = v;
            u = u_next;
            v = v_next;
            if u^2+v^2 > threshold
                break
            end
        end
        if u^2+v^2 <= threshold
            mandel_x = [mandel_x x];
            mandel_y = [mandel_y y];
            mandel_g1 = [mandel_g1 u^2+v^2];
            mandel_g2 = [mandel_g2 u_prev^2+v_prev^2];
        end
    end
end

plot3(mandel_x,mandel_y,mandel_g1,'black.')
hold on
plot3(mandel_x,mandel_y,mandel_g2,'black.')