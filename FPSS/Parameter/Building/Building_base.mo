within FPSS.Parameter.Building;
record Building_base "base record for buildings parameter"
extends Modelica.Icons.Record;

parameter Modelica.Units.SI.Volume Vzone=365.17 "Volume of the air in the house";
parameter Modelica.Units.SI.Temperature T_ground=273.15+10 "Temperature of the ground";
parameter Modelica.Units.SI.Temperature T_zone_start= 273.15+20 "Air and thermal mass starting temperature of the building";

parameter Modelica.Units.SI.Area A_wall=108.25 "Area of outer walls";
parameter Modelica.Units.SI.Length dWall=0.365 "Thickness of outer Walls";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer hWall=7.69 "Indoor convective heat transfer coefficient at the wall";
parameter Modelica.Units.SI.ThermalConductivity kWall=0.133 "Wall thermal conductivity";
parameter Modelica.Units.SI.Density rhoWall=485 "Wall density";
parameter Modelica.Units.SI.SpecificHeatCapacity cpWall=1000 "Wall specific heat capacity";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer UWall=0.25 "Overall heat transfer coefficient of the wall";

parameter Modelica.Units.SI.Area A_ground=74.71 "Area of ground";
parameter Modelica.Units.SI.Length dground=0.3 "Thickness of ground";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer hground=5.88 "Indoor Convective heat transfer coefficient at the ground";
parameter Modelica.Units.SI.ThermalConductivity kground=2.3 "ground thermal conductivity";
parameter Modelica.Units.SI.Density rhoground=2400 "ground density";
parameter Modelica.Units.SI.SpecificHeatCapacity cpground=880 "ground specific heat capacity";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer Uground=0.3 "Overall heat transfer coefficient of the ground";
parameter Real b_soil=0.5 "Adjustment factor for soil: 0.5 -> heat transfer through gound plate depends on the property of the soil. This factor describes the heat transfer properties of the soil";
parameter Modelica.Units.SI.Area A_floor_reference_area=187;

parameter Modelica.Units.SI.Area A_roof=108 "Area of roof";
parameter Modelica.Units.SI.Length droof=0.16 "Thickness of roof";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer hroof=10 "Indoor Convective heat transfer coefficient at the roof";
parameter Modelica.Units.SI.ThermalConductivity kroof=0.18 "roof thermal conductivity";
parameter Modelica.Units.SI.Density rhoroof=55 "roof density";
parameter Modelica.Units.SI.SpecificHeatCapacity cproof=1450 "roof specific heat capacity";
parameter Modelica.Units.SI.CoefficientOfHeatTransfer Uroof=0.4 "Overall heat transfer coefficient of the roof";
parameter Modelica.Units.SI.Area A_floor_reference_area = 187;

parameter Modelica.Units.SI.Area A_window=0;
parameter Modelica.Units.SI.Length dWindow=0;
parameter Modelica.Units.SI.CoefficientOfHeatTransfer hWindow=0;
parameter Modelica.Units.SI.ThermalConductivity kWindow=0;
parameter Modelica.Units.SI.Density rhoWindow=0; 
parameter Modelica.Units.SI.SpecificHeatCapacity cpWindow=0;
parameter Modelica.Units.SI.CoefficientOfHeatTransfer UWindow=0;


annotation (
    defaultComponentPrefixes = "parameter",
    defaultComponentName = "Parameter_building");
end Building_base;
