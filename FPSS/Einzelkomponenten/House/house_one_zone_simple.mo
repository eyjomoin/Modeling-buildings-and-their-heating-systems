within FPSS.Einzelkomponenten.House;

model house_one_zone_simple
  package MediumAir = AixLib.Media.Air "Medium model for air";
  replaceable parameter Parameter.Building.P_house_modified Parameter_building constrainedby FPSS.Parameter.Building.P_house_start annotation(
     Placement(transformation(extent = {{120, 98}, {140, 118}})),
     choicesAllMatching = true);
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R1 annotation(
    Placement(transformation(extent = {{-128, -68}, {-113, -53}}), iconTransformation(extent = {{-110, 14}, {-95, 29}})));
  AixLib.Utilities.Interfaces.RadPort rad_R1 annotation(
    Placement(transformation(extent = {{-128, 68}, {-113, 83}}), iconTransformation(extent = {{-106, 86}, {-91, 101}})));
  Modelica.Blocks.Interfaces.RealOutput T_Room1 annotation(
    Placement(transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-102, -70}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor_rad annotation(
    Placement(transformation(origin = {0, -62}, extent = {{-110, 66}, {-90, 86}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor_con annotation(
    Placement(transformation(extent = {{-110, -70}, {-90, -50}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor walCap_out(C = Parameter_building.A_wall_in*Parameter_building.dWall_in*Parameter_building.cpWall_in*Parameter_building.rhoWall_in + Parameter_building.A_wall_out*Parameter_building.dWall_out*Parameter_building.cpWall_out*Parameter_building.rhoWall_out, T(fixed = true, start = Parameter_building.T_zone_start)) "Thermal mass of outer wall" annotation(
    Placement(transformation(origin = {27, 45}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor walRes_out(R = Parameter_building.dWall_out/Parameter_building.A_wall_out/Parameter_building.kWall_out) "Thermal resistor for outer wall" annotation(
    Placement(transformation(origin = {4, -3}, extent = {{66, -11}, {88, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor conRes_out(R = 1/Parameter_building.hWall_in/(Parameter_building.A_wall_in + Parameter_building.A_wall_out)) "Thermal resistance for convective heat transfer to outer wall" annotation(
    Placement(transformation(origin = {27, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
  AixLib.Fluid.MixingVolumes.MixingVolume zon(redeclare package Medium = MediumAir, V = Parameter_building.Vzone, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_nominal = 2, T_start = Parameter_building.T_zone_start) "Very simple zone air model" annotation(
    Placement(transformation(origin = {-96, -95}, extent = {{208, 65}, {234, 39}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTemZonAir annotation(
    Placement(transformation(origin = {-72, 116}, extent = {{120, 170}, {100, 190}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_amb annotation(
    Placement(transformation(origin = {-88, 98}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor walCap_roof(C = Parameter_building.A_roof*Parameter_building.droof*Parameter_building.cproof*Parameter_building.rhoroof, T(fixed = true, start = Parameter_building.T_zone_start)) "Thermal mass of roof" annotation(
    Placement(transformation(origin = {83, 45}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor conRes_roof(R = 1/Parameter_building.hroof/(Parameter_building.A_roof)) "Thermal resistance for convective heat transfer to roof" annotation(
    Placement(transformation(origin = {83, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor walRes_roof(R = Parameter_building.droof/Parameter_building.A_roof/Parameter_building.kroof) "Thermal resistor for outer roof" annotation(
    Placement(transformation(origin = {60, -3}, extent = {{66, -11}, {88, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor walCap_ground(C = Parameter_building.A_ground*Parameter_building.dground*Parameter_building.cpground*Parameter_building.rhoground, T(fixed = true, start = Parameter_building.T_zone_start)) "Thermal mass of groundplate" annotation(
    Placement(transformation(origin = {-27, 45}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor walRes_ground(R = Parameter_building.dground/Parameter_building.A_ground/Parameter_building.kground) "Thermal resistor for outer wall" annotation(
    Placement(transformation(origin = {-50, -3}, extent = {{66, -11}, {88, 11}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_ground annotation(
    Placement(transformation(origin = {-72, 142}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_ground(k = Parameter_building.T_ground) annotation(
    Placement(transformation(origin = {-106, 142}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor conRes_ground(R = 1/Parameter_building.hground/(Parameter_building.A_ground)) "Thermal resistance for convective heat transfer to ground plate" annotation(
    Placement(transformation(origin = {-27, -11}, extent = {{-11, -11}, {11, 11}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_wall(unit = "W") = walRes_out.Q_flow annotation(
    Placement(transformation(origin = {6, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-102, -70}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_roof(unit = "W") = walRes_roof.Q_flow annotation(
    Placement(transformation(origin = {64, -128}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-102, -70}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_ground(unit = "W") = walRes_ground.Q_flow annotation(
    Placement(transformation(origin = {-36, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-102, -70}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Q_loss_total(unit = "W") = walRes_ground.Q_flow + walRes_out.Q_flow + walRes_roof.Q_flow "total heat loss of the building" annotation(
    Placement(transformation(origin = {112, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-102, -70}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interfaces.RealInput T_ambb(unit = "K") annotation(
    Placement(transformation(origin = {-132, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 180), iconTransformation(origin = {0, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
equation
  connect(heatFlowSensor_rad.port_a, rad_R1) annotation(
    Line(points = {{-110, 14}, {-110, 75.5}, {-120.5, 75.5}}, color = {191, 0, 0}));
  connect(conv_R1, heatFlowSensor_con.port_a) annotation(
    Line(points = {{-120.5, -60.5}, {-120, -60}, {-110, -60}}, color = {191, 0, 0}));
  connect(zon.heatPort, senTemZonAir.port) annotation(
    Line(points = {{112, -43}, {100, -43}, {100, -8}, {108, -8}, {108, -4}}, color = {191, 0, 0}));
  connect(heatFlowSensor_rad.port_b, walCap_out.port) annotation(
    Line(points = {{-90, 14}, {27, 14}, {27, 32}}, color = {191, 0, 0}));
  connect(heatFlowSensor_rad.port_b, walCap_roof.port) annotation(
    Line(points = {{-90, 14}, {83, 14}, {83, 32}}, color = {191, 0, 0}));
  connect(senTemZonAir.T, T_Room1) annotation(
    Line(points = {{108, 17}, {140, 17}, {140, 0}, {150, 0}}, color = {0, 0, 127}));
  connect(heatFlowSensor_con.port_b, zon.heatPort) annotation(
    Line(points = {{-90, -60}, {100, -60}, {100, -43}, {112, -43}}, color = {191, 0, 0}));
  connect(conRes_roof.port_b, walCap_roof.port) annotation(
    Line(points = {{83, 0}, {83, 32}}, color = {191, 0, 0}));
  connect(conRes_out.port_b, walCap_out.port) annotation(
    Line(points = {{27, 0}, {27, 32}}, color = {191, 0, 0}));
  connect(conRes_out.port_a, zon.heatPort) annotation(
    Line(points = {{27, -22}, {28, -22}, {28, -43}, {112, -43}}, color = {191, 0, 0}));
  connect(conRes_roof.port_a, zon.heatPort) annotation(
    Line(points = {{83, -22}, {84, -22}, {84, -43}, {112, -43}}, color = {191, 0, 0}));
  connect(walCap_roof.port, walRes_roof.port_a) annotation(
    Line(points = {{83, 32}, {60, 32}, {60, 63}}, color = {191, 0, 0}));
  connect(walRes_out.port_a, walCap_out.port) annotation(
    Line(points = {{4, 63}, {4, 32}, {27, 32}}, color = {191, 0, 0}));
  connect(T_amb.port, walRes_out.port_b) annotation(
    Line(points = {{-78, 98}, {4, 98}, {4, 85}}, color = {191, 0, 0}));
  connect(T_amb.port, walRes_roof.port_b) annotation(
    Line(points = {{-78, 98}, {60, 98}, {60, 85}}, color = {191, 0, 0}));
  connect(heatFlowSensor_rad.port_b, walCap_ground.port) annotation(
    Line(points = {{-90, 14}, {-27, 14}, {-27, 32}}, color = {191, 0, 0}));
  connect(walCap_ground.port, walRes_ground.port_a) annotation(
    Line(points = {{-27, 32}, {-50, 32}, {-50, 63}}, color = {191, 0, 0}));
  connect(walRes_ground.port_b, T_ground.port) annotation(
    Line(points = {{-50, 85}, {-50, 142}, {-62, 142}}, color = {191, 0, 0}));
  connect(const_ground.y, T_ground.T) annotation(
    Line(points = {{-95, 142}, {-84, 142}}, color = {0, 0, 127}));
  connect(conRes_ground.port_a, zon.heatPort) annotation(
    Line(points = {{-27, -22}, {-26, -22}, {-26, -43}, {112, -43}}, color = {191, 0, 0}));
  connect(conRes_ground.port_b, walCap_ground.port) annotation(
    Line(points = {{-27, 0}, {-26, 0}, {-26, 32}, {-27, 32}}, color = {191, 0, 0}));
  connect(T_ambb, T_amb.T) annotation(
    Line(points = {{-132, 100}, {-100, 100}, {-100, 98}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 120}}), graphics = {Rectangle(fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-80, 54}, {80, -86}}), Polygon(origin = {-10, 84}, fillColor = {85, 0, 127}, fillPattern = FillPattern.Solid, points = {{-80, -30}, {100, -30}, {10, 30}, {-80, -30}, {-80, -30}}), Rectangle(origin = {51, -63}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -23}, {15, 23}}), Rectangle(origin = {-39, 6}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-21, 18}, {21, -18}}), Rectangle(origin = {38, 6}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-22, 18}, {22, -18}})}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 120}})),
  Documentation(info = "<html><head></head><body>Simple Model for a house. The convective heat is directly transfered to the air volume called zon. The radiative heat is transferred to the thermal mass consisting of walls, roof and ground plate. Between thermal mass and air is heat transfer, as well as between thermal mass and ambient air and earth.<div>The house temperature is measured with the help of senTemZonAir.</div></body></html>"));
end house_one_zone_simple;
