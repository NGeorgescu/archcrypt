#!/bin/bash

# replace nsg with your name

passwd && \
useradd -m -g users -G wheel,video nsg && \
passwd nsg 
