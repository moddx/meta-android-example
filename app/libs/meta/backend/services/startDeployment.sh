#!/bin/bash

# echo "starting rabbitMQ Docker container"
# docker container start rabbitmq
# sleep .5

function chdir {
    echo ""
    echo "################################################################"
    echo "change cwd to $1"
    cd "$1"
}

function rmnohup {
    echo "removing log: nohup.out"
    rm nohup.out
}


chdir meta.deployment/

echo "removing old logfiles.."
rm ../logs/*.log

chdir 3_Deployment/
rmnohup
echo "starting: message queue deployment service..."
nohup ./deployment-service.py &
DP_PID=$!
sleep .5
echo "started with PID: $DP_PID"
cd ..

chdir 2_Compilation/
rmnohup
echo "starting: compilation servie..."
nohup ./compilation-service.py &
CS_PID=$!
sleep .5
echo "started with PID: $CS_PID"
cd ..


chdir 1_Transformation/
rmnohup
echo "starting: IR transformation service..."
nohup ./transformation-service.py &
TR_PID=$!
sleep .5
echo "started with PID: $TR_PID"
cd ..


chdir 0_Filehandler/
rmnohup
echo "starting: IR file handler service..."
go build ir-file-handler-service.go 
nohup ./ir-file-handler-service &
IR_PID=$!
sleep .5
echo "started with PID: $IR_PID"
cd ..

echo ""
echo "################################################################"
echo -n "Waiting for processes to init or fail.. "
WAITFOR=3
for i in `seq 1 $WAITFOR`; do 
    echo -n "`expr $WAITFOR - $i + 1`..";
    sleep 1; 
done
echo ""

FAIL=0
out=`ps p $DP_PID`
[[ "$?" -eq "0" ]] || { echo "!! Deployment Service did not start properly!" && FAIL=1; }
out=`ps p $CS_PID`
[[ "$?" -eq "0" ]] || { echo "!! Compilation Service did not start properly!" && FAIL=1; }
out=`ps p $TR_PID`
[[ "$?" -eq "0" ]] || { echo "!! Transformation Service did not start properly!" && FAIL=1; }
out=`ps p $IR_PID`
[[ "$?" -eq "0" ]] || { echo "!! IR FileHandler Service did not start properly!" && FAIL=1; }

[[ "$FAIL" -eq "0" ]] && echo "Services seem to be running just fine." || echo "Some services had problems starting up."
echo ""

echo ""
echo "################################################################"
echo "to clean up and stop the created processes use:"
echo ""
echo "  kill $DP_PID $CS_PID $TR_PID $IR_PID" 
echo ""
