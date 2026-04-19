{
  ...
}: let 
  kernel = "/var/pxe/bzImage";
  initrd = "/var/pxe/initrd.img";
in {
  services.pixiecore = {
    enable = true;

    openFirewall = true;
    dhcpNoBind = true;
    debug = true;

    kernel = kernel;
    initrd = initrd;

    cmdLine = "console=ttyS0 loglevel=4 init=/init root=/dev/ram0 rw";
  };
}