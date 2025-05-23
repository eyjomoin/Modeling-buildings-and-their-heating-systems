within FPSS.components.House;
model house_one_zone_simple
  package MediumAir = AixLib.Media.Air "Medium model for air";

  replaceable parameter FPSS.Parameter.Building.Building_base
    Parameter_building annotation(
    Placement(transformation(origin = {130, 110}, extent = {{-10, -10}, {10, 10}}))) constrainedby FPSS.Parameter.Building.Building_base
    annotation (choicesAllMatching=true, Placement(transformation(origin={0,50},
          extent={{-10,-10},{10,10}})));


  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R1 annotation (
    Placement(transformation(extent = {{-128, -68}, {-113, -53}}), iconTransformation(extent={{-104,14},
            {-89,29}})));
  AixLib.Utilities.Interfaces.RadPort rad_R1 annotation (
    Placement(transformation(extent = {{-128, 68}, {-113, 83}}), iconTransformation(extent={{-102,86},
            {-87,101}})));
  Modelica.Blocks.Interfaces.RealOutput T_Room1(unit = "K") annotation (
    Placement(transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin={-96,-70},     extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor walCap_wall(C=
        Parameter_building.A_wall_in*Parameter_building.dWall_in*
        Parameter_building.cpWall_in*Parameter_building.rhoWall_in +
        Parameter_building.A_wall_out*Parameter_building.dWall_out*
        Parameter_building.cpWall_out*Parameter_building.rhoWall_out, T(start=
          Parameter_building.T_zone_start - 1, fixed=true))
    "Thermal mass of walls" annotation (Placement(transformation(origin={27,45},
          extent={{-13,-13},{13,13}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor walRes_wall(R=
        Parameter_building.dWall_out/Parameter_building.A_wall_out/
        Parameter_building.kWall_out) "Thermal resistor for outer wall"
    annotation (Placement(transformation(
        origin={4,-3},
        extent={{66,-11},{88,11}},
        rotation=90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor conRes_wall(R=1/
        Parameter_building.hWall_in/(Parameter_building.A_wall_in +
        Parameter_building.A_wall_out))
    "Thermal resistance for convective heat transfer to outer wall"
    annotation (Placement(transformation(
        origin={27,-11},
        extent={{-11,-11},{11,11}},
        rotation=90)));
  AixLib.Fluid.MixingVolumes.MixingVolume zon(redeclare package Medium = MediumAir, V = Parameter_building.Vzone, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_nominal = 2, T_start = Parameter_building.T_zone_start) "Very simple zone air model" annotation (
    Placement(transformation(origin = {-96, -95}, extent = {{208, 65}, {234, 39}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTemZonAir annotation (
    Placement(transformation(origin = {-72, 116}, extent = {{120, 170}, {100, 190}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_amb annotation (
    Placement(transformation(origin={-90,100},   extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor walCap_roof(C = Parameter_building.A_roof*Parameter_building.droof*Parameter_building.cproof*Parameter_building.rhoroof, T(start=
          Parameter_building.T_zone_start - 1, fixed=true))                                                                                                                                                                                 "Thermal mass of roof" annotation (
    Placement(transformation(origin = {83, 45}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor conRes_roof(R = 1/Parameter_building.hroof/(Parameter_building.A_roof))
    "Thermal resistance for convective heat transfer to roof"                                                                                                                           annotation (
    Placement(transformation(origin = {83, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor walRes_roof(R = Parameter_building.droof/Parameter_building.A_roof/Parameter_building.kroof) "Thermal resistor for outer roof" annotation (
    Placement(transformation(origin = {60, -3}, extent = {{66, -11}, {88, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor walCap_ground(C = Parameter_building.A_ground*Parameter_building.dground*Parameter_building.cpground*Parameter_building.rhoground, T(start=
          Parameter_building.T_zone_start - 1, fixed=true))                                                                                                                                                                                           "Thermal mass of groundplate" annotation (
    Placement(transformation(origin = {-27, 45}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor walRes_ground(R = Parameter_building.dground/Parameter_building.A_ground/Parameter_building.kground)
    "Thermal resistor for outer wall"                                                                                                                                                             annotation (
    Placement(transformation(origin = {-50, -3}, extent = {{66, -11}, {88, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_ground annotation (
    Placement(transformation(origin = {-72, 142}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_ground(k = Parameter_building.T_ground) annotation (
    Placement(transformation(origin = {-106, 142}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor conRes_ground(R = 1/Parameter_building.hground/(Parameter_building.A_ground))
    "Thermal resistance for convective heat transfer to ground plate"                                                                                                                                 annotation (
    Placement(transformation(origin = {-27, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_wall(unit="W") = walRes_wall.Q_flow
    annotation (Placement(transformation(
        origin={6,-130},
        extent={{-10,-10},{10,10}},
        rotation=270), iconTransformation(
        origin={4,-98},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_roof(unit = "W") = walRes_roof.Q_flow annotation (
    Placement(transformation(origin = {64, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin={-22,-98},     extent = {{10, -10}, {-10, 10}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_ground(unit = "W") = walRes_ground.Q_flow annotation (
    Placement(transformation(origin = {-36, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin={-50,-98},     extent = {{10, -10}, {-10, 10}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_total(unit = "W") = walRes_ground.Q_flow +
    walRes_wall.Q_flow                                                                                      + walRes_roof.Q_flow "total heat loss of the building" annotation (
    Placement(transformation(origin = {112, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin={34,-98},      extent = {{10, -10}, {-10, 10}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealInput T_ambb(unit = "K") annotation (
    Placement(transformation(origin = {-132, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 180), iconTransformation(origin = {0, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor_rad_ground
    annotation (Placement(transformation(origin={10,-46}, extent={{-110,66},{-90,
            86}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor_rad_wall
    annotation (Placement(transformation(origin={10,-66}, extent={{-110,66},{-90,
            86}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor_rad_roof
    annotation (Placement(transformation(origin={10,-86}, extent={{-110,66},{-90,
            86}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor res_rad_ground(R= 0.02)
    "Thermal resistance for radiative heat transfer to ground plate"                                                                                                                         annotation (
    Placement(transformation(origin={-112,30},   extent={{36,-6},{48,6}},        rotation=0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor res_rad_roof(R= 0.02)
    "Thermal resistance for radiative heat transfer to roof" annotation (
      Placement(transformation(
        origin={12,10},
        extent={{36,-6},{48,6}},
        rotation=0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor res_rad_wall(R= 0.02)
    "Thermal resistance for radiative heat transfer to wall" annotation (
      Placement(transformation(
        origin={-48,20},
        extent={{36,-6},{48,6}},
        rotation=0)));
equation
  connect(zon.heatPort, senTemZonAir.port) annotation (
    Line(points = {{112, -43}, {100, -43}, {100, -8}, {108, -8}, {108, -4}}, color = {191, 0, 0}));
  connect(conRes_wall.port_b, walCap_wall.port)
    annotation (Line(points={{27,0},{27,32}}, color={191,0,0}));
  connect(conRes_wall.port_a, zon.heatPort) annotation (Line(points={{27,-22},{28,
          -22},{28,-43},{112,-43}}, color={191,0,0}));
  connect(conRes_roof.port_a, zon.heatPort) annotation (
    Line(points = {{83, -22}, {84, -22}, {84, -43}, {112, -43}}, color = {191, 0, 0}));
  connect(walCap_roof.port, walRes_roof.port_a) annotation (
    Line(points = {{83, 32}, {60, 32}, {60, 63}}, color = {191, 0, 0}));
  connect(walRes_wall.port_a, walCap_wall.port)
    annotation (Line(points={{4,63},{4,32},{27,32}}, color={191,0,0}));
  connect(T_amb.port, walRes_wall.port_b)
    annotation (Line(points={{-80,100},{4,100},{4,85}}, color={191,0,0}));
  connect(walCap_ground.port, walRes_ground.port_a) annotation (
    Line(points = {{-27, 32}, {-50, 32}, {-50, 63}}, color = {191, 0, 0}));
  connect(walRes_ground.port_b, T_ground.port) annotation (
    Line(points = {{-50, 85}, {-50, 142}, {-62, 142}}, color = {191, 0, 0}));
  connect(const_ground.y, T_ground.T) annotation (
    Line(points = {{-95, 142}, {-84, 142}}, color = {0, 0, 127}));
  connect(conRes_ground.port_a, zon.heatPort) annotation (
    Line(points = {{-27, -22}, {-26, -22}, {-26, -43}, {112, -43}}, color = {191, 0, 0}));
  connect(conRes_ground.port_b, walCap_ground.port) annotation (
    Line(points = {{-27, 0}, {-26, 0}, {-26, 32}, {-27, 32}}, color = {191, 0, 0}));
  connect(conv_R1, zon.heatPort) annotation (Line(points={{-120.5,-60.5},{100,-60.5},
          {100,-43},{112,-43}}, color={191,0,0}));
  connect(conRes_roof.port_b, walCap_roof.port)
    annotation (Line(points={{83,0},{83,0},{83,32}}, color={191,0,0}));
  connect(rad_R1, heatFlowSensor_rad_ground.port_a) annotation (Line(points={{-120.5,
          75.5},{-110,75.5},{-110,30},{-100,30}}, color={0,0,0}));
  connect(rad_R1, heatFlowSensor_rad_wall.port_a) annotation (Line(points={{-120.5,
          75.5},{-110,75.5},{-110,10},{-100,10}}, color={0,0,0}));
  connect(rad_R1, heatFlowSensor_rad_roof.port_a) annotation (Line(points={{-120.5,
          75.5},{-110,75.5},{-110,-10},{-100,-10}}, color={0,0,0}));
  connect(T_ambb, T_amb.T)
    annotation (Line(points={{-132,100},{-102,100}}, color={0,0,127}));
  connect(T_amb.port, walRes_roof.port_b)
    annotation (Line(points={{-80,100},{60,100},{60,85}}, color={191,0,0}));
  connect(senTemZonAir.T, T_Room1) annotation (Line(points={{108,17},{108,20},{
          128,20},{128,0},{150,0}}, color={0,0,127}));
  connect(heatFlowSensor_rad_ground.port_b, res_rad_ground.port_a)
    annotation (Line(points={{-80,30},{-76,30}}, color={191,0,0}));
  connect(res_rad_ground.port_b, walCap_ground.port)
    annotation (Line(points={{-64,30},{-27,30},{-27,32}}, color={191,0,0}));
  connect(heatFlowSensor_rad_wall.port_b, res_rad_wall.port_a) annotation (Line(
        points={{-80,10},{-66,10},{-66,20},{-12,20}}, color={191,0,0}));
  connect(res_rad_wall.port_b, walCap_wall.port)
    annotation (Line(points={{0,20},{27,20},{27,32}}, color={191,0,0}));
  connect(heatFlowSensor_rad_roof.port_b, res_rad_roof.port_a) annotation (Line(
        points={{-80,-10},{-60,-10},{-60,10},{48,10}}, color={191,0,0}));
  connect(res_rad_roof.port_b, walCap_roof.port)
    annotation (Line(points={{60,10},{83,10},{83,32}}, color={191,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 120}}), graphics={  Rectangle(fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-80, 54}, {80, -86}}), Polygon(origin = {-10, 84}, fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, points = {{-80, -30}, {100, -30}, {10, 30}, {-80, -30}, {-80, -30}}), Rectangle(origin = {51, -63}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -23}, {15, 23}}), Rectangle(origin = {-39, 6}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-21, 18}, {21, -18}}), Rectangle(origin = {38, 6}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-22, 18}, {22, -18}})}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 120}})),
  Documentation(info="<html>
<p>Simple Model for a house. The convective heat is directly transfered to the air volume called zon. The radiative heat is transferred to the thermal mass consisting of walls, roof and ground plate. Between thermal mass and air is heat transfer, as well as between thermal mass and ambient air and thermal mass and earth.</p>
<p>The house temperature is measured with the help of senTemZonAir.</p>
</html>"));
end house_one_zone_simple;
