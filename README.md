<h1>Samba</h1>
<p>You have to setup a "<i>smb.conf</i>" in your home directory or somwhere else. You can use my smb.conf.example in this repository.</p>

<h2>Build Image</h2>
<p><code>docker build https://github.com/tiroso/docker_samba.git#v4.8.2  --tag tiroso/samba:v4.8.2</code></p>

<h2>Pull Image</h2>
<p><code>docker pull tiroso/samba:v4.8.2</code></p>

<h2>Run Container</h2>
<p><code>docker run -dt -v $PWD/smb.conf:/etc/samba/smb.conf -v fhem-server:/fhem-server -v fhem-smartvisu:/fhem-smartvisu -p 445:445 --restart=always --name samba tiroso/samba:v4.8.2</code></p>

<h2>User in Container</h2>
<p>I've setup the image without some user, based on the repository https://github.com/Stanback/alpine-samba.</p>
<h3>Create a new user</h3>
<p><code>docker exec -it samba adduser -s /sbin/nologin -h /home/samba -H -D tiroso</code><br>
  <code>docker exec -it samba smbpasswd -a tiroso</code></p>
