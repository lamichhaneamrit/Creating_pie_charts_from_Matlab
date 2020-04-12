%% Question:
%We take another look at the patient dataset that we already know from the Patient Graphics
%submission: [patients.mat] In this dataset, the data of the same patient are always in the
%same position in the different variables.Write a program that answers the user the following 
%questions in the form of screen editions (automatically, not by output values ??written in 
%the program text and the Questions are given also on the very beginning of
%any solutions.
%%
% Amrit Lamichhane
% 2019.09.17
%PATIENTENLOGIK

%% *Main Parameters*
%N_F is number of female
%N_M is number of male
%S_M is the male smokers
%S_F the female somkers
%W_F1 is the weight of the females
%M_F1 is the weight of males
%av_m_w is average male weight
%av_f_w is average female  weight
%VA_hos is VA hospital
%bet_hos is for better hospital in terms of handling their patients
%Bet_CGH is for  better hospital in terms of handling their patients in
%central General Hospital
%Bet_VA for  better hospital in terms of handling their patients in VA Hospital
%%
clear; % clear the workspace
close all; % close the running programm
clc;% clear the command window
%% *Solutions*
%% 1.%%
% Is there more men or more women in this record?
% To print wwhos population is smaller or greater, one can use if and else
% as below and get the result easily
load ('patients.mat'); % loading the giving datas
whos
Gender =categorical(Gender); % Organizing the gender in order
N_M=(Gender=='Male'); % Number of Male
N_F=(Gender=='Female'); % Number of Female
if N_M > N_F
    fprintf('1. There are more Male Than Female\n' );
else
    fprintf('1.There are more Female Than Male\n' );
end
%%
%2.How many men smoke?
% First find the number of male under catagory of smoker and simply add all
% the males with the syntax sum , and same with the female.
S_M=Smoker(Gender=='Male'); % Smoker Male
S_M1=sum(S_M); % smoker Male in Number
S_F=Smoker(Gender=='Female'); % Smoker Female
S_F1=sum(S_F); % Smoker Female in Number
fprintf('2. The total number of male smoker is : %d\n',S_M1);
fprintf('2.1 The total number of female smoker is : %d\n',S_F1); % not asked but good to know the number of  female smoker
%% 
%3. Give the average weight (in kg) of all patients, only women and only men.
%Arranging the dat in weight and height for both gender
% Converting the given weights which are in pounds to the kg and the
% average can be taken by the formula :( sum(N)/number of males or females)
% and can be printed the required asnwer with the help of fprintf.
W_F1=Weight(Gender=='Female'); % weight of Female 
M_F1=Weight(Gender=='Male');% weight of Male 
%%
num_male=47; % total number of Male
num_female=53; % total number of female
X1=W_F1.*0.45; % converting pounds to kg
X2=M_F1.*0.45;% converting pounds to kg
av_m_w= sum(X2)./num_male; %average male weights in kg
av_f_w= sum(X1)./num_female;%average female weights in kg
fprintf(' 3. The Average Weight of male in kg is : %.3f\n',av_m_w); % print the average weight of male in kg
fprintf(' 3.1 The Average Weight in  of female in kg is : %.3f\n',av_f_w);% print the average weight of female in kg
%%
%4. Are male smokers lighter in this dataset than male nonsmokers? 
%fierst task is to find out the the total weight of male smoker and total numer of male from
%above and simply subtrat the number of smoker and we can get the total
%number of smoker males. And again '>' or '<' can be used which catagory is
%more ,off course using 'if ' 'else'.
S_F1=Smoker(Gender=='Female');% female smoker 
S_F=sum(S_F1);% Female smoker in number (not necesseraliy asked)
S_M1=Smoker(Gender=='Male'); % male smoker
S_M=sum(S_M1);% Male smoker in number
S_M_L=num_male-S_M;%male non smoker;
if S_M > S_M_L %(printing more non-smoker or smoker male by followig)
    fprintf(' 4.There are more smoker Male than non-smoker Male\n' );% print if there are more smoker male
else
    fprintf('4. There are more non-smoker Male than smoker Male\n');% print if there are more non-smoker male
end
% I do not understand the question quite good, so if you asked about the
% weight of smoker and non-smoker males, you can find it here.
total_male_weight=sum(M_F1); % total sum of male weights 
w1_t_s=Weight(S_M1); % weight of total smoker only
w1_n_s=total_male_weight-w1_t_s; % weight of non_smoker only
w_n_s=w1_n_s/26;% not smoker average  weight-wise
w_t_s=w1_t_s/21; %average  smoker in average
if w_n_s > w_t_s %for printing who are heavy or light by using if else)
    fprintf(' 4.1 There are more lighter( in weight) Male who smokes\n' );
else
    fprintf('4.1 There are more heavy(weightwise) Male who smokes\n');
end
%% 
%5  How many smoking women are there at VA Hospital?
% this task can be done after locating all the VA Hospital and finding out
% the total female patients who are used to smoking
Location = categorical(Location); % Arranging the location in order
VA_hos=(Location=='VA Hospital'); % only the location for VA Hospital
 Sum_VA=sum(VA_hos); % Total number  of  patient in VA hospital
 F_VA=VA_hos(Gender=='Female');% Female patients  in VA hospital
T_F_VA=sum(F_VA); % total num of female in VA hospital(not necessary)
S_F_VA=VA_hos(Smoker(Gender=='Female')) ;% total smoker  female in VA hospital
T_F_VA=sum(S_F_VA); % total num of female smoker in VA hospital
fprintf('5. There are %d smoker  Female in VA hospital.\n',T_F_VA); % print the total number of female in VA hospital
 %%
 % 6.Do the patients at VA Hospital value their health better than those at County General Hospital?
%there are two ways to know the better health situation. one with the help of histogram 
%  figure;
% wer can also see the histogram and directly say looking from it, which
% hospital terats their patients nicely, or use the below solution for
% other process.
% histogram(Location(SelfAssessedHealthStatus<='Fair'));
% title('Location of Patients in Fair or Poor Health');
%% SelfAssessedHealthStatus is more or equal to fair is considered as the good health treatment for their
%patients. So, we find the more fair SelfAssessedHealthStatus from
%different hospital and find out which hospital is better for patients and we can
% simply find the conditions of different pateints in percentage and then compare 
%the difference between two given hospital. Oviously, use of  if and else
%is useful here as well.
On_VA_hos=Location(SelfAssessedHealthStatus);% all catagorical location on all types of patients
V_A_h = (On_VA_hos=='VA Hospital'); % num of patients only in VA hospital for all category
all_VA=sum(V_A_h);%total sum of patients in number for VA_hospital
Bet_hos=Location(SelfAssessedHealthStatus>='Fair'); % handling the patients better healthwise
 Bet_VA= (Bet_hos =='VA Hospital'); % total num of patients in  VA hospital in terms of good helath care
 sum_VA=sum(Bet_VA); % how much they value theie patient in numbers getting good treatments
B_C_VA=sum_VA/all_VA*100;% better care in percentage wise for patients in VA hospital
 C_G_h= (On_VA_hos=='Country General Hospital'); % num of patients only in CG hospital for all category
 all_CG=sum(C_G_h);%total sum of patients in number for CG_hospital
 Bet_CGH= (Bet_hos =='Country General Hospital'); % toatl CGH hospital in terms of good helath care
 sum_CGH=sum(Bet_CGH); % how much they value theie patient in numbers;
 B_C_CG=sum_CGH/all_CG*100;% better care in percentage wise for patients in CG hospital
 if B_C_VA > B_C_CG
    fprintf('6. VA Hospital value their health more than CG Hospital\n' ); % print if VA hospital is better
else
    fprintf('6. CG Hospital value their health than VA Hospital\n' ); %% print if CG hospital is better
end
 %% 
%7.Create separate pie charts for the self-rated health of smokers and nonsmokers.
% for this task we need to first find out the SelfAssessedHealthStatus for
% total smoker and non-smoker.
% sO,basically pie chart for 3 different catagory are obtained about
% SelfAssessedHealthStatus..
% by using the pie and subplot to get all pie charts in one , one can get
% the SelfAssessedHealthStatus of the smoker, non-smoker and also for all
% the patients.First categorical organizing the SelfAssessedHealthStatus in
% order and by applying the following method.
%%
T=categorical(SelfAssessedHealthStatus,...
    {'Poor' 'Fair' 'Good' 'Excellent'},'Ordinal',true); %SelfAssessedHealthStatus of all total patients
figure; % create new figure
subplot(3,1,1); % 3-plots in 1 page
pie(T) % obtained the pie chart for SelfAssessedHealthStatus
title('SelfAssessedHealthStatus Pie Charts of all patiens ');% title for our pie chart
hold on  % wait for other to plot
T1=categorical(SelfAssessedHealthStatus(Smoker),... % only for smoker
    {'Poor' 'Fair' 'Good' 'Excellent'},'Ordinal',true); %%SelfAssessedHealthStatus of all smoker patients
subplot(3,1,2); % same as above reasson
pie(T1) % obtain pie chart for SelfAssessedHealthStatus for smoker only
title('SelfAssessedHealthStatus Pie Charts of Only Smoking patiens '); % providing the title
hold on % wait for other to plot
T3=categorical(SelfAssessedHealthStatus(~Smoker),... % non-smoker (not  smoker )
    {'Poor' 'Fair' 'Good' 'Excellent'},'Ordinal',true);
subplot(3,1,3); % for plotting in one
pie(T3)% obtaining the pie chart for Non-moker
title('SelfAssessedHealthStatus Pie Charts of  Only Non-Smoking patiens ');
hold off % wait is over