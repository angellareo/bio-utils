%Detect & remove all cos impulse

arg_list = argv ();
filename1 = arg_list{1};
stimSpkTimes = load("-ascii",filename1);
filename2 = arg_list{2};
bioSpkTimes = load("-ascii",filename2);

time_threshold = 1;

[N1,M1] = size(stimSpkTimes);
[N2,M2] = size(bioSpkTimes);

rembioSpkTimes = zeros(N1,1);
newbioSpkTimes = zeros(N2,1);

j=1; 
k=1; # number of spkTimes after rm
for i=1:N1    
    while (j<=N2 && bioSpkTimes(j)<stimSpkTimes(i))
        newbioSpkTimes(k) = bioSpkTimes(j);
        j=j+1;
        k=k+1;
    endwhile

    if (j<=N2 && bioSpkTimes(j)<(stimSpkTimes(i)+time_threshold))
        j=j+1;
    endif
endfor

while (j<=N2)
    newBioSpkTimes(k) = bioSpkTimes(j);
    j=j+1;
    k=k+1;
endwhile

% Resize array to actual data: 
newBioSpkTimes=newBioSpkTimes(1:k-1);

% Save backup of previous spkTimes data
save("-ascii",[filename2 ".back"],"newBioSpkTimes");

% Save array overwritting biological data
save("-ascii",filename2,"newBioSpkTimes");