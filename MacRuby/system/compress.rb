`tar cvf test.tar temp`.lines{|line| p line}
`tar xvf test.tar`.lines{|line| p line}
`tar zcvf test.tar.gz temp`.lines{|line| p line}
`tar zxvf test.tar.gz`.lines{|line| p line}
`tar jcvf test.bz2 temp`.lines{|line| p line}
`tar jxvf test.bz2`.lines{|line| p line}

`gzip -c test.tar > test.gz`.lines{|line| p line}
`gzip -d test.gz`.lines{|line| p line}


=begin
--------------------------------------------

.gz

解压1：gunzip FileName.gz

解压2：gzip -d FileName.gz

压缩：gzip FileName

.tar.gz

解压：tar zxvf FileName.tar.gz

压缩：tar zcvf FileName.tar.gz DirName

---------------------------------------------

.bz2

解压1：bzip2 -d FileName.bz2

解压2：bunzip2 FileName.bz2

压缩： bzip2 -z FileName

.tar.bz2

解压：tar jxvf FileName.tar.bz2

压缩：tar jcvf FileName.tar.bz2 DirName

---------------------------------------------

.bz

解压1：bzip2 -d FileName.bz

解压2：bunzip2 FileName.bz

压缩：未知

.tar.bz

解压：tar jxvf FileName.tar.bz

压缩：未知

---------------------------------------------

.Z

解压：uncompress FileName.Z

压缩：compress FileName

.tar.Z

解压：tar Zxvf FileName.tar.Z

压缩：tar Zcvf FileName.tar.Z DirName

---------------------------------------------

.tgz

解压：tar zxvf FileName.tgz

压缩：未知

.tar.tgz

解压：tar zxvf FileName.tar.tgz

压缩：tar zcvf FileName.tar.tgz FileName

---------------------------------------------

.zip

解压：unzip FileName.zip

压缩：zip FileName.zip DirName

---------------------------------------------

.rar

解压：rar a FileName.rar

压缩：rar e FileName.rar

---------------------------------------------

.lha

解压：lha -e FileName.lha

压缩：lha -a FileName.lha FileName

---------------------------------------------

.rpm

解包：rpm2cpio FileName.rpm | cpio -div

---------------------------------------------

.tar .tgz .tar.gz .tar.Z .tar.bz .tar.bz2 .zip .cpio .rpm .deb .slp .arj .rar .ace .lha .lzh

.lzx .lzs .arc .sda .sfx .lnx .zoo .cab .kar .cpt .pit .sit .sea

解压：*** x FileName.*

压缩：*** a FileName.* FileName



=end