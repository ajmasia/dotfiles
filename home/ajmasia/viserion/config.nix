let
  username = "ajmasia";
  homeDirectory = "/home/${username}";
  configDirectory = "${homeDirectory}/.config";

  userDescription = "Antonio José Masiá";
  devEmail = "dev@ajmasia.me";
  contactEmail = "hello@ajmasia.me";
  privateMail = "antoniojosemasia@icloud.com";
in
{
  inherit username userDescription homeDirectory configDirectory;

  gitName = userDescription;
  gitEmail = devEmail;

  terminal = "alacritty";
  browser = "firefox";
}
