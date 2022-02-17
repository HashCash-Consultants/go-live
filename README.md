# Aurora setup

To build aurora you must have go and dep in your ubuntu enivironment. To install go you need to perform  below steps and go version must be >=1.16.14


# Install go


- sudo curl -O https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
- sudo tar -xvf go1.16.14.linux-amd64.tar.gz
- Open vi .profile file and add following lines:
```ssh
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export GOPATH=$HOME/go
export PATH=${GOPATH}/bin:${PATH}
and save the file
```
- Open vi .bashrc and add following lines
```ssh
eval "$(direnv hook bash)"
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```
- To refresh the files execute following commands:
```ssh
source ~/.profile
source  ~/.bashrc
```
- Check go version
```ssh
$ go version
```

# Install aurora

- mkdir github.com/hcnet in /home/ubuntu/go/src
- go to /home/ubuntu/go/src/github.com/hcnet and execute following command:
- git clone https://github.com/HashCash-Consultants/go.git
- go to /home/ubuntu/go/src/github.com/hcnet /go and execute following command:

```
$ go to /home/ubuntu/go/src

$ go install -v ./services/aurora
```
- after running above command you check aurora build in <Your_dir>/go/bin folder and you can check aurora version by  following command :
```
$ ./aurora version
```

# Aurora database setup
- Create a user for HC Net aurora database.
```
$ sudo -s
$ su – postgres
$ createuser <username> --pwprompt
$ Enter password for new role: <Enter password>
$ Enter it again: <Enter the pwd again>
```
- You need to add Aurora user. Exit from postgres and login as root user and execute following command.
```
$ exit
$ adduser <username>;
```
- To verify if user is created, execute following commands
```
$ su - postgres
$ psql
$ \du
```
- Create a blank database using following command.
```
 $ CREATE DATABASE <DB_NAME> OWNER <user created>;
```
 # Initialize aurora
 - Initialize aurora with database login as root user and Go   “go/bin” using following command
```
 $ export DATABASE_URL="postgresql://define aurora db username:define aurora db user password@localhost/define aurora database name"
```
- After that Go “go/bin” and execute following command
```
$ ./aurora db init
```

[Hcnet Development Foundation](https://hcnet.org)