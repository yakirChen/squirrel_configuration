
```bash
docker pull pingcap/tidb:latest
docker pull pingcap/tikv:latest
docker pull pingcap/pd:latest

# # pd
# docker run -d --name pd1 \
#   -p 2379:2379 \
#   -p 2380:2380 \
#   -v /Volumes/To/repos/docker/localtime:/etc/localtime:ro \
#   -v /Volumes/To/repos/docker/tidb/data:/data \
#   pingcap/pd:latest \
#   --name="pd1" \
#   --data-dir="/data/pd1" \
#   --client-urls="http://0.0.0.0:2379" \
#   --advertise-client-urls="http://192.168.1.101:2379" \
#   --peer-urls="http://0.0.0.0:2380" \
#   --advertise-peer-urls="http://192.168.1.101:2380" \
#   --initial-cluster="pd1=http://192.168.1.101:2380"
  
# # tikv
# docker run -d --name tikv1 \
#   -p 20160:20160 \
#   --ulimit nofile=1000000:1000000 \
#   -v /Volumes/To/repos/docker/localtime:/etc/localtime:ro \
#   -v /Volumes/To/repos/docker/tidb/data:/data \
#   pingcap/tikv:latest \
#   --addr="0.0.0.0:20160" \
#   --advertise-addr="127.0.0.1:20160" \
#   --data-dir="/data/tikv1" \
#   --pd="192.168.1.101:2379"
  
# tidb
docker run -d --name tidb \
  -p 4000:4000 \
  -p 10080:10080 \
  -v /Volumes/To/repos/docker/localtime:/etc/localtime:ro \
  -v /Volumes/To/repos/docker/tidb/data:/data \
  pingcap/tidb:latest
  
mysql -h 127.0.0.1 -P 4000 -u root -D test --prompt="tidb> " --default-character-set utf8
```