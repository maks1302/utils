# $1 - Python version
#!/bin/bash
if [ -n "$1" ]; then
	version=$1
else
	version="3.9.6"
fi
if ! python3 --version | grep -q $version; then
	sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev -y
	wget "https://www.python.org/ftp/python/$version/Python-$version.tgz"
	sudo rm -rf /usr/local/python
	sudo tar -C /usr/local -xzf "Python-$version.tgz"
	rm "Python-$version.tgz"
	sudo mv "/usr/local/Python-$version" /usr/local/python
	cd /usr/local/python
	./configure --enable-optimizations
	make
	sudo make altinstall
	sudo apt install python3-pip -y 
	cd
fi