Docker
=======
install docker

git clone https://github.com/diepnt/Docker.git

docker build -t $service /path_to_service_forder
HAproxy
====
TRong dockfile tất cả các config đểu trỏ đến ip proxy duy nhất.

Cần cấu hình file host của mỗi container trỏ đến ip này

Chi tiết cấu hình từng service bên dưới.

keystone
=======
Docker build -t keystone Dockerjuno/Keystone

Docer run -i -t --name keystone -h keystone -p 10.2.100.4:5000:5000 -p 10.2.100.4:35357:35357 keystone bash

Sau khi build edit file hosts trỏ tới proxy

10.2.100.17         proxy


Glance
====
Docker build -t glance Docker-junu/Glance

Docker run -i -t --name glance -h glance -p 10.2.100.4:9292:9292 glance bash

Sau khi build edit file hosts trỏ tới proxy

10.2.100.17         proxy

Các service khác tương tự.
====
