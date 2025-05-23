within FPSS.Parameter.TGA2;
record P_one_zone_start
  extends FPSS.Parameter.BaseRecords.TGA_Base_Record(
  scaling_factor_HP  =  0.5,
  mflow_prim_min     = 0.01,
  mflow_prim_max     = 1,
  mflow_sec_min      = 0.01,
  mflow_sec_max      = 0.8,
  T_source           = 273.15+10,
  T_room_set         = 273.15+20,
  T_sup_nom          = 273.15+60,
  T_ret_nom          = 273.15+40,
  DeltaT_prim        = 4,
  Qflow_max          = 9000,
  dp_pump            = 2000,
  p_prim             = 200000,
  p_sec              = 200000,
  T_HC_1_amb         = 273.15-10,
  T_HC_1_sup         = 273.15+62,
  T_HC_2_amb         = 273.15+20,
  T_HC_2_sup         = 273.15+20);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end P_one_zone_start;
