mkdir lab-host1
mkdir lab-host2
mkdir lab-host3
mkdir lab-host4
# Check for each directory and create only if it doesn't exist
[ ! -d "lab-host1" ] && mkdir lab-host1
[ ! -d "lab-host2" ] && mkdir lab-host2
[ ! -d "lab-host3" ] && mkdir lab-host3
[ ! -d "lab-host4" ] && mkdir lab-host4
[ ! -d "lab-switch" ] && mkdir lab-switch

mkdir lab-switch
