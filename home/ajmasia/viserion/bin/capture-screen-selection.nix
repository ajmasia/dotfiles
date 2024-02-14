{ pkgs }:

pkgs.writeShellScriptBin "capture-screen-selection" ''
  grim -g "$(slurp)" - | swappy -f -
''

