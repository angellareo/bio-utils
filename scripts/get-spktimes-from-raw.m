datapath = "/media/alareo/TOSHIBA/GNB-Doctorado/RawData/";
outputpath = "/home/alareo/Dropbox/GNB/2021/fish-analysis/data/all/spkTimes/";
 
spk_exec = "spk-times"
rm_spk_exec = "octave scripts/preprocessing/rm-spktimes.m"

files = {
    "16-Aug-2017/17h47m22s-16-Aug-2017.dat";
    "29-Aug-2017/16h46m47s-29-Aug-2017.dat";
    "02-Feb-2018/12h46m55s-02-Feb-2018.dat";
    "07-Feb-2018/17h25m22s-07-Feb-2018.dat";
    "12-Feb-2018/17h39m41s-12-Feb-2018.dat";
    "20-Feb-2018/18h37m49s-20-Feb-2018.dat";
    "16-Aug-2017/17h58m45s-16-Aug-2017.dat";
    "29-Aug-2017/16h58m35s-29-Aug-2017.dat";
    "02-Feb-2018/13h06m11s-02-Feb-2018.dat";
    "07-Feb-2018/17h54m30s-07-Feb-2018.dat";
    "12-Feb-2018/18h03m57s-12-Feb-2018.dat";
    "20-Feb-2018/18h53m39s-20-Feb-2018.dat";
    "16-Aug-2017/18h22m35s-16-Aug-2017.dat";
    "29-Aug-2017/18h34m23s-29-Aug-2017.dat";
    "02-Feb-2018/13h26m13s-02-Feb-2018.dat";
    "08-Feb-2018/16h21m24s-08-Feb-2018.dat";
    "12-Feb-2018/18h22m50s-12-Feb-2018.dat";
    "22-Feb-2018/13h21m12s-22-Feb-2018.dat";
    "16-Aug-2017/18h36m18s-16-Aug-2017.dat";
    "29-Aug-2017/18h45m00s-29-Aug-2017.dat";
    "02-Feb-2018/13h38m50s-02-Feb-2018.dat";
    "08-Feb-2018/16h42m20s-08-Feb-2018.dat";
    "12-Feb-2018/18h37m38s-12-Feb-2018.dat";
    "22-Feb-2018/13h53m48s-22-Feb-2018.dat";
    "16-Aug-2017/19h46m15s-16-Aug-2017.dat";
    "29-Aug-2017/17h51m05s-29-Aug-2017.dat";
    "02-Feb-2018/15h34m22s-02-Feb-2018.dat";
    "09-Feb-2018/12h45m40s-09-Feb-2018.dat";
    "13-Feb-2018/15h01m03s-13-Feb-2018.dat";
    "22-Feb-2018/16h32m49s-22-Feb-2018.dat";
    "16-Aug-2017/19h58m00s-16-Aug-2017.dat";
    "29-Aug-2017/18h01m51s-29-Aug-2017.dat";
    "02-Feb-2018/15h54m13s-02-Feb-2018.dat";
    "09-Feb-2018/12h56m10s-09-Feb-2018.dat";
    "13-Feb-2018/15h26m31s-13-Feb-2018.dat";
    "22-Feb-2018/16h53m38s-22-Feb-2018.dat";
    "16-Aug-2017/21h03m34s-16-Aug-2017.dat";
    "30-Aug-2017/20h12m17s-30-Aug-2017.dat";
    "02-Feb-2018/16h29m04s-02-Feb-2018.dat";
    "09-Feb-2018/13h22m12s-09-Feb-2018.dat";
    "13-Feb-2018/16h38m44s-13-Feb-2018.dat";
    "22-Feb-2018/17h17m49s-22-Feb-2018.dat";
    "16-Aug-2017/21h14m06s-16-Aug-2017.dat";
    "30-Aug-2017/20h22m53s-30-Aug-2017.dat";
    "02-Feb-2018/16h45m18s-02-Feb-2018.dat";
    "09-Feb-2018/13h39m23s-09-Feb-2018.dat";
    "13-Feb-2018/17h10m05s-13-Feb-2018.dat";
    "22-Feb-2018/17h28m31s-22-Feb-2018.dat";
    "18-Aug-2017/13h37m37s-18-Aug-2017.dat";
    "30-Aug-2017/19h31m37s-30-Aug-2017.dat";
    "02-Feb-2018/17h27m56s-02-Feb-2018.dat";
    "09-Feb-2018/16h27m55s-09-Feb-2018.dat";
    "20-Feb-2018/13h46m59s-20-Feb-2018.dat";
    "22-Feb-2018/18h51m39s-22-Feb-2018.dat";
    "18-Aug-2017/13h51m55s-18-Aug-2017.dat";
    "30-Aug-2017/19h42m17s-30-Aug-2017.dat";
    "02-Feb-2018/17h51m58s-02-Feb-2018.dat";
    "09-Feb-2018/16h39m49s-09-Feb-2018.dat";
    "20-Feb-2018/14h01m55s-20-Feb-2018.dat";
    "22-Feb-2018/19h03m38s-22-Feb-2018.dat";
    "18-Aug-2017/14h45m54s-18-Aug-2017.dat";
    "30-Aug-2017/18h48m10s-30-Aug-2017.dat";
    "05-Feb-2018/13h52m15s-05-Feb-2018.dat";
    "09-Feb-2018/17h15m41s-09-Feb-2018.dat";
    "20-Feb-2018/16h14m46s-20-Feb-2018.dat";
    "22-Feb-2018/19h26m56s-22-Feb-2018.dat";
    "18-Aug-2017/15h00m23s-18-Aug-2017.dat";
    "30-Aug-2017/18h59m38s-30-Aug-2017.dat";
    "05-Feb-2018/14h07m23s-05-Feb-2018.dat";
    "09-Feb-2018/17h29m37s-09-Feb-2018.dat";
    "20-Feb-2018/16h36m35s-20-Feb-2018.dat";
    "22-Feb-2018/19h39m48s-22-Feb-2018.dat";
    "18-Aug-2017/15h22m57s-18-Aug-2017.dat";
    "30-Aug-2017/18h03m28s-30-Aug-2017.dat";
    "05-Feb-2018/14h39m48s-05-Feb-2018.dat";
    "09-Feb-2018/17h55m22s-09-Feb-2018.dat";
    "20-Feb-2018/17h00m31s-20-Feb-2018.dat";
    "22-Feb-2018/20h07m34s-22-Feb-2018.dat";
    "18-Aug-2017/15h35m53s-18-Aug-2017.dat";
    "30-Aug-2017/18h14m18s-30-Aug-2017.dat";
    "05-Feb-2018/14h50m36s-05-Feb-2018.dat";
    "09-Feb-2018/18h16m44s-09-Feb-2018.dat";
    "20-Feb-2018/17h22m14s-20-Feb-2018.dat";
    "22-Feb-2018/20h19m09s-22-Feb-2018.dat";
    "28-Aug-2017/17h26m18s-28-Aug-2017.dat";
    "30-Aug-2017/17h34m03s-30-Aug-2017.dat";
    "05-Feb-2018/15h14m14s-05-Feb-2018.dat";
    "09-Feb-2018/19h04m40s-09-Feb-2018.dat";
    "20-Feb-2018/17h58m48s-20-Feb-2018.dat";
    "22-Feb-2018/20h34m43s-22-Feb-2018.dat";
    "28-Aug-2017/17h36m54s-28-Aug-2017.dat";
    "30-Aug-2017/17h44m44s-30-Aug-2017.dat";
    "05-Feb-2018/15h27m31s-05-Feb-2018.dat";
    "09-Feb-2018/19h16m42s-09-Feb-2018.dat";
    "20-Feb-2018/18h09m36s-20-Feb-2018.dat";
    "22-Feb-2018/20h45m14s-22-Feb-2018.dat";
};

for i = 1:length( files )
    file = files{i};

    disp(["\n\nCalculate spikeTimes in " file]);
    disp([spk_exec " -i " datapath file " -c 4 -o " datapath file ".spkTimes"]);
    system([spk_exec " -i " datapath file " -c 4 -o " datapath file ".spkTimes"]);

    disp(["\n\nCalculate stimTimes in " file]);
    disp([spk_exec " -i " datapath file " -c 2 -o " datapath file ".stimTimes -t 0.1"]);
    system([spk_exec " -i " datapath file " -c 2 -o " datapath file ".stimTimes -t 0.1"]);

    disp("\n\nRemove stimTimes from spkTimes")
    disp([rm_spk_exec " " datapath file ".stimTimes " datapath file ".spkTimes"]);
    system([rm_spk_exec " " datapath file ".stimTimes " datapath file ".spkTimes"]);

    disp("\n\nMoving spkTimes to output path")
    disp(["cp " datapath file ".spkTimes " outputpath file(13:end) ".spkTimes"]);
    system(["cp " datapath file ".spkTimes " outputpath file(13:end) ".spkTimes"]);
endfor


