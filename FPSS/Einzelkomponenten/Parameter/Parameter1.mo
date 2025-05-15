within FPSS.Einzelkomponenten.Parameter;
record Parameter1
  extends Modelica.Icons.Record;
  parameter Modelica.Units.SI.HeatFlowRate QHea_flow_nominal = 6000 "Nominal capacity of heating system";
  parameter Modelica.Units.SI.MassFlowRate mWat_flow_nominal = 1 "Nominal mass flow rate for water loop";
  parameter Modelica.Units.SI.MassFlowRate mWat_flow_prim_nominal = 0.3 "Nominal mass flow rate of primary circuit";
  parameter Modelica.Units.SI.MassFlowRate mWat_flow_sec_nominal = 3.2 "Nominal mass flow rate of secondary circuit";
  // tbd:In Exp.2: 0,03 < mflowprim < 0,3 -- 2,8 < mflwosec < 3,2
  parameter Modelica.Units.SI.MassFlowRate mAir_flow_nominal = 2 "Nominal mass flow rate for air loop";
  parameter Modelica.Units.SI.Volume VZone = 350 "Zone volume: 9.57*7.75*5=370m³ minus walls and ceilings V approx 350m³";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer hWall = 2 "Convective heat transfer coefficient at the wall";
  parameter Modelica.Units.SI.Area AWall = 300 "Wall area: 9.57*5*2+7.75*5*2=173.2 plus roof plus ground";
  parameter Modelica.Units.SI.Length dWall = 0.1 "Wall thickness: should be 0.365";
  parameter Modelica.Units.SI.ThermalConductivity kWall = 0.133 "Wall thermal conductivity";
  parameter Modelica.Units.SI.Density rhoWall = 485 "Wall density";
  parameter Modelica.Units.SI.SpecificHeatCapacity cpWall = 1000 "Wall specific heat capacity";
  //  parameter Modelica.Units.SI.Temperature
  //T_vor_nominal
  //T_rueck_nominal
  //tau1
  //tau2
  //dp1_hp_nominal
  //dp2_hp_nominal
  //m_pump_flow_nominal
  //T_sink
end Parameter1;
