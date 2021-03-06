function [y]=judgement_16QAM(r_c,r_s)
N=length(r_c);
y = zeros(1,4*N);
for i=1:N
    x = zeros(1,16);
    x(1) = Distance([r_c(i), r_s(i)], [-3,-3]);
    x(2) = Distance([r_c(i), r_s(i)], [-1,-3]);
    x(3) = Distance([r_c(i), r_s(i)], [1,-3]);
    x(4) = Distance([r_c(i), r_s(i)], [3,-3]);
    
    x(5) = Distance([r_c(i), r_s(i)], [-3,-1]);
    x(6) = Distance([r_c(i), r_s(i)], [-1,-1]); 
    x(7) = Distance([r_c(i), r_s(i)], [1,-1]);
    x(8) = Distance([r_c(i), r_s(i)], [3,-1]);
    
    x(9) = Distance([r_c(i), r_s(i)], [-3,1]);
    x(10) = Distance([r_c(i), r_s(i)], [-1,1]);
    x(11) = Distance([r_c(i), r_s(i)], [1,1]);
    x(12) = Distance([r_c(i), r_s(i)], [3,1]);
    
    x(13) = Distance([r_c(i), r_s(i)], [-3,3]);
    x(14) = Distance([r_c(i), r_s(i)], [-1,3]);
    x(15) = Distance([r_c(i), r_s(i)], [1,3]);
    x(16) = Distance([r_c(i), r_s(i)], [3,3]); 
    
    
    m = min(x);
    for j = 1:16
        if x(j) == m
            break;
        end
    end
    
    switch j
        case 1
            y(4*i-3) = 1;
            y(4*i-2) = 1;
            y(4*i-1) = 0;
            y(4*i) = 0;
        case 2
            y(4*i-3) = 1;
            y(4*i-2) = 0;
            y(4*i-1) = 0;
            y(4*i) = 0;
        case 3
            y(4*i-3) = 0;
            y(4*i-2) = 0;
            y(4*i-1) = 0;
            y(4*i) = 0;
        case 4
            y(4*i-3) = 0;
            y(4*i-2) = 1;
            y(4*i-1) = 0;
            y(4*i) = 0;
        case 5
            y(4*i-3) = 1;
            y(4*i-2) = 1;
            y(4*i-1) = 0;
            y(4*i) = 1;
        case 6
            y(4*i-3) = 1;
            y(4*i-2) = 0;
            y(4*i-1) = 0;
            y(4*i) = 1;
        case 7
            y(4*i-3) = 0;
            y(4*i-2) = 0;
            y(4*i-1) = 0;
            y(4*i) = 1;
        case 8
            y(4*i-3) = 0;
            y(4*i-2) = 1;
            y(4*i-1) = 0;
            y(4*i) = 1;
        case 9
            y(4*i-3) = 1;
            y(4*i-2) = 1;
            y(4*i-1) = 1;
            y(4*i) = 1;
        case 10
            y(4*i-3) = 1;
            y(4*i-2) = 0;
            y(4*i-1) = 1;
            y(4*i) = 1;
        case 11
            y(4*i-3) = 0;
            y(4*i-2) = 0;
            y(4*i-1) = 1;
            y(4*i) = 1;
        case 12
            y(4*i-3) = 0;
            y(4*i-2) = 1;
            y(4*i-1) = 1;
            y(4*i) = 1;
        case 13
            y(4*i-3) = 1;
            y(4*i-2) = 1;
            y(4*i-1) = 1;
            y(4*i) = 0;
        case 14
            y(4*i-3) = 1;
            y(4*i-2) = 0;
            y(4*i-1) = 1;
            y(4*i) = 0;
        case 15
            y(4*i-3) = 0;
            y(4*i-2) = 0;
            y(4*i-1) = 1;
            y(4*i) = 0;
        case 16            
            y(4*i-3) = 0;
            y(4*i-2) = 1;
            y(4*i-1) = 1;
            y(4*i) = 0;
    end
end
