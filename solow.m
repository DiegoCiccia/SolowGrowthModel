%% Solow-Swan Neoclassical Growth Model
% A MATLAB dynamical replica
%% Author: Diego Ciccia

%% Simulation of the convergence
% Uncomment the commented sections to compare the result of convergence
% between two different economies starting from two different initial
% positions.

t=100; % N° of periods
kmax=200; % Max value of capital per worker
alpha=0.3; % Elasticity of output with respect of capital input
s=0.5; % Marginal propensity to save
n=0.02; % Population growth rate
d=0.01; % Capital depreciation rate
A0=2; % Total factor productivity
K=1:kmax; % Levels of capital per worker (x axis)
y=zeros(length(K),1); %
sy=zeros(length(K),1);
nd=zeros(length(K),1);



for k1=1:kmax
    y(k1,1)=A0*(k1^alpha); % Aggregate production function
    sy(k1,1)=s*y(k1,1); % Actual Investment
    nd(k1,1)=(n+d)*k1; % Required Investment
end


scatter(K,y, '.');
text(max(K)-20, max(y)-0.5, 'f(k)')
title('The Solow-Swan Neoclassical Growth Model')
xlabel('k')
ylabel('y')
hold on
grid on
scatter(K,sy,'.')
text(max(K)-20, sy(kmax,1)+0.2, 'sf(k)')
scatter(K,nd,'.')
text(max(K)-20, nd(kmax,1)+0.2, '(n + d)k')

k1=50; % Starting Position (first economy)
% k2=200; % Starting Position (second economy)
for i=1:t    
    u=plot([k1,k1],[0,y(k1,1)], 'k--');
    drawnow
    l=plot([k1,0],[y(k1,1), y(k1,1)], 'k--');
    drawnow  
    m=plot([k1,0],[sy(k1,1), sy(k1,1)], 'k--');
    drawnow 
    n=plot([k1,0],[nd(k1,1), nd(k1,1)], 'k--');
    drawnow

    delete(u);
    delete(l);
    delete(m);
    delete(n);
    o=text(mean(K),mean(y),['t = ', num2str(i)]);
    drawnow
    delete(o);
    
%     u=plot([k2,k2],[0,y(k2,1)], 'b--');
%     drawnow
%     l=plot([k2,0],[y(k2,1), y(k2,1)], 'b--');
%     drawnow  
%     m=plot([k2,0],[sy(k2,1), sy(k2,1)], 'b--');
%     drawnow 
%     n=plot([k2,0],[nd(k2,1), nd(k2,1)], 'b--');
%     drawnow 
%     
%     delete(u);
%     delete(l);
%     delete(m);
%     delete(n);
   
            
    if sy(k1,1) > nd(k1,1) % Differential equation outcomes 
        k1=k1+1;        
    elseif sy(k1,1) < nd(k1,1)
        k1=k1-1;       
    end  
    
%     if sy(k2,1) > nd(k2,1)
%         k2=k2+1;        
%     elseif sy(k2,1) < nd(k2,1)
%         k2=k2-1;       
%     end  
    
    if i==t
        plot([k1,k1],[0, y(k1,1)], 'k--')
        drawnow
        plot([k1,0],[y(k1,1), y(k1,1)], 'k--')
        drawnow
        plot([k1,0],[sy(k1,1), sy(k1,1)], 'k--')
        drawnow
        plot([k1,0],[nd(k1,1), nd(k1,1)], 'k--')
        drawnow
    
        
%         plot([k2,k2],[0, y(k2,1)], 'b--')
%         drawnow
%         plot([k2,0],[y(k2,1), y(k2,1)], 'b--')
%         drawnow
%         plot([k2,0],[sy(k2,1), sy(k2,1)], 'b--')
%         drawnow
%         plot([k2,0],[nd(k2,1), nd(k2,1)], 'b--')
%         drawnow
        
    end
end

text(mean(K),mean(y),['t = ', num2str(t)])
hold on
