FROM linuxserver/swag
RUN sed -i 's/os\.symlink(\_relpath.*target\[kind\])/pass#&/' /usr/lib/python3.8/site-packages/certbot/_internal/storage.py &&\
sed -i 's/with\ util\.safe\_open(archive\_target/with\ util\.safe\_open(target/' /usr/lib/python3.8/site-packages/certbot/_internal/storage.py &&\
sed -i '/if\ not\ os\.path\.islink(link)\:/!b;n;c#RemovedLogic-ChrisW' /usr/lib/python3.8/site-packages/certbot/_internal/storage.py &&\
sed -i '/#RemovedLogic-ChrisW/!b;n;c#RemovedLogic-ChrisW' /usr/lib/python3.8/site-packages/certbot/_internal/storage.py &&\
sed -i 's/if\ not\ os\.path\.islink(link)/#RemovedLogic-ChrisW/' /usr/lib/python3.8/site-packages/certbot/_internal/storage.py &&\
sed -i 's/^.*if\ not\ os\.path\.islink(link)\:/#RemovedLogic-ChrisW/' /usr/lib/python3.8/site-packages/certbot/_internal/storage.py &&\
sed -i 's/target\ =\ filesystem\.readlink(link)/target=link#&/' /usr/lib/python3.8/site-packages/certbot/_internal/storage.py &&\
sed -i 's/echo\ \"ERROR\:\ Cert\ does\ not\ exist/exit\n      echo\ \"ERROR\:\ Cert does not exist'/ /etc/cont-init.d/50-config
