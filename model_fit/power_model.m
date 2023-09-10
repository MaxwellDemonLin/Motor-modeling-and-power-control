KT = 0.3/(3591/187);
KE = (60/(2*pi*24.48))/(3591/187);

bus_voltage = 24.56;
give_toque_current = 20 * give_current / 16384;
give_toque = KT .* give_toque_current;
input_power = bus_voltage * current;


machine_power = (motor_chassis0speed_rpm .* give_toque) / 9.550;

figure;
plot(linspace(1,size(machine_power,1)/500,size(machine_power,1)),give_current);
hold on;
plot(linspace(1,size(machine_power,1)/500,size(machine_power,1)),motor_chassis0given_current);
legend('Give current', 'Given current'); 
figure;



figure;
plot(linspace(1,size(machine_power,1)/500,size(machine_power,1)),machine_power);
hold on;
plot(linspace(1,size(machine_power,1)/500,size(machine_power,1)),input_power);
legend('Machine power', 'Input power'); 




Pother = input_power - machine_power;
g = fittype('k1*motor_chassis0speed_rpm^2+k2*give_current.^2+c','independent',{'motor_chassis0speed_rpm','give_current'}, ...
    'dependent','Pother','coefficients',{'k1','k2','c'});
myfit = fit([motor_chassis0speed_rpm,give_current],Pother,g);
Pre_Pother = 2.11e-07   *motor_chassis0speed_rpm.^2+ 9.805e-08 *give_current.^2 +  2.138;


figure;
plot(linspace(1,size(Pre_Pother,1),size(Pre_Pother,1)),Pre_Pother);
hold on;
plot(linspace(1,size(Pre_Pother,1),size(Pre_Pother,1)),Pother);
predicte_power = machine_power + Pre_Pother;
legend('other power', 'predicte other power'); 


figure;
plot(linspace(1,size(input_power,1)/500,size(input_power,1)),input_power);
hold on;
plot(linspace(1,size(predicte_power,1)/500,size(predicte_power,1)),predicte_power);
legend('real power', 'predicte power'); 
