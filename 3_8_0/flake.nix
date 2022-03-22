{
  description = ''Winim - Nim's Windows API and COM Library'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-winim-3_8_0.flake = false;
  inputs.src-winim-3_8_0.owner = "khchen";
  inputs.src-winim-3_8_0.ref   = "3_8_0";
  inputs.src-winim-3_8_0.repo  = "winim";
  inputs.src-winim-3_8_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-winim-3_8_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-winim-3_8_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}