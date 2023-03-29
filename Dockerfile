FROM fedora:latest
RUN sudo dnf install -y qemu-system-x86 unzip
#RUN curl -O https://memtest.org/download/v6.10/mt86plus_6.10_64.iso.zip && unzip mt86plus_6.10_64.iso.zip
ADD disk.img /disk.img
ADD cmd.sh .
CMD bash cmd.sh
