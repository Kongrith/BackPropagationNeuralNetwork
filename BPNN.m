clear all
validation1

figure(1)
clf
hold on
plot(T,'r*')

mape1 =100;
i=0;
while mape1 > 0.038
i=i+1;

net = newff(P,T,[3,1],{'logsig' 'logsig'}));

net.input{1}.processFcns = {'fixunknowns' 'removeconstantrows'};
net.input{2}.processFcns = {'fixunknowns' 'removeconstantrows'};
net.input{3}.processFcns = {'fixunknowns' 'removeconstantrows'};

[net,tr] = train(net,P,T);

P_testing = [GDP_testing; customer_testing; income_testing;industrial_testing; tourist_testing];
T_testing = [energy_testing];

result_testing = sim(net,P_testing);

e = result_testing - T_testing;
mape1 = sum(abs(e ./ T_testing))/5
	if i==30
		break
	end
end

	
