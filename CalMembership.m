%Á¥Êô¶È¼ÆËãº¯Êý
function [ms,index]=CalMembership(qv)

ZO =0; NS =-2; NM =-4; NB =-6; PS =2; PM =4; PB =6;
index=zeros(1,2);
ms=zeros(1,2);

    if(qv>=NB && qv<NM)  %(-6,-4)
		index(1)=1;
		index(2)=2;
		ms(1)=-0.5*qv-2;
		ms(2)=0.5*qv+3;
    
    elseif(qv>=-NM && qv<-NS)  %(-4,-2)
		index(1)=2;
		index(2)=3;
		ms(1)=-0.5*qv-1;
		ms(2)=0.5*qv+2;
	
    elseif(qv>=NS && qv<ZO)  %(-2,0)
		index(1)=3;
		index(2)=4;
		ms(1)=-0.5*qv;
		ms(2)=0.5*qv+1;
	
    elseif(qv>=ZO && qv<PS)  %(0,2)
		index(1)=4;
		index(2)=5;
		ms(1)=-0.5*qv+1;
		ms(2)=0.5*qv;
	
    elseif(qv>=PS && qv<PM)  %(2,4)
		index(1)=5;
		index(2)=6;
		ms(1)=-0.5*qv+2;
		ms(2)=0.5*qv-1;
	
    elseif(qv>=PM && qv<=PB)  %(4.6)
		index(1)=6;
		index(2)=7;
		ms(1)=-0.5*qv+3;
		ms(2)=0.5*qv-2;
        
    else
        index(1)=4;
        index(2)=5;
        ms(1)=0;
        ms(2)=0;
    end
end


