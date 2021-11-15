qemu-img create wot.img -f qcow2 8G
qemu-system-x86_64 -hda wot.img -cdrom archiso.iso -boot d -m 2G -smp 4