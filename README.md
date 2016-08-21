This is all you need to create a working Postgresql 9.4 image + PhpPgadmin already configured to allow access from remote hosts.

It will provide a working ubuntu 14.04 environment with utils and tools such as vim, curl, wget, net-tools and build-essentials

You can either download the repository and run:

> docker build -t alex0494/pgsqlserver:1.0 .

to build the image locally, or you can run

> docker run -d --name pgsqlserver -p 8081:80 alex0494/postgresqlserver

to download the pre-built image from my dockerhub

You can find the image @ dockerhub.com/alex0494/pgsqlserver

If you find this helpful or encounter any bugs or issues shoot me an email at: aries0494@icloud.com 
