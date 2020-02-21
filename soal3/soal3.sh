#!bin/bash/

for((i=1; i<29; i++))
do
  wget -cO "pdkt_kusuma_$i.jpg" -a "wget.log" "https://loremflickr.com/320/240/cat"
done

if [ ! -d kenangan ]
then
  mkdir kenangan
  mkdir duplicate
fi

for ((j=1; j<29; j++))
do
  if [ -f "pdkt_kusuma_$j.jpg" ]
  then
    jml_kng=$(ls kenangan | wc -l)
    for ((k=1; k<=jml_kng; k++))
    do
        convert pdkt_kusuma_$j.jpg gambar_asli.rgba
        convert kenangan/kenangan_$k.jpg gambar_checker.rgba

        cmp -s {gambar_asli,gambar_checker}.rgba
        hasil=$?

        if [[ $hasil -eq 0 ]]
        then
          gambar_duplikat=$(ls duplicate | wc -l)
          mv pdkt_kusuma_$j.jpg duplicate/duplicate_$(($gambar_duplikat+1)).jpg
          k=jml_kng+1
        fi
    done
    if [ -f "pdkt_kusuma_$j.jpg" ]
    then
      mv pdkt_kusuma_$j.jpg kenangan/kenangan_$(($jml_kng+1)).jpg
    fi
  fi
done

cp wget.log wget.log.bak
rm *.rgba
