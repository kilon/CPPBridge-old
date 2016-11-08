file
openFile: aString flags: flags
fd:= self ffiCall: #( int open(String aString ,int flags)).
^fd