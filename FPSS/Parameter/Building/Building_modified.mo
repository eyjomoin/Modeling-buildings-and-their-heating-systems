within FPSS.Parameter.Building;
record Building_modified "Modified parameter for the house"
  extends Building_base(
  Vzone           =  365.17,
  T_zone_start    = 273.15+20,
  T_ground        = 273.15+2,
  A_wall          = 108.25,
  dWall           = 0.365,
  hWall           = 2,
  kWall           = 0.133,
  rhoWall         = 485,
  cpWall          = 1000,
  UWall           = 0.25,
  A_ground        = 74.71,
  dground         = 0.3,
  hground         = 2,
  kground         = 2.3*0.2,
  rhoground       = 2400,
  cpground        = 880,
  Uground         = 0.3,
  A_roof          = 108,
  droof           = 0.16,
  hroof           = 2,
  kroof           = 0.18,
  rhoroof         = 55,
  cproof          = 1450,
  Uroof           = 0.45);
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "Parameter_building");
end Building_modified;
