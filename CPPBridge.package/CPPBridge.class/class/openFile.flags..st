as yet unclassified
openFile: aString flags: flags
"opens a file to be used for mapping the shared memory"
^self ffiCall: #( int open(String aString ,int flags)).
