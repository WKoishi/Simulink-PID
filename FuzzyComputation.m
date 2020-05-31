function [dKp,dKi,dKd]=FuzzyComputation(error,derror)

ZO =0; NS =-2; NM =-4; NB =-6; PS =2; PM =4; PB =6;

Kp_rule=[
	PB,PB,PM,PM,PS,ZO,ZO;
	PB,PB,PM,PS,PS,ZO,NS;
	PM,PM,PM,PS,ZO,NS,NS;
	PM,PM,PS,ZO,NS,NM,NM;
	PS,PS,ZO,NS,NS,NM,NM;
	PS,ZO,NS,NM,NM,NM,NB;
	ZO,ZO,NM,NM,NM,NB,NB;
];

Ki_rule=[
	NB,NB,NM,NM,NS,ZO,ZO;
	NB,NB,NM,NS,NS,ZO,ZO;
	NB,NM,NS,NS,ZO,PS,PS;
	NM,NM,NS,ZO,PS,PM,PM;
	NM,NS,ZO,PS,PS,PM,PB;
	ZO,ZO,PS,PS,PM,PB,PB;
	ZO,ZO,PS,PM,PM,PB,PB;
];

Kd_rule=[
	PS,NS,NB,NB,NB,NM,PS;
	PS,NS,NB,NM,NM,NS,ZO;
	ZO,NS,NM,NM,NS,NS,ZO;
	ZO,NS,NS,NS,NS,NS,ZO;
	ZO,ZO,ZO,ZO,ZO,ZO,ZO;
	PB,NS,PS,PS,PS,PS,PB;
	PB,PM,PM,PM,PS,PS,PB;
];

	qValue = zeros(1,2);  %e(k)和Δe(k)的量化值
	qValue_K = zeros(1,3);
	
	qValue(1)=6*error/1.5;   
	qValue(2)=6*derror/(2*1.5);
    
    %e(k)隶属度,e(k)隶属度索引
	[ms_E,index_E]=CalMembership(qValue(1));  %e(k)
    %Δe(k)隶属度,Δe(k)隶属度索引
	[ms_EC,index_EC]=CalMembership(qValue(2));  %Δe(k)
	
	%Kp
	qValue_K(1)= ms_E(1)*(ms_EC(1)*Kp_rule(index_E(1),index_EC(1))...
						 +ms_EC(2)*Kp_rule(index_E(1),index_EC(2)))...
				+ms_E(2)*(ms_EC(1)*Kp_rule(index_E(2),index_EC(1))...
						 +ms_EC(2)*Kp_rule(index_E(2),index_EC(2)));
	%Ki
	qValue_K(2)= ms_E(1)*(ms_EC(1)*Ki_rule(index_E(1),index_EC(1))...
						 +ms_EC(2)*Ki_rule(index_E(1),index_EC(2)))...
				+ms_E(2)*(ms_EC(1)*Ki_rule(index_E(2),index_EC(1))...
						 +ms_EC(2)*Ki_rule(index_E(2),index_EC(2)));
	%Kd
	qValue_K(3)= ms_E(1)*(ms_EC(1)*Kd_rule(index_E(1),index_EC(1))...
						 +ms_EC(2)*Kd_rule(index_E(1),index_EC(2)))...
				+ms_E(2)*(ms_EC(1)*Kd_rule(index_E(2),index_EC(1))...
						 +ms_EC(2)*Kd_rule(index_E(2),index_EC(2)));
	dKp=-qValue_K(1)/6;
	dKi=-qValue_K(2)/6;
	dKd=qValue_K(3)/6;
end


