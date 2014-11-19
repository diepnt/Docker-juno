Docker
=======
install docker

git clone https://github.com/diepnt/Docker.git

docker build -t $service /path_to_service_forder
HAproxy
====
TRong dockfile tất cả các config đểu trỏ đến ip proxy duy nhất.

Cần cấu hình file host của mỗi container trỏ đến ip này

keystone
=======
Sau khi build edit file hosts trỏ tới proxy

10.2.100.17         proxy


Glance
====
Sau khi build edit file hosts trỏ tới proxy

10.2.100.17         proxy
