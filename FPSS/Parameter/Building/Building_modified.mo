within FPSS.Parameter.Building;
record Building_modified "Modified parameter for the house"
  extends Building_base(
  Vzone           =  365.17,
  T_zone_start    = 273.15+20,
  T_ground        = 273.15+2,
  A_wall_in       = 125.9,
  dWall_in        = 0.015,
  hWall_in        = 2,
  kWall_in        = 0.25,
  rhoWall_in      = 1100,
  cpWall_in       = 960,
  A_wall_out      = 108.25,
  dWall_out       = 0.365,
  hWall_out       = 2,
  kWall_out       = 0.133,
  rhoWall_out     = 485,
  cpWall_out      = 1000,
  A_ground        = 74.71,
  dground         = 0.3,
  hground         = 2,
  kground         = 2.3*0.2,
  rhoground       = 2400,
  cpground        = 880,
  A_roof          = 108,
  droof           = 0.16,
  hroof           = 2,
  kroof           = 0.18,
  rhoroof         = 55,
  cproof          = 1450);
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "Parameter_building");
end Building_modified;
