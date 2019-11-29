#!/bin/bash
for i in "$@"
do
case $i in
    --sftp-user=*|--SFTP-USER=*)
    SFTPUSER="${i#*=}"
    ;;
    --sftp-server=*|--SFTP-SERVER=*)
    SFTPSERVER="${i#*=}"
    ;;
    --DMP=*|--dmp=*)
    DMP="${i#*=}"
    ;;
    --cdrs=*|--CDRS=*|--CDRs=*)
    CDRS="${i#*=}"
    ;;
    *)
    ;;
esac

done


#Si cualquier var es null, sale...
if [ -z "$SFTPUSER" ] || [ -z "$SFTPSERVER" ] || [ -z "$DMP" ] || [ -z "$CDRS" ];
    then
        echo "Al menos el valor de una de las variables es null.\nHay que declarar los parametros --sftp-user, --sftp-server, --dmp y --cdrs.\nSaliendo..."
        
    else
        echo "Ejecuta script..."
fi
