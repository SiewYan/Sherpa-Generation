#!/bin/bash

./configure \
    --prefix=${CMSSW_BASE}/src/SherpaGeneration/Generator/sherpant \
    --enable-mpi \
    --enable-ufo \
    --enable-shared \
    --enable-gzip \
    --enable-lhole \
    --enable-pythia \
    --enable-gzip \
    --enable-lhole \
    --enable-analysis \
    --enable-root=`root-config --prefix` \
    --enable-lhapdf=`scram tool info lhapdf | grep 'BASE' | awk -F "=" '{print $2}'` \
    --enable-rivet=`scram tool info rivet | grep 'BASE' | awk -F "=" '{print $2}'` \
    --enable-hepmc2=`scram tool info hepmc | grep 'BASE' | awk -F "=" '{print $2}'` \
    --enable-lhapdf=`scram tool info lhapdf | grep 'BASE' | awk -F "=" '{print $2}'` \
    --enable-blackhat=`scram tool info blackhat | grep 'BASE' | awk -F "=" '{print $2}'` \
    --enable-fastjet=`scram tool info fastjet | grep 'BASE' | awk -F "=" '{print $2}'` \
    --enable-openloops=`scram tool info openloops | grep 'BASE' | awk -F "=" '{print $2}'` \
    --with-sqlite3=install