%z = u+iv
%c = x+iy
%f(z) = z^2+c
%mandel_g: an absolute value of convergence  

mandel_x = [];
mandel_y = [];

mandel_g = [];

N = 1000;
d = 1000;
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
            u = u_next;
            v = v_next;
            if u^2+v^2 > threshold
                break
            end
        end
        if u^2+v^2 <= threshold
            mandel_x = [mandel_x x];
            mandel_y = [mandel_y y];
            mandel_g = [mandel_g u^2+v^2];
        end
    end
end

plot3(mandel_x,mandel_y,mandel_g,'.')








