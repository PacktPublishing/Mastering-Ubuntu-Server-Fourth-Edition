server { 
        listen 80; 
        listen [::]:80;  

        root /var/www/acmesales.com; 

        index index.html index.htm index.nginx-debian.html; 

        server_name acmesales.com www.acmesales.com; 

        location / { 
                try_files $uri $uri/ =404; 
        } 
}
