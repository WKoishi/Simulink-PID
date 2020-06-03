clear
i=0;
for Ki=0.01:0.09:0.28
    i=i+1;
    Out=sim('position_pid');  % slxÎÄ¼şÃû
    subplot(2,2,i);
    plot(Out.simout)
    title(['Ki = ',num2str(Ki)]);
end