within FPSS.Parameter.Building;
record Building_1948 "Modified parameter for the house"
  extends Building_base(
  Vzone           = 365.17,
  T_zone_start    = 273.15+20,
  T_ground        = 273.15+2,
  
  A_wall          = 108.25,
  dWall           = 0.365,
  hWall           = 7.69,
  kWall           = 0.133,
  rhoWall         = 485,
  cpWall          = 1000,
  UWall           = 1.70,
  
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
  Uroof           = 1.40,
  
  A_window        = 2,
  dWindow         = 0.006,
  hWindow         = 7.69,
  kWindow         = 0.133,
  rhoWindow       = 485,
  cpWindow        = 1000,
  UWindow         = 0.77);
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "Parameter_building");
end Building_1948;
