within FPSS.Parameter.Building;
record Building_modified "Modified parameter for the house"
  extends Building_base(
  Vzone           =  365.17,
  T_zone_start    = 273.15+20,
  T_ground        = 273.15+2,
  A_wall          = 144.9,
  dWall           = 0.365,
  hWall           = 7.69,
  kWall           = 0.133,
  rhoWall         = 485,
  cpWall          = 1000,
  UWall           = 1.7,
  A_ground        = 52.4,
  dground         = 0.3,
  hground         = 5.88,
  kground         = 2.3*0.2,
  rhoground       = 2400,
  cpground        = 880,
  Uground         = 0.77,
  b_soil          = 0.5,
  A_roof          = 235.3,
  droof           = 0.16,
  hroof           = 10,
  kroof           = 0.18,
  rhoroof         = 55,
  cproof          = 1450,
  Uroof           = 1.4);
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "Parameter_building");
end Building_modified;
