# SoalShiftSISOP20_modul1_T20
Praktikum Sistem Operasi 2020 - Modul 1
Departemen Teknologi Informasi

Anggota :
- Fikri Haykal
- Hana Ghaliyah Azhar


# Soal 1
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file "Sample-Superstore". Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa : <br />
- Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit <br />
- Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan poin a <br />
- Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b <br />

Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut. <br />
*Gunakan AWK dan Command pendukung <br />

### Jawaban
1.a Region yang memiliki Profit paling sedikit
- Pindah ke directory soal1 <br />
  Syntax : <br />
  `cd Downloads/Modul1/soal1
- Membuat file shell "soal1.sh" <br />
  Syntax : <br />
  `nano soal1.sh` <br />
- Isi file soal1.sh
  > #!/bin/bash 
  
  > declare -a state
  > c=0

  > read region profit <<< $(gawk -F "\t" 'NR>1 {summm[$13] += $21}
  > END {
  > for(i in summm){
  >  print i, summm[i]
  > }
  > }' Sample-Superstore.tsv | LC_ALL=C sort -nrk2 | tail -1)

  > echo "Region dengan profit terendah adalah "$region" dengan profit sebesar "$profit
  > printf "\n\n"`



# Soal 2
Terdiri dari 3 file shell, yaitu :
1. <b>soal.sh</b><br />
   File ini digunakan untuk generate random password yang membutuhkan argument untuk penamaan file<br />
   Contoh : <i>$</b> bash soal2.sh password</i>
2. <b>soal2_enkripsi.sh</b><br />
   File ini digunakan untuk mengenkripsi file. Penggunaannya adalah dengan menambahkan argument nama file yang akan dienkripsi<br />
   Contoh : <i>$</b> bash soal2_enkripsi.sh password.txt</i>
3. <b>soal2_dekripsi.sh</b><br />
   File ini digunakan untuk mendekripsi file. Penggunaannya adalah dengan menambahkan argument nama file yang akan didekripsi<br />
   Contoh : <i>$</b> bash soal2_dekripsi.sh ufxxbtwi.txt</i>
   


# Soal 3
Terdiri dari 1 file shell, yaitu :
1. <b>soal3.sh</b><br />
   File ini akan mengeksekusi sesuai permintaan semua sub-soal nomor 3<br />
   Contoh : <i>$</b> bash soal3.sh</i>
   
Selain itu terdapat file <b>crontab</b> yang berisi perintah crontab sesuai yang diminta soal
