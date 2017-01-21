docker run -itd -p 5000:5000 --name shop-ujs --link best-mysql -v "$PWD":/data -w /data ruby:2.3.1 bash

docker exec -it shop-ujs bash
