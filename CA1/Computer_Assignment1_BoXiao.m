%% Element 1 (node 1,2)
GlobalK = zeros(12,12); EA = 30*10^6;
s = 0;
c = 1;
k1 = [c^2 c*s
    c*s s^2];
K1 = [k1 -k1
    -k1 k1] * EA/20;
Global_id1 = [1,2,3,4];
r = 1;
for i = Global_id1;
    GlobalK(i,Global_id1) = GlobalK(i,Global_id1) + K1(r,:);
    r = r + 1;
end
%% Element 2 (node 2,3)
s = 0;
c = 1;
k2 = [c^2 c*s
    c*s s^2];
K2 = [k2 -k2
    -k2 k2] * EA/20;
Global_id2 = [3,4,5,6];
r = 1;
for i = Global_id2;
    GlobalK(i,Global_id2) = GlobalK(i,Global_id2) + K2(r,:);
    r = r + 1;
end
%% Element 3 (node 3,4)
s = 0;
c = 1;
k3 = [c^2 c*s
    c*s s^2];
K3 = [k3 -k3
    -k3 k3] * EA/20;
Global_id3 = [5,6,7,8];
r = 1;
for i = Global_id3;
    GlobalK(i,Global_id3) = GlobalK(i,Global_id3) + K3(r,:);
    r = r + 1;
end
%% Element 4 (node 5,6)
s = 0;
c = 1;
k4 = [c^2 c*s
    c*s s^2];
K4 = [k4 -k4
    -k4 k4] * EA/20;
Global_id4 = [9,10,11,12];
r = 1;
for i = Global_id4;
    GlobalK(i,Global_id4) = GlobalK(i,Global_id4) + K4(r,:);
    r = r + 1;
end
%% Element 5 (node 1,5)
s = 3/5;
c = 4/5;
k5 = [c^2 c*s
    c*s s^2];
K5 = [k5 -k5
    -k5 k5] * EA/25;
Global_id5 = [1,2,9,10];
r = 1;
for i = Global_id5;
    GlobalK(i,Global_id5) = GlobalK(i,Global_id5) + K5(r,:);
    r = r + 1;
end
%% Element 6 (node 2,6)
s = 3/5;
c = 4/5;
k6 = [c^2 c*s
    c*s s^2];
K6 = [k6 -k6
    -k6 k6] * EA/25;
Global_id6 = [3,4,11,12];
r = 1;
for i = Global_id6;
    GlobalK(i,Global_id6) = GlobalK(i,Global_id6) + K6(r,:);
    r = r + 1;
end
%% Element 7 (node 3,5)
s = 3/5;
c = -4/5;
k7 = [c^2 c*s
    c*s s^2];
K7 = [k7 -k7
    -k7 k7] * EA/25;
Global_id7 = [5,6,9,10];
r = 1;
for i = Global_id7;
    GlobalK(i,Global_id7) = GlobalK(i,Global_id7) + K7(r,:);
    r = r + 1;
end
%% Element 8 (node 4,6)
s = 3/5;
c = -4/5;
k8 = [c^2 c*s
    c*s s^2];
K8 = [k8 -k8
    -k8 k8] * EA/25;
Global_id8 = [7,8,11,12];
r = 1;
for i = Global_id8;
    GlobalK(i,Global_id8) = GlobalK(i,Global_id8) + K8(r,:);
    r = r + 1;
end
%% Element 9 (node 2,5)
s = 1;
c = 0;
k9 = [c^2 c*s
    c*s s^2];
K9 = [k9 -k9
    -k9 k9] * EA/15;
Global_id9 = [3,4,9,10];
r = 1;
for i = Global_id9;
    GlobalK(i,Global_id9) = GlobalK(i,Global_id9) + K9(r,:);
    r = r + 1;
end
%% Element 10 (node 3,6)
s = 1;
c = 0;
k10 = [c^2 c*s
    c*s s^2];
K10 = [k10 -k10
    -k10 k10] * EA/15;
Global_id10 = [5,6,11,12];
r = 1;
for i = Global_id10;
    GlobalK(i,Global_id10) = GlobalK(i,Global_id10) + K10(r,:);
    r = r + 1;
end
%% Computing U vector & F vector
A = GlobalK(3:7,3:7);
B = GlobalK(3:7,9:12);
C = GlobalK(9:12,3:7);
D = GlobalK(9:12,9:12);
K_partial = [A B
    C D];
F_partial = [zeros(1,5), 3000, -9000, 0, -12000]';
U_partial = K_partial\F_partial;
U = [0,0,U_partial(1:5)',0,U_partial(6:9)']';
F = GlobalK*U;
for i = 1:12
    if abs(F(i)) < 1e-10
        F(i) = 0;
    end
end
%% 
F_in_lbs = F;
F_index = {'F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12'}';
Force_Table = table(F_index,F_in_lbs);
U_in_ft = U;
U_index = {'u1','u2','u3','u4','u5','u6','u7','u8','u9','u10','u11','u12'}';
Displacement_Table = table(U_index,U_in_ft);
%% Axial Stress
E = 30*10^6;
d = [];
d(1) = [U(3)-U(1)]/20;
d(2) = [U(5)-U(3)]/20;
d(3) = [U(7)-U(5)]/20;
d(4) = [U(11)-U(9)]/20;
d(5) = [U(9)*0.8 + U(10)*0.6 - U(1)*0.8 - U(2)*0.6]/25;
d(6) = [U(11)*0.8 + U(12)*0.6 - U(3)*0.8 - U(4)*0.6]/25;
d(7) = [U(9)*-0.8 + U(10)*0.6 - (U(6)*0.6 + U(5)*-0.8 ) ]/25;
d(8) = [U(11)*-0.8 + U(12)*0.6 - (U(8)*0.6 + U(7)*-0.8 ) ]/25;
d(9) = [U(10) - U(4)]/15;
d(10) = [U(12) - U(6)]/15;
Axial_Stress_psf = (d*E)';
Element_index = {'Element1 node(1,2)'
    'Element2 node(2,3)'
    'Element3 node(3,4)'
    'Element4 node(5,6)'
    'Element5 node(1,5)'
    'Element6 node(2,6)'
    'Element7 node(3,5)'
    'Element8 node(4,6)'
    'Element9 node(2,5)'
    'Element10 node(3,6)'};
Aixal_Stress_Table = table(Element_index,Axial_Stress_psf);
%% Result Display
Force_Table
Displacement_Table
Aixal_Stress_Table