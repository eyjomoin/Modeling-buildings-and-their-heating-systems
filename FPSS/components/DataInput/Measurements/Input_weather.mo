within FPSS.components.DataInput.Measurements;
model Input_weather

  parameter Real DeltaT = 0 "To modify the ambient temperature";

// Eines der Experimente muss man sich dann unten auswählen...
  constant String Exp1s = "modelica://FPSS/data/Experiment 1/chopped/df_weather.txt";
  constant String Exp2s = "modelica://FPSS/data/Experiment 2/chopped/df_weather.txt";
  constant String Exp3s = "modelica://FPSS/data/Experiment 3/chopped/df_weather.txt";
  constant String Exp4s = "modelica://FPSS/data/Experiment 4/chopped/df_weather.txt";

  constant String Exp1a = "modelica://FPSS/data/Experiment 1/chopped/df_weather.txt";
  constant String Exp2a = "modelica://FPSS/data/Experiment 2/chopped/df_weather.txt";
  constant String Exp3a = "modelica://FPSS/data/Experiment 3/chopped/df_weather.txt";
  constant String Exp4a = "modelica://FPSS/data/Experiment 4/chopped/df_weather.txt";

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    fileName=Modelica.Utilities.Files.loadResource(Exp2a),                                                                                                     tableName = "tab", tableOnFile = true,
    columns=1:5)                                                                                                                                                                                      annotation (
    Placement(transformation(origin = {-86, 0}, extent = {{-10, -10}, {10, 10}})));

//  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, fileName = Modelica.Utilities.Files.loadResource("H:/Dokumente/PoF/Datensatz/konvertiert/Experiment_2/KIT_Data_2.txt"), tableName = "tab", tableOnFile = true) annotation(
//    Placement(transformation(origin = {-86, 0}, extent = {{-10, -10}, {10, 10}})));

  Modelica.Blocks.Interfaces.RealOutput T_amb(unit="K") annotation (
    Placement(transformation(origin = {110, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin={110,100},   extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Q_sol(unit="W/m²") annotation (
      Placement(transformation(origin={110,20}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={110,20}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput RH(unit="kg/s") annotation (Placement(
        transformation(origin={110,-20}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={110,-20}, extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin2 annotation (
    Placement(transformation(origin={84,100},    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput T_amb_mod(unit="K") annotation (
      Placement(transformation(origin={110,60}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={110,60}, extent={{-10,-10},{10,10}})));
  T_amb_modifier t_amb_modifier(DeltaT=DeltaT)
    annotation (Placement(transformation(extent={{70,50},{90,70}})));
  Modelica.Blocks.Interfaces.RealOutput v_wind(unit="m/s") annotation (
      Placement(transformation(origin={110,-60}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={110,-60}, extent={{-10,-10},{10,10}})));
equation
  connect(toKelvin2.Kelvin, T_amb) annotation (
    Line(points={{95,100},{110,100}},      color = {0, 0, 127}));
  connect(t_amb_modifier.T_amb_modified, T_amb_mod)
    annotation (Line(points={{91,60},{110,60}}, color={0,0,127}));
  connect(combiTimeTable.y[2], toKelvin2.Celsius) annotation (Line(points={{-75,
          0},{0,0},{0,100},{72,100}}, color={0,0,127}));
  connect(combiTimeTable.y[2], t_amb_modifier.T_amb_original)
    annotation (Line(points={{-75,0},{0,0},{0,60},{68,60}}, color={0,0,127}));
  connect(combiTimeTable.y[3], Q_sol)
    annotation (Line(points={{-75,0},{0,0},{0,20},{110,20}}, color={0,0,127}));
  connect(combiTimeTable.y[4], RH) annotation (Line(points={{-75,0},{0,0},{0,
          -20},{110,-20}}, color={0,0,127}));
  connect(combiTimeTable.y[5], v_wind) annotation (Line(points={{-75,0},{0,0},{
          0,-60},{110,-60}}, color={0,0,127}));
  annotation (
    Icon(graphics={  Rectangle(origin = {-30, 0}, extent = {{-70, 100}, {70, -100}}), Line(origin = {-80, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-60, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-40, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-20, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {20, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-30, 80}, points = {{-70, 0}, {70, 0}, {70, 0}}), Text(origin={-30,-7},     extent={{-68,73},
              {68,-73}},
          textColor={0,0,0},
          textString="weather
",        textStyle={TextStyle.Bold}),                                                                                                                                                                                                        Line(origin={70,55},    points={{-30,-55},
              {10,-55},{10,45},{30,45},{30,45}}),                                                                                                                                                                                                        Line(origin={89.6636,
              59.5195},                                                                                                                                                                                                        points = {{-10, 0}, {10, 0}, {10, 0}}),                                                                           Line(origin={89.6636,
              19.5195},                                                                                                                                                                                                        points = {{-10, 0}, {10, 0}, {10, 0}}),                                                                                                                                                      Line(origin={89.6636,
              -60.4805},                                                                                                                                                                                                        points = {{-10, 0}, {10, 0}, {10, 0}}),
        Line(points={{80,-60},{80,0}}, color={0,0,0}),                                                                                                                                                                                                        Line(origin={89.6636,
              -20.4805},                                                                                                                                                                                                        points = {{-10, 0}, {10, 0}, {10, 0}})}),
      Documentation(info="<html>
<p>Model for weather data input</p>
</html>"));
end Input_weather;
