within FPSS.components.Control.RoomTemperature;
model CRT_PID

  AixLib.Controls.Continuous.LimPID PID_valve_room(
    yMax=1,
    yMin=0,
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    Ti=1200,
    Td=120,
    k=1,
    wp=0,
    wd=0) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput Temperature_Room(unit="K") annotation (
    Placement(transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput control_valve annotation (Placement(
        transformation(
        origin={0,-110},
        extent={{-10,-10},{10,10}},
        rotation=-90), iconTransformation(
        origin={0,-110},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  Modelica.Blocks.Interfaces.RealInput T_room_set(unit="K") annotation (Placement(
        transformation(
        origin={120,0},
        extent={{-20,-20},{20,20}},
        rotation=180), iconTransformation(
        origin={120,0},
        extent={{-20,-20},{20,20}},
        rotation=180)));
equation
  connect(PID_valve_room.y, control_valve) annotation(
    Line(points = {{11, 0}, {20, 0}, {20, -60}, {0, -60}, {0, -110}}, color = {0, 0, 127}));
  connect(T_room_set, PID_valve_room.u_s) annotation(
    Line(points = {{120, 0}, {60, 0}, {60, 40}, {-60, 40}, {-60, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(Temperature_Room, PID_valve_room.u_m) annotation(
    Line(points = {{0, 120}, {0, 80}, {-80, 80}, {-80, -20}, {0, -20}, {0, -12}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Ellipse(origin = {0, -20},lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}),
      Documentation(info="<html>
<p>The PID controller changes the valve position in such a way that the desired room temperature is set.</p>
</html>"));
end CRT_PID;
