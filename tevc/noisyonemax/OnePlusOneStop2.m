% (1+1)-EA
T=100000;
R=[1:50];
d=100;
trials=1000;
prob=1/d;

quality=zeros(length(R),trials);
outputOpt=zeros(1,length(R));
visitedOpt=zeros(1,length(R));
for r=1:50
    for run=1:trials
        visited=0; 
        x=RandomBinaryString(d);
        if OneMax(x)==d
            visited=1;
        end
        evals=0;
        stop=0;
        while (stop==0 && evals<=T-2*r)
            xp=x;
            for i=1:d
                if rand<=prob
                    xp(i)=1-xp(i);
                end
            end
            if OneMax(xp)==d
                visited=1;
            end
            if NoisyOneMax(xp,r)>=NoisyOneMax(x,r)
                x=xp;
            end
            evals=evals+r*2;
            
            if OneMax(x)==d
                stop=1;  % visit optimum
            end
        end
        quality(r,run)=OneMax(x);
        visitedOpt(r)=visitedOpt(r)+visited;
        if OneMax(x)==d
            outputOpt(r)=outputOpt(r)+1;
        end
    end
end
savCmd=sprintf('save opoFHT_r1-50_d%dT%d.mat R quality outputOpt visitedOpt',d,T);
eval(savCmd)