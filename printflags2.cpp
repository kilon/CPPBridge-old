#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string>
#include <iostream>
#include <typeinfo>

#define FILEPATH "/Users/kilon/cpptest.bin"
#define NUMINTS  (1000)
#define FILESIZE (NUMINTS * sizeof(int))

typedef struct
    {
        float x; // no need to take the entire space of the shared memory
        float y;
        float z;
    } state_data;


int main(int argc, char *argv[])
{
    int i;
    int fd;
    char* map_pointer;

    int result;


    fd = open(FILEPATH, O_RDWR);
    std::cout<<"Result of opening file : "<<std::to_string(result)<<"\n";

    std::cout<<"Result of writing to file : "<<std::to_string(result)<<"\n";

    //map_pointer = (std::string*) mmap(0, FILESIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    state_data* data =(state_data*) mmap(0, FILESIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
if (data == MAP_FAILED) {
	close(fd);
	perror("Error mmapping the file");
	exit(EXIT_FAILURE);
    }

    //std::cout<<"map_pointer : "<<std::to_string(map_pointer)<<"\n";

     std::cout<<"Struct x : "<<data->x<<"\n";
     std::cout<<"Struct y : "<<data->y<<"\n";
     std::cout<<"Struct z : "<<data->z<<"\n";
     std::cout<<"type of  z : "<<typeid(data->z).name()<<"\n";

     std::cout<<"size of Struct : "<<sizeof(*data)<<"\n";
     std::cout<<"size of float : "<<sizeof(float)<<"\n";



    std::cout<<"O_RDWR : "<< std::to_string(O_RDWR) << "\n";
    std::cout<<"O_CREAT : "<< std::to_string(O_CREAT) << "\n";
    std::cout<<"O_TRUNC : "<< std::to_string(O_TRUNC) << "\n\n";

    std::cout<<"O_RDWR | O_CREAT | O_TRUNC : "<<std::to_string(O_RDWR | O_CREAT | O_TRUNC)<<"\n";

    std::cout<<"PROT_READ : "<< std::to_string(PROT_READ) << "\n";
    std::cout<<"PROT_WRITE : "<< std::to_string(PROT_WRITE) << "\n";
    std::cout<<"MAP_SHARED : "<< std::to_string(MAP_SHARED) << "\n";

    std::cout<<"\nfd : "<<std::to_string(fd)<<"\n";
    std::cout<<"\nSEEK_SET : "<<std::to_string(SEEK_SET)<<"\n";

    std::cout<<"\nPROT_READ | PROT_WRITE: " << std::to_string(PROT_READ | PROT_WRITE)<<"\n";

    std::cout<<"\nMAP_FAILED : " << MAP_FAILED << "\n";

if (munmap(data, FILESIZE) == -1) {
	perror("Error un-mmapping the file");
	/* Decide here whether to close(fd) and exit() or not. Depends... */
    }

    /* Un-mmaping doesn't close the file, so we still need to do that.
     */

    close(fd);
    return 0;
}
