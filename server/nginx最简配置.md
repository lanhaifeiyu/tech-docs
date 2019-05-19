##### nginx最简配置 - /etc/nginx/nignx.conf：

```

user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;

    upstream general {
        server  182.61.49.180:8080 max_fails=2 fail_timeout=600s;
        server  182.61.49.180:8080 backup;
    }
    
    server{
        listen 8081;
        server_name localhost;

        location / {
            proxy_pass http://general;
        }
    }

}
```

