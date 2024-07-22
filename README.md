Scripts that automate LUKS/systemd-boot found [here](https://jherrlin.github.io/posts/arch-install/)

to get, run

    curl -Ls https://raw.github.com/NGeorgescu/archcrypt/main/all.tar.gz | tar -xzf -

to run, check that everything is good with

    lsblk

and then run:

    sh 0_disk_partitioning.sh /dev/<device file>

