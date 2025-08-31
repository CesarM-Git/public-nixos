networking.hostName = "Nix-Home"; # Define your hostname.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.networks = {
    "DNS" = {
      #psk = "temppass123";
      pskRaw = "ext:wifi_temp_password";
      hidden = true;
      priority = 1;
      #  extraConfig = "key_mgmt=SAE scan_ssid=1";
     };
  };
