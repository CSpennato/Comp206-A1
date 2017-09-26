if test $1 = "alpha"
	then
	(ls|grep '.dat'|sort) > tmp.txt
	sed -i -e 's/dat/jpg/g' tmp.txt
	convert $(cat tmp.txt) -append result.jpg
	sed -i -e 's/.jpg//g' tmp.txt
	cat tmp.txt
	rm tmp.txt
fi

if test $1 = "weight"
	then
	echo > tmp.txt
	for i in $(ls|grep '.dat')
		do
		echo $(grep -o "[0-9][0-9]*kg" $i) $i >> tmp.txt
	done
	sort -g tmp.txt > tmp2.txt
	for i in tmp2.txt
		do
		grep -o "[a-z]*[_]*[a-z][a-z]*.dat" $i > tmp.txt
	done
	sed -i -e 's/dat/jpg/g' tmp.txt
	convert $(cat tmp.txt) -append result.jpg
	sed -i -e 's/.jpg//g' tmp.txt
	cat tmp.txt
	rm tmp.txt tmp2.txt
fi

if test $1 = "length"
	then
	echo > tmp.txt
	for i in $(ls|grep '.dat')
		do
		echo $(grep -o "[0-9]*[.]*[0-9][0-9]*m" $i) $i >> tmp.txt
	done
	sort -g tmp.txt > tmp2.txt
	for i in tmp2.txt
		do
		grep -o "[a-z]*[_]*[a-z][a-z]*.dat" $i > tmp.txt
	done
	sed -i -e 's/dat/jpg/g' tmp.txt
	convert $(cat tmp.txt) -append result.jpg
	sed -i -e 's/.jpg//g' tmp.txt
	cat tmp.txt
	rm tmp.txt tmp2.txt
fi


