as yet unclassified
retrieveSharedValueStep1
<example>
"This method is an example that retrieves a struct from a shared memory section, in order for this example to work you need you first copy paste the contents of the Example Souce Code of the C++ file in the comment section of this class to a C++ source code file and compile it a run then replace the path of in this code of CPPBridge openFile: with the correct path of the bin that the C++ files has created , in order for this to work also you need to execute the C++ example first so it creates and file and share the memory.

After executing this method you can execute retrieveSharedValueStep2 to unmap and close the memory mapped file (keeps sharing the memory it just does not store it to the file)"

|instance fdNumber lseek mmapPointer data struct|

instance := CPPBridge new.
fdNumber := CPPBridge openFile: '/Users/kilon/git/Pharo/Atlas/mmapped.bin' flags: (O_RDWR) . 

"Warning !!! You must change the path to the file that is located in your hard drive. The file should be at the same location you built atlas-server.cpp which is responsible for creating the file."

lseek := CPPBridge lSeek_fd: fdNumber range:3999  value:0.
mmapPointer := CPPBridge  mmap_adress: 0 fileSize:4000  flag1: (PROT_READ | PROT_WRITE )flag2: MAP_SHARED  fd: fdNumber  offset: 0  .
struct := CPPStruct pointTo: (mmapPointer getHandle ).


data :={ instance.  fdNumber . lseek. mmapPointer  .  struct}.
data inspect.

ExampleDATA := data.
^data 

"
This is an alternative array that contains only the two values of the C Struct : 

1) data = char[3000]  this is where we store the string
2) count = int this is where we store the size of the string

struct := {(mmapPointer getHandle  copyFrom: 1 to:3000 )asString . (mmapPointer getHandle integerAt: 3001 size:4 signed: false)}.

mmapPointer is the pointer that points to the first byte of the shared memory.

getHandle gives us the memory adress that the pointer points to

copyFrom:1 to:3000 copies byte from byte 0 (remember C counts from 0 , Pharo counts from 1) to byte 3000 because the string we store is stored as a char array of 3000 elements, each element is a char, each char is 1 byte in leght and represents a single character of the string.

on the other hand integerAt: 3001 size: 4 signed: false returns us the value count memeber of the C struct . its an integer in position 3001 because our string is a char[3000] and the size is 4 bytes because its an C int, signed false because we use no negative values because it does not make sense for a string to have negative length."