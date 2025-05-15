within FPSS.Parameter.BaseRecords;
record TGA_Base_Record "Base record definition for TGA records"
  extends Modelica.Icons.Record;

  parameter Real scaling_factor_HP "scaling factor for Heatpump(With scaling_factor_HP=2, a 6kW heat pump becomes a 12kW heat pump)";

  parameter Modelica.Units.SI.MassFlowRate mflow_prim_min "minimum mass flow rate in primary circuit";
  parameter Modelica.Units.SI.MassFlowRate mflow_prim_max "maximum mass flow rate in primary circuit";
  parameter Modelica.Units.SI.MassFlowRate mflow_sec_min "minimum mass flow rate in secondary circuit";
  parameter Modelica.Units.SI.MassFlowRate mflow_sec_max "maximum mass flow rate in secondary circuit (Maximum Value found in data was 0.982 m3/h = 0.278233 kg/s)";

  parameter Modelica.Units.SI.Temperature T_source "Temperature of the source";
  parameter Modelica.Units.SI.Temperature T_room_set "Set temperature for the room";
  parameter Modelica.Units.SI.Temperature T_sup_nom "supply temperature at nominal condition";
  parameter Modelica.Units.SI.Temperature T_ret_nom "return temperature at nominal condition";

  parameter Modelica.Units.SI.TemperatureDifference DeltaT_prim "Delta T between supply and return in primary circuit";

  parameter Modelica.Units.SI.HeatFlowRate Qflow_max "Maximum possible heating power delivered to room by heating system in nominal condition";

  parameter Modelica.Units.SI.PressureDifference dp_pump "pressure raise delivered by the pump";
  parameter Modelica.Units.SI.Pressure p_prim "pressure of the primary circuit";
  parameter Modelica.Units.SI.Pressure p_sec "pressure of the secondary circuit";

  parameter Modelica.Units.SI.Temperature T_HC_1_amb "ambient temperature at first setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_1_sup "supply temperature at first setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_2_amb "ambient temperature at second setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_2_sup "ambient temperature at second setpoint of the Heating Curve";
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));


end TGA_Base_Record;
