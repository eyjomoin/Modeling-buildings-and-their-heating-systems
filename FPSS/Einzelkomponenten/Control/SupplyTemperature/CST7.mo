within FPSS.Einzelkomponenten.Control.SupplyTemperature;
model CST7
  AixLib.Controls.SetPoints.SupplyReturnTemperatureReset Heating_Curve(TOut_nominal = 263.15, TRet_nominal = 303.15, TRoo = 293.15, TSup_nominal = 318.15, dTOutHeaBal = 0, m = 1) annotation (
    Placement(transformation(origin = {-34, 72}, extent = {{-14, -14}, {14, 14}})));
  AixLib.Controls.Continuous.LimPID PID_HP( controllerType = Modelica.Blocks.Types.SimpleController.PID, yMax = 1, yMin = 0, k = 1, Ti = 60, Td = 200) annotation (
    Placement(transformation(origin = {50, 80}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Blocks.Interfaces.RealInput Temperature_amb annotation (
    Placement(transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Control_Signal_Compressor annotation (
    Placement(transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Actual_Supply_Temperature annotation (
    Placement(transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  Modelica.Blocks.Logical.Switch switch1 annotation (
    Placement(transformation(origin = {-52, -44}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constOFF(k = 0) annotation (
    Placement(transformation(origin = {5, -25}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold02(threshold = 0.2)  annotation (
    Placement(transformation(origin = {-60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const02(k = 0.2)  annotation (
    Placement(transformation(origin = {-35, 13}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Logical.Switch switch2 annotation (
    Placement(transformation(origin = {-60, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Logical.LessThreshold lessThreshold01(threshold = 0.1)  annotation (
    Placement(transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(Temperature_amb, Heating_Curve.TOut) annotation (
    Line(points = {{-60, 120}, {-60, 80}, {-51, 80}}, color = {0, 0, 127}));
  connect(Heating_Curve.TSup, PID_HP.u_s) annotation (
    Line(points = {{-19, 80}, {34, 80}}, color = {0, 0, 127}));
  connect(Actual_Supply_Temperature, PID_HP.u_m) annotation (
    Line(points = {{120, 0}, {50, 0}, {50, 64}}, color = {0, 0, 127}));
  connect(PID_HP.y, lessThreshold02.u) annotation (
    Line(points = {{64, 80}, {80, 80}, {80, 50}, {-60, 50}, {-60, 42}}, color = {0, 0, 127}));
  connect(lessThreshold02.y, switch2.u2) annotation (
    Line(points = {{-60, 20}, {-60, 6}}, color = {255, 0, 255}));
  connect(const02.y, switch2.u1) annotation (
    Line(points = {{-40.5, 13}, {-52, 13}, {-52, 6}}, color = {0, 0, 127}));
  connect(PID_HP.y, switch2.u3) annotation (
    Line(points = {{64, 80}, {80, 80}, {80, 50}, {-80, 50}, {-80, 14}, {-68, 14}, {-68, 6}}, color = {0, 0, 127}));
  connect(switch2.y, switch1.u3) annotation (
    Line(points = {{-60, -16}, {-60, -32}}, color = {0, 0, 127}));
  connect(PID_HP.y, lessThreshold01.u) annotation (
    Line(points = {{64, 80}, {80, 80}, {80, 50}, {-12, 50}, {-12, 12}}, color = {0, 0, 127}));
  connect(lessThreshold01.y, switch1.u2) annotation (
    Line(points = {{-12, -10}, {-12, -20}, {-52, -20}, {-52, -32}}, color = {255, 0, 255}));
  connect(constOFF.y, switch1.u1) annotation (
    Line(points = {{-0.5, -25}, {-44, -25}, {-44, -32}}, color = {0, 0, 127}));
  connect(switch1.y, Control_Signal_Compressor) annotation (
    Line(points = {{-52, -54}, {-52, -60}, {0, -60}, {0, -110}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Ellipse(origin = {0, -20}, lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}),
    Documentation(info = "<html><head></head><body>Control of the Compressor frequency of modulating HeatPump:<div>Heating Curve defines Supply Temperature depending on ambient Temperature.</div><div>PID Controller compares actual supply temperature with desired supply temperature defined by Heating Curve and controls the Frequency of the Heatpumps compressor</div><div><br><div><br></div></div></body></html>", revisions = "<html><head></head><body>Changed the control in a way that HeatPump modulates between 0.2 und 1<div><br></div></body></html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end CST7;
