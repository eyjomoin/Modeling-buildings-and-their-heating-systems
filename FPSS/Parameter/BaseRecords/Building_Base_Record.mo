within FPSS.Parameter.BaseRecords;
record Building_Base_Record "Base record definition for TGA records"
  extends Modelica.Icons.Record;

  parameter Modelica.Units.SI.Volume Vzone "Volume of the air in the house";
  parameter Modelica.Units.SI.Temperature T_ground "Temperature of the ground";

  parameter Modelica.Units.SI.Area A_wall_in "Area of internal walls";
  parameter Modelica.Units.SI.Length dWall_in "Thickness of internal Walls";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer hWall_in "Convective heat transfer coefficient at the inner wall";
  parameter Modelica.Units.SI.ThermalConductivity kWall_in "inner Wall thermal conductivity";
  parameter Modelica.Units.SI.Density rhoWall_in "inner Wall density";
  parameter Modelica.Units.SI.SpecificHeatCapacity cpWall_in "inner Wall specific heat capacity";

  parameter Modelica.Units.SI.Area A_wall_out "Area of outer walls";
  parameter Modelica.Units.SI.Length dWall_out "Thickness of outer Walls";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer hWall_out "Convective heat transfer coefficient at the outer wall";
  parameter Modelica.Units.SI.ThermalConductivity kWall_out "outer Wall thermal conductivity";
  parameter Modelica.Units.SI.Density rhoWall_out "outer Wall density";
  parameter Modelica.Units.SI.SpecificHeatCapacity cpWall_out "outer Wall specific heat capacity";

  parameter Modelica.Units.SI.Area A_ground "Area of ground";
  parameter Modelica.Units.SI.Length dground "Thickness of ground";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer hground "Convective heat transfer coefficient at the ground";
  parameter Modelica.Units.SI.ThermalConductivity kground "ground thermal conductivity";
  parameter Modelica.Units.SI.Density rhoground "ground density";
  parameter Modelica.Units.SI.SpecificHeatCapacity cpground "ground specific heat capacity";

  parameter Modelica.Units.SI.Area A_roof "Area of roof";
  parameter Modelica.Units.SI.Length droof "Thickness of roof";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer hroof "Convective heat transfer coefficient at the roof";
  parameter Modelica.Units.SI.ThermalConductivity kroof "roof thermal conductivity";
  parameter Modelica.Units.SI.Density rhoroof "roof density";
  parameter Modelica.Units.SI.SpecificHeatCapacity cproof "roof specific heat capacity";

  parameter Modelica.Units.SI.Temperature T_zone_start "Air and thermal mass starting temperature of the building";
   annotation (    defaultComponentPrefixes = "parameter",
    defaultComponentName = "Parameter_building", Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Building_Base_Record;
