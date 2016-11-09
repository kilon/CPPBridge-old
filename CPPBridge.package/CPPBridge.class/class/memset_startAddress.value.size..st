memory operations
memset_startAddress: aStartAddress value: aNumber size: anInteger
"Unmap fie from memory"

^ self ffiCall: #( void * memset ( void * aStartAddress, int aNumber , int anInteger )).
