### 1. Create a shell script gencsv.sh with following content.

~~~
#!/bin/bash
[ -e inputFile ] && rm inputFile
for(( i=$1; i<=$2; i++ ))
do
    echo "${i}, ${RANDOM}" >> inputFile
done
~~~


### 2. Run the Script 
~~~
 $ sh gencsv.sh 2 8
~~~

### 3. Run the csvserver docker container &  check the status:
~~~
$ docker run -d -v ./inputFile:/csvserver/inputdata:z docker.io/infracloudio/csvserver:latest
$ docker ps
~~~


### 4. Check port no. on which it is running & exit from container
~~~
$ docker exec -it 74140f5ab614 /bin/bash

# netstat -an
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State      
tcp        0      0 0.0.0.0:9300            0.0.0.0:*               LISTEN     
Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node   Path
Active Bluetooth connections (servers and established)
Proto  Destination       Source            State         PSM DCID   SCID      IMTU    OMTU Security
Proto  Destination       Source            State     Channel

# exit 
$ docker rm -f 74140f5ab614
~~~

### 5. Run the csvserver with exposing it to outside on port 9393.
~~~
$ docker run -d -v ./inputFile:/csvserver/inputdata:z -p 9393:9300 -e CSVSERVER_BORDER='Orange' docker.io/infracloudio/csvserver:latest 
~~~


