/* Extrae los tiempos de spike desde la señal original*/

#define _FILE_OFFSET_BITS 64  // le arquivos de tamanho 2^64

#include <getopt.h>
#include <string.h>

#include <algorithm>
#include <cmath>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

#define VCOL 4     // 4th column
#define TIMECOL 1  // 1st column
#define DEF_THR 0.6
#define MIN_TIME_AFTER_SPIKE_DETECTION 1

using namespace std;

void split(const std::string& str, const std::string& delim,
           std::vector<std::string>& parts);

static void show_usage(std::string name) {
  cout << "Usage: " << name << " <option(s)> SOURCES" << endl
       << "Options:\n"
       << "\t-h,--help\t\tShow this help message\n"
       << "\t-i,--inputfile\t\tSpecify input file\n"
       << "\t-o,--outputfile\t\tSpecify output file\n"
       << "\t-c,--column\t\tSpecify data value column" << endl;
}

int main(int argc, char** argv) {
  ifstream inputFile;
  ofstream fout;
  double initTime;
  string auxStr, inputFilename, outputFilename;
  int opt, volColumn = VCOL;
  float spkTimes[2];
  float Vm_NEURON1[2];
  float threshold = DEF_THR;

  while ((opt = getopt(argc, argv, "hi:o:c:t:")) != -1) {
    switch (opt) {
      case 'h':
        show_usage(argv[0]);
        return 1;
      case 'i':
        if (optarg) {
          inputFilename = optarg;
          inputFile.open(inputFilename.c_str(), ifstream::in);
          inputFile.clear();
          inputFile.seekg(0, ios::beg);
        }
        break;
      case 'o':
        outputFilename = optarg;
        break;
      case 'c':
        if (optarg)
          volColumn = atoi(optarg);
        else {
          show_usage(argv[0]);
          return -1;
        }
        break;
      case 't':
        if (optarg)
          threshold = atof(optarg);
        else {
          show_usage(argv[0]);
          return -1;
        }
        break;
      default:
        show_usage(argv[0]);
        return 1;
    }
  }

  if (!inputFile.is_open()) {
    cerr << "File not found" << endl;
    show_usage(argv[0]);
    return -1;
  }

  if (outputFilename.empty())
    outputFilename = inputFilename.append(".spkTimes");

  fout.open(outputFilename.c_str(), ios::out | ios::binary);
  if (!fout.is_open()) {
    cerr << "Can't open output file" << endl;
    return -1;
  }

  getline(inputFile, auxStr);
  vector<string> partsAux;
  string space(" ");
  split(auxStr, space, partsAux);

  initTime = atof(partsAux[TIMECOL - 1].c_str());

  spkTimes[0] = 0;
  Vm_NEURON1[1] = 0;

  getline(inputFile, auxStr);
  while (!inputFile.eof()) {
    vector<string> parts;
    split(auxStr, space, parts);

    Vm_NEURON1[0] = Vm_NEURON1[1];
    Vm_NEURON1[1] = atof(parts[volColumn - 1].c_str());

    spkTimes[1] = atof(parts[TIMECOL - 1].c_str()) - initTime;

    if (Vm_NEURON1[0] < threshold && Vm_NEURON1[1] > threshold &&
        (spkTimes[1] - spkTimes[0] > MIN_TIME_AFTER_SPIKE_DETECTION)) {
      // Spike!
      spkTimes[0] = spkTimes[1];
      fout << setprecision(9) << spkTimes[1] << endl;
    }

    getline(inputFile, auxStr);
  }

  inputFile.close();
  fout.close();

  return (0);
}

void split(const string& str, const string& delim, vector<string>& parts) {
  size_t start, end = 0;
  while (end < str.size()) {
    start = end;
    while (start < str.size() && (delim.find(str[start]) != string::npos)) {
      start++;  // skip initial whitespace
    }
    end = start;
    while (end < str.size() && (delim.find(str[end]) == string::npos)) {
      end++;  // skip to end of word
    }
    if (end - start != 0) {  // just ignore zero-length strings.
      parts.push_back(string(str, start, end - start));
    }
  }
}
