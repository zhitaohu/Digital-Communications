function [ c ] = force_zero( h,N )
%%迫零均衡的实现
%h：归一化的多径信道系数h
%N：均衡器抽头数2N+1
%c：返回迫零均衡器的系数C
H=length(h);
MID=find(h==1);  %找到h的时间原点
%若原点两侧的值个数不等，补零使之相等；
if(MID-1<H-MID)
    for i=1:(H-MID)-(MID-1)
        h=[0,h];
    end
else
    for i=1:(MID-1)-(H-MID)
        h=[h,0];
    end
end
l=max(MID-1,H-MID);

%根据给定抽头数确定冲击序列x
%x=[h(-2N) h(-2N+1) ... h(0) ... h(2N-1) h(2N)]
x=zeros(1,4*N+1);
if 2*N>=l
    x(2*N+1-l:2*N+1+l)=h;
else
    x=h(MID-2*N:MID+2*N);
end
%根据x构造矩阵方程系数X
%X=[ x(0)     x(-1)    ...    x(-2N) ;
%    x(1)     x(0)     ...    x(-2N+1);
%    ..............................
X=[];
for i=1:2*N+1
    X=[X;fliplr(x(i:2*N+i))]; %fliplr函数用来翻转矩阵
end
%d为delta函数
d=zeros(2*N+1,1);
d(N+1)=1;
c=X^(-1)*d;
 
end