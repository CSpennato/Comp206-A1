NUM=$1
CNT=$(ps|grep 'eog'|wc -l|grep -o -E '[0-9]+')
PIC=1

while true
	do
	CNT=$(ps|grep 'eog'|wc -l|grep -o -E '[0-9]+')
	if test "$CNT" -lt "$NUM"
		then
		ls|grep '.dat'|sed "${PIC}q;d" > tmp.txt
		sed -i -e "s/dat/jpg/g" tmp.txt
		eog -n $(cat tmp.txt) &
		CNT=$(ps|grep 'eog'|wc -l|grep -o -E '[0-9]+')
		if test $PIC == $(ls|grep '.dat'|wc -l)
			then
			PIC=0
		fi
		PIC=$(($PIC+1))
	rm tmp.txt
	fi
done
