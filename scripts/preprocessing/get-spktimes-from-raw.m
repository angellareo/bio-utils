datapath = "./data";
outputpath = "./results";
 
spk_exec = "scripts/spk-times/spk-times"
rm_spk_exec = "octave scripts/preprocessing/rm-spktimes.m"

files = {
    "data1.dat";
    "data2.dat";
};

for i = 1:length( files )
    file = files{i};

    disp(["\n\nCalculate spikeTimes in " file]);
    disp([spk_exec " -i " datapath file " -c 4 -o " datapath file ".spkTimes"]);
    system([spk_exec " -i " datapath file " -c 4 -o " datapath file ".spkTimes"]);

    disp(["\n\nCalculate stimTimes in " file]);
    disp([spk_exec " -i " datapath file " -c 2 -o " datapath file ".stimTimes -t 0.1"]);
    system([spk_exec " -i " datapath file " -c 2 -o " datapath file ".stimTimes -t 0.1"]);

    disp("\n\nRemove stimTimes from spkTimes");
    disp([rm_spk_exec " " datapath file ".stimTimes " datapath file ".spkTimes"]);
    system([rm_spk_exec " " datapath file ".stimTimes " datapath file ".spkTimes"]);
    system(["rm " datapath file ".stimTimes"]);

    disp("\n\nMoving spkTimes to output path");
    disp(["cp " datapath file ".spkTimes " outputpath file ".spkTimes"]);
    system(["cp " datapath file ".spkTimes " outputpath file ".spkTimes"]);
endfor


