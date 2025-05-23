within FPSS.Parameter.Building;
record Building_base "base record for buildings parameter"
extends Modelica.Icons.Record;

parameter Modelica.Units.SI.Volume Vzone=365.17 "Volume of the air in the house";
parameter Modelica.Units.SI.Temperature T_ground=273.15+10 "Temperature of the ground";

parameter Modelica.Units.SI.Area A_wall_in=125.9 "Area of internal walls";
parameter Modelica.Units.SI.Length dWall_in=0.015 "Thickness of internal Walls";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer hWall_in=2 "Convective heat transfer coefficient at the inner wall";
parameter Modelica.Units.SI.ThermalConductivity kWall_in=0.25 "inner Wall thermal conductivity";
parameter Modelica.Units.SI.Density rhoWall_in=1100 "inner Wall density";
parameter Modelica.Units.SI.SpecificHeatCapacity cpWall_in=960 "inner Wall specific heat capacity";

parameter Modelica.Units.SI.Area A_wall_out=108.25 "Area of outer walls";
parameter Modelica.Units.SI.Length dWall_out=0.365 "Thickness of outer Walls";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer hWall_out=2 "Convective heat transfer coefficient at the outer wall";
parameter Modelica.Units.SI.ThermalConductivity kWall_out=0.133 "outer Wall thermal conductivity";
parameter Modelica.Units.SI.Density rhoWall_out=485 "outer Wall density";
parameter Modelica.Units.SI.SpecificHeatCapacity cpWall_out=1000 "outer Wall specific heat capacity";

parameter Modelica.Units.SI.Area A_ground=74.71 "Area of ground";
parameter Modelica.Units.SI.Length dground=0.3 "Thickness of ground";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer hground=2 "Convective heat transfer coefficient at the ground";
parameter Modelica.Units.SI.ThermalConductivity kground=2.3 "ground thermal conductivity";
parameter Modelica.Units.SI.Density rhoground=2400 "ground density";
parameter Modelica.Units.SI.SpecificHeatCapacity cpground=880 "ground specific heat capacity";

parameter Modelica.Units.SI.Area A_roof=108 "Area of roof";
parameter Modelica.Units.SI.Length droof=0.16 "Thickness of roof";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer hroof=2 "Convective heat transfer coefficient at the roof";
parameter Modelica.Units.SI.ThermalConductivity kroof=0.18 "roof thermal conductivity";
parameter Modelica.Units.SI.Density rhoroof=55 "roof density";
parameter Modelica.Units.SI.SpecificHeatCapacity cproof=1450 "roof specific heat capacity";

parameter Modelica.Units.SI.Temperature T_zone_start= 273.15+20 "Air and thermal mass starting temperature of the building";

annotation (
    defaultComponentPrefixes = "parameter",
    defaultComponentName = "Parameter_building");
end Building_base;
