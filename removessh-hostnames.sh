val=$1;

value=`echo "$val"|sed 's:(:{:g; s:):}:g; s:|:,:g; s/^//;s/$//'`
value=`echo "$value"|sed 's:\[:{:g; s:\]:}:g; s:-:\.\.:g; s/^//;s/$//'`
(eval echo $value)

for host in $(eval echo $value)
do
	echo "Current server: $host"
	ssh-keygen -R $host
done
