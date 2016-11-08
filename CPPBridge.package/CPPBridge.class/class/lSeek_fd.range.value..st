as yet unclassified
lSeek_fd: anFd range: aSizeInBytes value: anInteger
"this function will fill a portion range of a file fd with a value "
^self ffiCall: #( int lseek(int anFd, int aSizeInBytes, int anInteger))