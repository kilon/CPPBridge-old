file
lSeek: aSizeInBytes
^self ffiCall: #( int lseek(int fd, int aSizeInBytes, 0))