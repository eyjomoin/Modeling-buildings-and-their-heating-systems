within FPSS.components.DataInput.Selfmade_weather;
model Input_weather_choose

  parameter Real DeltaT = 0 "To modify the ambient temperature";
  parameter Real DeltaTRoom = 0 "To modify the room temperature";

  replaceable parameter weatherfiles.weather_base_const input_weather constrainedby weatherfiles.weather_base_const annotation(choicesAllMatching = true);
  replaceable parameter weatherfiles.weather_base_const input_roomTemp 
  constrainedby weatherfiles.weather_base_const annotation(choicesAllMatching = true);

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    fileName=Modelica.Utilities.Files.loadResource(input_weather.filename),      tableName = "tab", tableOnFile = true,columns=1:2)                                                                                                                                                                                      annotation (
    Placement(transformation(origin = {-82, 34}, extent = {{-10, -10}, {10, 10}})));

  Modelica.Blocks.Interfaces.RealOutput T_amb(unit="K") annotation (
    Placement(transformation(origin={112,82},     extent = {{-10, -10}, {10, 10}}), iconTransformation(origin={110,60},    extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin2 annotation (
    Placement(transformation(origin={82,86},     extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput T_amb_mod(unit="K") annotation (
      Placement(transformation(origin={114,-10},extent={{-10,-10},{10,10}}),
        iconTransformation(origin={110,-60},extent={{-10,-10},{10,10}})));
  T_amb_modifier t_amb_modifier(DeltaT=DeltaT)
    annotation (Placement(transformation(origin = {-3, 50}, extent = {{77, -70}, {99, -50}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin3 annotation(
    Placement(transformation(origin = {84, -42}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput T_room_mod(unit = "K") annotation(
    Placement(transformation(origin = {114, -82}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput T_roomSet(unit = "K") annotation(
    Placement(transformation(origin = {114, -42}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
  FPSS.components.DataInput.T_amb_modifier t_room_modifer(DeltaT = DeltaTRoom) annotation(
    Placement(transformation(origin = {-1, -22}, extent = {{77, -70}, {99, -50}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = 1:2, fileName = Modelica.Utilities.Files.loadResource(input_roomTemp.filename), tableName = "tab", tableOnFile = true) annotation(
    Placement(transformation(origin = {-80, -56}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(toKelvin2.Kelvin, T_amb) annotation(
    Line(points = {{93, 86}, {102.5, 86}, {102.5, 82}, {112, 82}}, color = {0, 0, 127}));
  connect(t_amb_modifier.T_amb_modified, T_amb_mod)
    annotation (Line(points={{97, -10}, {114, -10}},
                                                color={0,0,127}));
  connect(combiTimeTable.y[2], toKelvin2.Celsius) annotation (Line(points={{-71,34},
          {0,34},{0,86},{70,86}},      color={0,0,127}));
  connect(combiTimeTable.y[2], t_amb_modifier.T_amb_original)
    annotation (Line(points={{-71,34},{0,34},{0,-10},{72,-10}},
                                                            color={0,0,127}));
  connect(combiTimeTable1.y[2], toKelvin3.Celsius) annotation(
    Line(points = {{-68, -56}, {0, -56}, {0, -42}, {72, -42}}, color = {0, 0, 127}));
  connect(combiTimeTable1.y[2], t_room_modifer.T_amb_original) annotation(
    Line(points = {{-68, -56}, {0, -56}, {0, -82}, {74, -82}}, color = {0, 0, 127}));
  connect(t_room_modifer.T_amb_modified, T_room_mod) annotation(
    Line(points = {{100, -82}, {114, -82}}, color = {0, 0, 127}));
  connect(toKelvin3.Kelvin, T_roomSet) annotation(
    Line(points = {{96, -42}, {114, -42}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Rectangle(origin = {-30, 0}, extent = {{-70, 100}, {70, -100}}), Line(origin = {-80, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-60, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-40, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-20, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {20, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-30, 80}, points = {{-70, 0}, {70, 0}, {70, 0}}), Text(origin={-30,-7},     extent={{-68,73},
              {68,-73}},
          textColor={0,0,0},
          textString="weather
",        textStyle={TextStyle.Bold}),                                                                                                                                                                                                        Line(origin={70,55},    points={{-30,-55},
              {10,-55},{10,5},{22,5},{30,5}}),                                                                                                                                                                                                        Line(origin={89.6636,
              -60.4805},                                                                                                                                                                                                        points = {{-10, 0}, {10, 0}, {10, 0}}),
        Line(points={{80,-60},{80,0}}, color={0,0,0})}), Documentation(info="<html>
<p>Model for weather data input</p>
</html>"));
end Input_weather_choose;
