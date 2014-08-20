echo ""
echo "Setting environment..."

CAT=cat
CD=cd
PL_LIB=/data/PrimaLuce/lib

#  == Setting libraries
#  $CAT /system/lib/libm.so > $PL_LIB/libm.so.6

PATH=/data/PrimaLuce/bin:$PATH
LD_LIBRARY_PATH=/data/PrimaLuce/lib:$LD_LIBRARY_PATH

echo "All done..."
echo "Running Sample..."

# == Executing sample
cd usr/samples/
./sample1
cd ../../
echo ""

