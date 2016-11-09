memory operations
write_fd: aFd value: aString size: anInteger
"Unmap fie from memory"

^ self ffiCall: #( int write ( int aFd , String aString , int anInteger )).
