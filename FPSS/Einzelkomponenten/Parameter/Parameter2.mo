within FPSS.Einzelkomponenten.Parameter;
record Parameter2
  extends Modelica.Icons.Record;
  outer parameter Modelica.Units.SI.HeatFlowRate QHea_flow_nominal = 6000 "Nominal capacity of heating system";
  outer parameter Modelica.Units.SI.MassFlowRate mWat_flow_nominal = 1 "Nominal mass flow rate for water loop";
  outer parameter Modelica.Units.SI.MassFlowRate mWat_flow_prim_nominal = 0.3 "Nominal mass flow rate of primary circuit";
  outer parameter Modelica.Units.SI.MassFlowRate mWat_flow_sec_nominal = 3.2 "Nominal mass flow rate of secondary circuit";
  // tbd:In Exp.2: 0,03 < mflowprim < 0,3 -- 2,8 < mflwosec < 3,2
  outer parameter Modelica.Units.SI.MassFlowRate mAir_flow_nominal = 2 "Nominal mass flow rate for air loop";
  outer parameter Modelica.Units.SI.Volume VZone = 350 "Zone volume: 9.57*7.75*5=370m³ minus walls and ceilings V approx 350m³";
  outer parameter Modelica.Units.SI.CoefficientOfHeatTransfer hWall = 2 "Convective heat transfer coefficient at the wall";
  outer parameter Modelica.Units.SI.Area AWall = 300 "Wall area: 9.57*5*2+7.75*5*2=173.2 plus roof plus grund";
  outer parameter Modelica.Units.SI.Length dWall = 0.1 "Wall thickness: should be 0.365";
  outer parameter Modelica.Units.SI.ThermalConductivity kWall = 0.133 "Wall thermal conductivity";
  outer parameter Modelica.Units.SI.Density rhoWall = 485 "Wall density";
  outer parameter Modelica.Units.SI.SpecificHeatCapacity cpWall = 1000 "Wall specific heat capacity";
  //  parameter Modelica.Units.SI.Temperature
  //T_vor_nominal
  //T_rueck_nominal
  //tau1
  //tau2
  //dp1_hp_nominal
  //dp2_hp_nominal
  //m_pump_flow_nominal
  //T_sink
end Parameter2;
