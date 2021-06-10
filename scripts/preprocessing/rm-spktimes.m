%Detect & remove all cos impulse

arg_list = argv ();
filename1 = arg_list{1};
impulseTimes = load("-ascii",filename1);
filename2 = arg_list{2};
spikeTimes = load("-ascii",filename2);

time_threshold = 1;

[N1,M1] = size(impulseTimes);
[N2,M2] = size(spikeTimes);

remSpikeTimes = zeros(N1,1);
newSpikeTimes = zeros(N2,1);

j=1; 
k=1; # number of spkTimes after rm
for i=1:N1    
    while (j<=N2 && spikeTimes(j)<impulseTimes(i))
        newSpikeTimes(k) = spikeTimes(j);
        j=j+1;
        k=k+1;
    endwhile

    if (j<=N2 && spikeTimes(j)<(impulseTimes(i)+time_threshold))
        j=j+1;
    endif
endfor

while (j<=N2)
    newSpikeTimes(k) = spikeTimes(j);
    j=j+1;
    k=k+1;
endwhile

newSpikeTimes=newSpikeTimes(1:k-1);

save("-ascii",filename2,"newSpikeTimes");
