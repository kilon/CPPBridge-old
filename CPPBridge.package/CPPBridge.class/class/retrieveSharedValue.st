as yet unclassified
retrieveSharedValue
<example>
"This method is an example that retrieves a struct from a shared memory section, in order for this example to work you need you first copy paste the contents of the Example Souce Code of the C++ file in the comment section of this class to a C++ source code file and compile it a run then replace the path of in this code of CPPBridge openFile: with the correct path of the bin that the C++ files has created , in order for this to work also you need to execute the C++ example first so it creates and file and share the memory"
|instance fdNumber lseek mmapPointer data struct|
instance := CPPBridge new.
fdNumber := CPPBridge openFile: '/Users/kilon/git/Pharo/Atlas/mmapped.bin' flags: (O_RDWR) .
lseek := CPPBridge lSeek_fd: fdNumber range:3000  value:0.
mmapPointer := CPPBridge  mmap_adress: 0 fileSize:4000  flag1: PROT_READ flag2: PROT_WRITE fd: fdNumber  offset: 0  .
struct := CPPStruct pointTo: (mmapPointer getHandle ).


data :={ instance.  fdNumber . lseek. mmapPointer  .  struct}.
CPPBridge  closeFile:fdNumber   .
data inspect.
^data 

"struct := {(mmapPointer getHandle  copyFrom: 1 to:3000 )asString . (mmapPointer getHandle integerAt: 3001 size:4 signed: false)}."