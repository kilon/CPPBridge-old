memory operations
writeString:aString toAdress: mmapPointer
"Unmap fie from memory"

^ 1 to:(aString size) do:[:count| mmapPointer getHandle unsignedCharAt: count  put:( aString  at: count) ]
