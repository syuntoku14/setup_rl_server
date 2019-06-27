docker run -it --rm \
--net=host \
--entrypoint=/bin/bash \
-v /home/syuntoku14/setup_rl_server:/root/setup_rl_server \
syuntoku/opensim:latest
