/*
 * Modification History
 *
 * 2003-January-23   Jason Rohrer
 * Created.
 *
 * 2003-November-10   Jason Rohrer
 * Added makeDirectory function.
 */



#include "minorGems/io/file/Directory.h"



#include <direct.h>



char Directory::removeDirectory( File *inFile ) {
    char *fileName = inFile->getFullFileName();
    
    int result = _rmdir( fileName );

    delete [] fileName;

    if( result == 0 ) {
        return true;
        }
    else {
        return false;
        }
    }



char Directory::makeDirectory( File *inFile ) {
    char *stringName = inFile->getFullFileName();

    int result = mkdir( stringName );

    delete [] stringName;        

    if( 0 == result ) {
        return true;
        }
    else {
        return false;
        }
    }


