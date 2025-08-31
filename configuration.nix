networking.hostName = "Nix-Home"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.networks = {
    "DNS" = {
      pskRaw = "ext:wifi_temp_password";
      hidden = true;
      priority = 1;
     };
  };
