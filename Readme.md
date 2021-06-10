# bio-utils

A set of scripts (octave) and simple programs (C++) to process records of spiking biological signals in Linux.

## Build

```
mkdir build
cd build
cmake ..
make
```

## Preprocessing

### Get spkTimes from raw data signal [C++]

A simple program for detecting spikes in a signal. It receives an ascii file where each row is a sample with time and signal values in different rows, separated by spaces. It outputs an ascii file with a column of times where a spike was detected.

#### Usage
```
spk-times <option(s)>
Options:
        -h,         Show this help message
        -i FILE,    Specify input file
        -o FILE,    Specify output file
        -c COL,     Specify data value column
```
### Remove spikes [Octave] 

An octave script for removing a set of spikeTimes from another one. It can be used to remove artifially induced spikes in a signal.

#### Usage
```
octave ./scripts/preprocessing/rm-spktimes.m SOURCE DESTINATION
```
The script removes the spikes in SOURCE from DESTINATION file (within a given time threshold). Then, it writes the resulting spkTimes in DESTINATION.

### Preprocess several files [Octave]

Get spkTimes from several files of raw data. For each file, the scripts applies 

#### Usage
```
octave ./scripts/preprocessing/rm-spktimes.m
```