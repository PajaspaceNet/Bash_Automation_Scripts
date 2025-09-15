ZDROJ ::: ### https://the-debugging-diaries.com/centos-stream-9-repository-issue-all-mirrors-were-tried/<br>
Moc mi to pomohlo !!!<br>
Nekdy se stava ze VPS servery nejdou updatovat instalovat tam nejde atd ... toto je reseni<br>
<pre>
vi /etc/yum.repos.d/centos.repo # vsechno smazat a dat tam Centos Base repo , dale postup za scriptem
 </pre>

<pre>
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the 
# remarked out baseurl= line instead.
#
#

# change to local mirror server
[baseos]
name=CentOS Stream $releasever - BaseOS
#metalink=https://mirrors.centos.org/metalink?repo=centos-baseos-$stream&arch=$basearch&protocol=https,http
baseurl=https://mirror.stream.centos.org/9-stream/BaseOS/x86_64/os
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[appstream]
name=CentOS Stream $releasever - AppStream
#metalink=https://mirrors.centos.org/metalink?repo=centos-appstream-$stream&arch=$basearch&protocol=https,http
baseurl=https://mirror.stream.centos.org/9-stream/AppStream/x86_64/os
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[NFV]
name=Centos Stream $releasever - NFV
baseurl=https://mirror.stream.centos.org/9-stream/NFV/x86_64/os
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[CRB]
name=Centos Stream $releasever - CRB
baseurl=https://mirror.stream.centos.org/9-stream/CRB/x86_64/os
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[HighAvailability]
name=Centos Stream $releasever - High Availability
baseurl=https://mirror.stream.centos.org/9-stream/HighAvailability/x86_64/os
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[RT]
name=Centos Stream $releasever - RT
baseurl=https://mirror.stream.centos.org/9-stream/RT/x86_64/os
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[ResilientStorage]
name=Centos Stream $releasever - Resilient Storage
baseurl=https://mirror.stream.centos.org/9-stream/ResilientStorage/x86_64/os
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1
</pre>

<pre>
curl -o /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official-SHA256
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
rpm -qi gpg-pubkey
dnf clean all
rm -rf /var/cache/dnf
dnf makecache
</pre>
