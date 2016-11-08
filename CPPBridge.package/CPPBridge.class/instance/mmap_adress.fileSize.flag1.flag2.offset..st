as yet unclassified
mmap_adress: anAddress fileSize: aFileSize flag1: aFlag1 flag2: aFlag2 offset: anOffset


^self ffiCall: #( void * mmap ( int anAddress , int aFileSize , int aFlag1 , int aFlag2 , int fd , int anOffset ))