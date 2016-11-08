as yet unclassified
closeFile: aFd
"closes an opened file fd"
^self ffiCall: #( int close(int aFd))