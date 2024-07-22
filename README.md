Scripts that automate LUKS/systemd-boot found [here](https://jherrlin.github.io/posts/arch-install/)

to get, run

    curl -L0 https://github.com/NGeorgescu/archcrypt/raw/main/all.tar.gz > all.tar.gz && tar -xzf all.tar.gz 

to run, check that everything is good with

    lsblk

and then run:

    sh 0_disk_partitioning.sh /dev/<device file>

