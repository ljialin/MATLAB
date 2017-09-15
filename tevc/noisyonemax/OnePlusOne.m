% (1+1)-EA
T=10000;
d=10;
R=[1:50];
prob=1/d;
trials=1000;
gapT=100;

quality=zeros(length(R),T/gapT,trials);
outputOpt=zeros(length(R),T/gapT);
visitedOpt=zeros(length(R),T/gapT,trials);
for idxR=1:length(R)
    r=R(idxR)
    for run=1:trials
        visited=0; 
        x=RandomBinaryString(d);
        if OneMax(x)==d
            visited=1;
        end
        evals=0;
        stop=0;
        while (evals<=T-2*r)
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
            
            if mod(evals,gapT)==0
                idxT=evals/gapT;
                quality(idxR,idxT,run)=OneMax(x);
                visitedOpt(idxR,idxT,run)=visited;
                if OneMax(x)==d
                    outputOpt(idxR,idxT)=outputOpt(idxR,idxT)+1;
                end
            end
        end
        
    end
end
savCmd=sprintf('save opo_allR1-50_d%dT%d.mat gapT prob R quality outputOpt visitedOpt',d,T);
eval(savCmd)