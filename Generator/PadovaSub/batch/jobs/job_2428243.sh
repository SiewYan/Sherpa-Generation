#!/bin/bash

WorkingDir=${CMSSW_BASE}/src/SherpaGeneration/Generator/SM_Zbj_nlo
TMPDir=/lustre/cmswork/hoh/tmp

echo "PWD:"
eval cd ${TMPDir}
#pwd
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh
#RANDOMSEED=`od -vAn -N4 -tu4 < /dev/urandom`

if [[ -z "${CMSSW_BASE}" ]]; then
    echo "CMSSW_BASE is missing".
    exit 0
else
    echo "Copying working folder"
    scp -r ${WorkingDir} ${TMPDir}/batch_SM_Zbj_nlo_2428243
fi

eval cd ${TMPDir}/batch_SM_Zbj_nlo_2428243
#scp $WorkingDir ${TMPDir}/batch_SM_Zbj_nlo_2428243

echo "environment:"
echo
env > local.env
env

sed -i 's/1111111/2428243/g' cmsRun_cfg.py
echo "running"
cmsRun cmsRun_cfg.py
mv sherpa_SM_Zbj_nlo_MASTER_cff_py_GEN_SIM.root ${WorkingDir}/sherpa_SM_Zbj_nlo_2428243_GEN_SIM.root
#mv *GEN_SIM.root sherpa_GenSim_2428243.root 
#mv sherpa_GenSim_2428243.root ${WorkingDir}
echo "Cleaning up"
rm -rf ${TMPDir}/batch_SM_Zbj_nlo_2428243
exit $?
echo ""
