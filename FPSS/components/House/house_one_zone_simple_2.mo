within FPSS.components.House;
model house_one_zone_simple_2
  package MediumAir = AixLib.Media.Air "Medium model for air";
  replaceable parameter Parameter.Building.Building_base Parameter_building annotation(
    Placement(transformation(origin = {130, 110}, extent = {{-10, -10}, {10, 10}}))) constrainedby Parameter.Building.Building_base annotation(
     choicesAllMatching = true,
     Placement(transformation(origin = {130, 110}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R1 annotation(
    Placement(transformation(extent = {{-128, -68}, {-113, -53}}), iconTransformation(extent = {{-104, 14}, {-89, 29}})));
  AixLib.Utilities.Interfaces.RadPort rad_R1 annotation(
    Placement(transformation(extent = {{-128, 68}, {-113, 83}}), iconTransformation(extent = {{-102, 86}, {-87, 101}})));
  Modelica.Blocks.Interfaces.RealOutput T_Room1(unit = "K") annotation(
    Placement(transformation(origin = {146, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-96, -70}, extent = {{10, -10}, {-10, 10}})));
  AixLib.Fluid.MixingVolumes.MixingVolume zon(redeclare package Medium = MediumAir, V = Parameter_building.Vzone, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_nominal = 2, T_start = Parameter_building.T_zone_start) "Very simple zone air model" annotation(
    Placement(transformation(origin = {-96, -111}, extent = {{208, 65}, {234, 39}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTemZonAir annotation(
    Placement(transformation(origin = {-66, 86}, extent = {{120, 170}, {100, 190}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_ground(k = Parameter_building.T_ground) annotation(
    Placement(transformation(origin = {-106, 36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_wall(unit = "W") = wall.R_cond_conv_e.port_a.Q_flow annotation(
    Placement(transformation(origin = {6, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, -98}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_roof(unit = "W") = roof.R_cond_conv_e.port_a.Q_flow annotation(
    Placement(transformation(origin = {64, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-22, -98}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_ground(unit = "W") = ground.R_cond_conv_e.port_a.Q_flow annotation(
    Placement(transformation(origin = {-36, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-50, -98}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_total(unit = "W") = Q_loss_wall+Q_loss_roof+Q_loss_ground "total heat loss of the building" annotation(
    Placement(transformation(origin = {112, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {34, -98}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput T_ambb(unit = "K") annotation(
    Placement(transformation(origin = {-124, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 180), iconTransformation(origin = {0, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  house_component_k wall(CA = Parameter_building.A_wall, Cd = Parameter_building.dWall , Ccp = Parameter_building.cpWall, Crho = Parameter_building.rhoWall, Ck = Parameter_building.kWall, Ch = Parameter_building.hWall, T_start = Parameter_building.T_zone_start)  annotation(
    Placement(transformation(origin = {-44, 90}, extent = {{-13, -12}, {13, 12}})));
  house_component_k roof(CA = Parameter_building.A_roof, Cd = Parameter_building.droof , Ccp = Parameter_building.cproof, Crho = Parameter_building.rhoroof, Ck = Parameter_building.kroof, Ch = Parameter_building.hroof, T_start = Parameter_building.T_zone_start) annotation(
    Placement(transformation(origin = {-42, 60}, extent = {{-13, -12}, {13, 12}})));
  house_component_k ground(CA = Parameter_building.A_ground, Cd = Parameter_building.dground, Ccp = Parameter_building.cpground, Crho = Parameter_building.rhoground, Ck = Parameter_building.kground, Ch = Parameter_building.hground, T_start = Parameter_building.T_zone_start) annotation(
    Placement(transformation(origin = {-42, 26}, extent = {{-13, -12}, {13, 12}})));
equation
  connect(conv_R1, zon.heatPort) annotation(
    Line(points = {{-120.5, -60.5}, {112, -60.5}, {112, -59}}, color = {191, 0, 0}));
  connect(senTemZonAir.T, T_Room1) annotation(
    Line(points = {{114, -13}, {114, 0}, {146, 0}}, color = {0, 0, 127}));
  connect(T_ambb, wall.T_out) annotation(
    Line(points = {{-124, 100}, {-57, 100}}, color = {0, 0, 127}));
  connect(T_ambb, roof.T_out) annotation(
    Line(points = {{-124, 100}, {-72, 100}, {-72, 70}, {-55, 70}}, color = {0, 0, 127}));
  connect(rad_R1, roof.rad) annotation(
    Line(points = {{-120, 76}, {-80, 76}, {-80, 60}, {-55, 60}}));
  connect(rad_R1, ground.rad) annotation(
    Line(points = {{-120, 76}, {-80, 76}, {-80, 26}, {-55, 26}}));
  connect(rad_R1, wall.rad) annotation(
    Line(points = {{-120, 76}, {-80, 76}, {-80, 90}, {-57, 90}}));
  connect(wall.conv, zon.heatPort) annotation(
    Line(points = {{-31, 84}, {0, 84}, {0, -58}, {112, -58}}, color = {191, 0, 0}));
  connect(roof.conv, zon.heatPort) annotation(
    Line(points = {{-29, 54}, {0, 54}, {0, -58}, {112, -58}}, color = {191, 0, 0}));
  connect(ground.conv, zon.heatPort) annotation(
    Line(points = {{-29, 20}, {0, 20}, {0, -58}, {112, -58}}, color = {191, 0, 0}));
  connect(senTemZonAir.port, zon.heatPort) annotation(
    Line(points = {{114, -34}, {114, -58}, {112, -58}}, color = {191, 0, 0}));
  connect(const_ground.y, ground.T_out) annotation(
    Line(points = {{-94, 36}, {-54, 36}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 120}}), graphics = {Rectangle(fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-80, 54}, {80, -86}}), Polygon(origin = {-10, 84}, fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, points = {{-80, -30}, {100, -30}, {10, 30}, {-80, -30}, {-80, -30}}), Rectangle(origin = {51, -63}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -23}, {15, 23}}), Rectangle(origin = {-39, 6}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-21, 18}, {21, -18}}), Rectangle(origin = {38, 6}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-22, 18}, {22, -18}})}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 120}})),
    Documentation(info = "<html>
<p>Simple Model for a house. The convective heat is directly transfered to the air volume called zon. The radiative heat is transferred to the thermal mass consisting of walls, roof and ground plate. Between thermal mass and air is heat transfer, as well as between thermal mass and ambient air and thermal mass and earth.</p>
<p>The house temperature is measured with the help of senTemZonAir.</p>
</html>"));
end house_one_zone_simple_2;
