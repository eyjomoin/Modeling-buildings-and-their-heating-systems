within FPSS.Parameter.Building;
record Building_1977_refurb "Modified parameter for the house"
  extends Building_base(
  Vzone           = 392.9,
  T_zone_start    = 273.15+20,
  T_ground        = 273.15+10,
  
  A_wall          = 177.6,
  dWall           = 0.365,
  hWall           = 7.69,
  kWall           = 0.133,
  rhoWall         = 485,
  cpWall          = 1000,
  UWall           = 0.22,
  
  A_ground        = 78.3,
  dground         = 0.3,
  hground         = 5.88,
  kground         = 2.3*0.2,
  rhoground       = 2400,
  cpground        = 880,
  Uground         = 0.28,
  b_soil          = 0.5,
  
  A_roof          = 183.1,
  droof           = 0.16,
  hroof           = 10,
  kroof           = 0.18,
  rhoroof         = 55,
  cproof          = 1450,
  Uroof           = 0.18,
  
  A_window        = 34.2,
  dWindow         = 0.006,
  hWindow         = 7.69,
  kWindow         = 0.133,
  rhoWindow       = 2500,
  cpWindow        = 1000,
  UWindow         = 1.30);
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "Parameter_building");
end Building_1977_refurb;
