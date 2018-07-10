#Dionisis Odysseas Sotiropoulos 5661

	## ./TOOL.SH ##
	if [ -z "$1" ]; then
	echo "5661"
	exit 0
	fi
	
	## ./TOOL.SH -F <FILE> ##
	if [[ $1 = "-f" || -z $3 ]]; then
	grep -v '^#' $2
	fi
	## APOTHIKEUSH TOY <FILE> SE VARIABLE VAR1 ##
	for ((i=1; i<=$#; i++)); do
	if [ ${!i} = "-f" ]; then
	persons=$((i+1))
	var1=${!persons}
	fi
	done

	##MAIN WHILE/CASE LOOP##

	while test $# -gt 0
	do
	case "$1" in
		## EPILOGH GRAMMHS ID ##
		-id)
		while read -r line
		do
		awk -v var=$2 -F'|' '{if ($1==var) print $2 " " $3 " " $5 } '
		done < $var1
		;;
		## EMFANISH TWN MIKRWN ONOMATWN ##
		--firstnames)
		while read -r line
		do
		awk -F'|' '{print $2}'	| sort | sed 's/^.* //'
		done < $var1
		;;
		## EMFANISH TWN EPONYMWN ##
		--lastnames)
		while read -r line
		do
		awk -F'|' '{print $3}'	| sort | sed 's/^.* //'
		done < $var1
		;;
		## BORN-SINCE-UNTILL ##
		## EMFANISH GENNHMENWN APO...
		--born-since)
		if [ $3 != "--born-until" ] && [ -z $until ]
		then
		while read -r line
		do
		awk -F'|' -v from=$2 '$5>=from'
		done < $var1
		else
			if [ -n "$until" ]
			then
			while read -r line
			do
			awk -F'|' -v from=$2 -v till=$until '{if ($5 >=from && $5<=till) print $0}'
			done < $var1
			fi
		fi
		;;
		## EMFANISH GENNHMENWN MEXRI...
		--born-until)
		until="$2"
		if [ $3 != "--born-since" ] && [ -z $since ]
		then
		while read -r line
		do
		awk -F'|' -v till=$2 '$5<=till'
		done < $var1
		else
			if [ -n "$since" ]
			then
			while read -r line
			do
			awk -F'|' -v till=$2 -v from=$since '{if ($5 >= from && $5<=till) print $0}'
			done < $var1
			fi
		fi
		;;
		## EMFANISH KAI METRHSH TWN BROWSERS ##
		--browsers)
		while read -r line
		do
		awk -F'|' '{print $8}' | sort | uniq -c | sort -n
		done < $var1
		;;
		## EPEKSERGASIA TOU ARXEIOY ##
		--edit)
		if [ $3 != 1 ] && [ $3 -le 8 ]
		then
		while read -r line
		do
		awk -v id="$2" -v col="$3" -v val="$4" -F'|' '{if ($1==id) gsub( $((col)), val); print $0}' $var1 > person.dat_tmp && mv person.dat_tmp $var1
		done < $var1
		fi
		;;
		esac
		shift
		done
		exit 0

		exit 0













