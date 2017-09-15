% (1+1)-EA
T=10000;
R=[1:50];
d=10;
prob=1/d;
trials=1000;
gapT=100;

quality=zeros(length(R),T/gapT,trials);
outputOpt=zeros(length(R),T/gapT);
visitedOpt=zeros(length(R),T/gapT);
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
        while (stop==0 && evals<=T-2*r)
            xp=x;
            mut=randi(d);
            xp(mut)=1-xp(mut);
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
            
            if mod(evals,gapT)==0
                idxT=evals/gapT;
                quality(idxR,idxT,run)=OneMax(x);
                visitedOpt(idxR,idxT,run)=visited;
                for idx=idxT+1:T/gapT
                    quality(idxR,idx,run)=quality(idxR,idxT,run);
                    visitedOpt(idxR,idx,run)=visitedOpt(idxR,idxT,run);
                end
                if stop==1
                    outputOpt(idxR,idxT)=outputOpt(idxR,idxT)+1;
                end
            else
                if stop==1
                    idxT=ceil(evals/gapT);
                    quality(idxR,idxT,run)=OneMax(x);
                    visitedOpt(idxR,idxT,run)=visited;
                    for idx=idxT+1:T/gapT
                        quality(idxR,idx,run)=quality(idxR,idxT,run);
                        visitedOpt(idxR,idx,run)=visitedOpt(idxR,idxT,run);
                    end
                    outputOpt(idxR,idxT)=outputOpt(idxR,idxT)+1;
                end
            end
        end
        
    end
    
    outputOpt(idxR,:)=cumsum(outputOpt(idxR,:));
end
savCmd=sprintf('save rmhcFHT_allR1-50_d%dT%d.mat gapT prob R quality outputOpt visitedOpt',d,T);
eval(savCmd)