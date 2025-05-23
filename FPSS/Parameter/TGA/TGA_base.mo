within FPSS.Parameter.TGA;
record TGA_base "base record for buildings parameter"
extends Modelica.Icons.Record;

  parameter Real scaling_factor_HP=0.5 "scaling factor for Heatpump(With scaling_factor_HP=2, a 6kW heat pump becomes a 12kW heat pump)";

  parameter Modelica.Units.SI.MassFlowRate mflow_prim_min=0.01 "minimum mass flow rate in primary circuit";
  parameter Modelica.Units.SI.MassFlowRate mflow_prim_max=1 "maximum mass flow rate in primary circuit";
  parameter Modelica.Units.SI.MassFlowRate mflow_sec_min=0.01 "minimum mass flow rate in secondary circuit";
  parameter Modelica.Units.SI.MassFlowRate mflow_sec_max=0.4 "maximum mass flow rate in secondary circuit (Maximum Value found in data was 0.982 m3/h = 0.278233 kg/s)";

  parameter Modelica.Units.SI.Temperature T_source=273.15+10 "Temperature of the source";
  parameter Modelica.Units.SI.Temperature T_room_set=273.15+20 "Set temperature for the room";
  parameter Modelica.Units.SI.Temperature T_sup_nom=273.15+60 "supply temperature at nominal condition";
  parameter Modelica.Units.SI.Temperature T_ret_nom=273.15+40 "return temperature at nominal condition";

  parameter Modelica.Units.SI.TemperatureDifference DeltaT_prim=4 "Delta T between supply and return in primary circuit";

  parameter Modelica.Units.SI.HeatFlowRate Qflow_max=2000 "Maximum possible heating power delivered to room by heating system in nominal condition";

  parameter Modelica.Units.SI.PressureDifference dp_pump=2000 "pressure raise delivered by the pump";
  parameter Modelica.Units.SI.Pressure p_prim=200000 "pressure of the primary circuit";
  parameter Modelica.Units.SI.Pressure p_sec=200000 "pressure of the secondary circuit";

  parameter Modelica.Units.SI.Temperature T_HC_1_amb=273.15-10 "ambient temperature at first setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_1_sup=273.15+50 "supply temperature at first setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_2_amb=273.15+20 "ambient temperature at second setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_2_sup=273.15+20 "ambient temperature at second setpoint of the Heating Curve";

annotation (
    defaultComponentPrefixes = "parameter",
    defaultComponentName = "Parameter_TGA");
end TGA_base;
