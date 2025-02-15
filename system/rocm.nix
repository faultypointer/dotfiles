{ pkgs, ... }: {
  hardware.amdgpu.opencl.enable = true;

  systemd.tmpfiles.rules =
    [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];

  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr
    rocmPackages.rpp
    rocmPackages.rocm-smi
  ];

  environment.systemPackages = with pkgs; [ rocmPackages.clr clinfo ];
}
