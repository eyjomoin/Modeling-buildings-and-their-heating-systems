within FPSS.Einzelkomponenten.Control.SupplyTemperature;
model CST2
  AixLib.Controls.SetPoints.SupplyReturnTemperatureReset Heating_Curve(TOut_nominal = 263.15, TRet_nominal = 303.15, TRoo = 293.15, TSup_nominal = 318.15, dTOutHeaBal = 0, m = 1) annotation (
    Placement(transformation(origin = {-34, 54}, extent = {{-14, -14}, {14, 14}})));
  AixLib.Controls.Continuous.LimPID PID_HP( controllerType = Modelica.Blocks.Types.SimpleController.PID, yMax = 1, yMin = 0, k = 2, Ti = 60, Td = 70) annotation (
    Placement(transformation(origin = {63, 59}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Blocks.Interfaces.RealInput Temperature_amb annotation (
    Placement(transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Control_Signal_Compressor annotation (
    Placement(transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Actual_Supply_Temperature annotation (
    Placement(transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  Modelica.Blocks.Logical.Greater greater annotation (
    Placement(transformation(origin = {-4, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Switch switch annotation (
    Placement(transformation(origin = {46, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constOFF(k = 0)  annotation (
    Placement(transformation(origin = {84, -54}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sample annotation (
    Placement(transformation(origin = {46, -12}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock(period = 120) annotation (
    Placement(transformation(origin = {104, 28}, extent = {{-106, -46}, {-94, -34}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation (
    Placement(transformation(origin = {46, 10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Math.RealToBoolean realToBoolean annotation (
    Placement(transformation(origin = {46, -46}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Clocked.RealSignals.Sampler.Hold hold annotation (
    Placement(transformation(origin = {46, -30}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const02(k = 0.2) annotation (
    Placement(transformation(origin = {-84, 18}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(Temperature_amb, Heating_Curve.TOut) annotation (
    Line(points = {{-60, 120}, {-60, 62}, {-51, 62}}, color = {0, 0, 127}));
  connect(Heating_Curve.TSup, PID_HP.u_s) annotation (
    Line(points = {{-19, 62}, {-5, 62}, {-5, 59}, {47, 59}}, color = {0, 0, 127}));
  connect(Actual_Supply_Temperature, PID_HP.u_m) annotation (
    Line(points = {{120, 0}, {64, 0}, {64, 44}}, color = {0, 0, 127}));
  connect(switch.y, Control_Signal_Compressor) annotation (
    Line(points = {{46, -80}, {46, -90}, {0, -90}, {0, -110}}, color = {0, 0, 127}));
  connect(periodicClock.y, sample.clock) annotation (
    Line(points = {{10.6, -12}, {38.6, -12}}, color = {175, 175, 175}));
  connect(booleanToReal.y, sample.u) annotation (
    Line(points = {{46, 6}, {46, -5}}, color = {0, 0, 127}));
  connect(realToBoolean.y, switch.u2) annotation (
    Line(points = {{46, -50}, {46, -58}}, color = {255, 0, 255}));
  connect(greater.y, booleanToReal.u) annotation (
    Line(points = {{7, 18}, {43, 18}, {43, 15}, {46, 15}}, color = {255, 0, 255}));
  connect(sample.y, hold.u) annotation (
    Line(points = {{46, -18}, {46, -26}}, color = {0, 0, 127}));
  connect(hold.y, realToBoolean.u) annotation (
    Line(points = {{46, -34}, {46, -42}}, color = {0, 0, 127}));
  connect(const02.y, greater.u1) annotation (
    Line(points = {{-72, 18}, {-16, 18}}, color = {0, 0, 127}));
  connect(PID_HP.y, greater.u2) annotation (
    Line(points = {{78, 60}, {90, 60}, {90, 34}, {-46, 34}, {-46, 10}, {-16, 10}}, color = {0, 0, 127}));
  connect(PID_HP.y, switch.u3) annotation (
    Line(points = {{78, 60}, {90, 60}, {90, 34}, {-46, 34}, {-46, -44}, {38, -44}, {38, -58}}, color = {0, 0, 127}));
  connect(constOFF.y, switch.u1) annotation (
    Line(points = {{74, -54}, {54, -54}, {54, -58}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Ellipse(origin = {0, -20}, lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}),
    Documentation(info = "<html><head></head><body>Control of the Compressor frequency of modulating HeatPump:<div>Heating Curve defines Supply Temperature depending on ambient Temperature.</div><div>PID Controller compares actual supply temperature with desired supply temperature defined by Heating Curve and controls the Frequency of the Heatpumps compressor</div><div><br><div><br></div></div></body></html>", revisions = "<html><head></head><body>Changed the control in a way that HeatPump modulates between 0.2 und 1<div><br></div></body></html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end CST2;
