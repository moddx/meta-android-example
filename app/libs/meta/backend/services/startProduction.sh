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


chdir meta.production/

#echo "removing old logfiles.."
#rm ../logs/*.log

chdir 0_DataHandler/
rmnohup
echo "starting: DataHandler..."
go build dataHandler.go
nohup ./dataHandler &
DH_PID=$!
sleep .5
echo "started with PID: $DH_PID"
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
out=`ps p $DH_PID`
[[ "$?" -eq "0" ]] || { echo "!! DataHandler did not start properly!" && FAIL=1; }
[[ "$FAIL" -eq "0" ]] && echo "Services seem to be running just fine." || echo "Some services had problems starting up."
echo ""

echo ""
echo "################################################################"
echo "to clean up and stop the created processes use:"
echo ""
echo "  kill $DH_PID" 
echo ""
