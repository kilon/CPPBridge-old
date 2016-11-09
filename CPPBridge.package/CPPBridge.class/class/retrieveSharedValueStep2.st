as yet unclassified
retrieveSharedValueStep2
<example>
"this one is to be triggered after retrieveSharedValueStep1 when we are finished with the shared memory and we want to erase it and close the memory mapped file

ExampleDATA = { CPPBridgeinstance . fd . lseek . mmap . struct}"

CPPBridge munmap_data: (ExampleDATA at: 4) filesize: 4000.
CPPBridge  closeFile: (ExampleDATA at: 2).