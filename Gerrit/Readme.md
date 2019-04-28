# 配置Gerrit
1. http服务
2. Gerrit

## HTTP服务配置
配置文件：`/etc/httpd/conf/httpd.conf`
```
NameVirtualHost *:8082
Listen 8082 
<VirtualHost *:8082>
    ProxyRequests off
    ProxyVia off
    ProxyPreserveHost On
    AllowEncodedSlashes On
#   RewriteEngine on
#   RewriteRule ^/(.*) http://192.168.0.111:8081/$1 [NE,P]

    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>

    <Location /login/>
        AuthType Basic
        AuthName "Gerrit Code Review"
        Require valid-user
        AuthBasicProvider file
        AuthUserFile /var/www/gerrit/passwd
    </Location>

    ProxyPass / http://server_host:8081/ nocanon
#ProxyPassReverse / http://192.168.0.111:8081/ nocanon
</VirtualHost>
```

