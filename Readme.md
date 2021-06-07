# bio-utils

A set of scripts (octave) and simple programs (C++) to process records of spiking biological signals in Linux.

## Build

```
mkdir build
cd build
cmake ..
make
```

## spk-times

A simple program for detecting spikes in a signal. It receives an ascii file where each row is a sample with time and signal values in different rows, separated by spaces. It outputs an ascii file with a column of times where a spike was detected.

### Usage
```
spk-times <option(s)> SOURCES
Options:
        -h,         Show this help message
        -i FILE,    Specify input file
        -o FILE,    Specify output file
        -c COL,     Specify data value column
```