let
  userName = "ajmasia";
  homeDirectory = "/home/${userName}";
  configDirectory = "${homeDirectory}/.config";

  userDescription = "Antonio José Masiá";
  devEmail = "dev@ajmasia.me";
  contactEmail = "hello@ajmasia.me";
  privateMail = "antoniojosemasia@icloud.com";
in
{
  userName = userName;
  userDescription = userDescription;
  homeDirectory = homeDirectory;
  configDirectory = configDirectory;

  gitName = userDescription;
  gitEmail = devEmail;

  terminal = "kitty";
  browser = "firefix";
}
