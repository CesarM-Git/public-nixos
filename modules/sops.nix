{ config, pkgs, lib, inputs, ... }:

{
  # Key File
  sops.age.keyFile = "../../.config/sops/age/keys.txt";
  sops.defaultSopsFile = "../secrets.yaml";

  # DDClient
  users.groups.ddclient = {};
  users.users.ddclient = {
    isSystemUser = true;
    description = "ddclient service user";
    home = "/var/lib/ddclient";
    group = "ddclient";
  };

  services.ddclient = {
    enable = true;
    package = pkgs.ddclient;
    configFile = ../ddclient.conf;
    secretsFile = config.sops.secrets.ddclient_password.path;
    extraConfig = "
      cache=/var/cache/ddclient/ddclient.cache";
  };

  sops.secrets.ddclient_password = {
    sopsFile = ../secrets.yaml;
    mode = "0440";
    format = "yaml";
    owner = "ddclient";
    group = "ddclient";
  };

  # Wifi Password
    sops.secrets.wifi_temp_password = {
    sopsFile = ../secrets.yaml;
    mode = "0440";
    format = "yaml";
  };

  networking.wireless.secretsFile = config.sops.secrets.wifi_temp_password.path;

# Wifi Password
    sops.secrets.wifi_password = {
    sopsFile = ../secrets.yaml;
    mode = "0440";
    format = "yaml";
  };

  # networking.wireless.secretsFile = config.sops.secrets.wifi_password.path;
}
