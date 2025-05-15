within FPSS.Einzelkomponenten.Control.SupplyTemperature;
model CST5
  AixLib.Controls.SetPoints.SupplyReturnTemperatureReset Heating_Curve(TOut_nominal = 263.15, TRet_nominal = 303.15, TRoo = 293.15, TSup_nominal = 318.15, dTOutHeaBal = 0, m = 1) annotation (
    Placement(transformation(origin = {-34, 52}, extent = {{-14, -14}, {14, 14}})));
  AixLib.Controls.Continuous.LimPID PID_HP( controllerType = Modelica.Blocks.Types.SimpleController.PID, yMax = 1, yMin = 0, k = 5, Ti = 60, Td = 50) annotation (
    Placement(transformation(origin = {50, 60}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Blocks.Interfaces.RealInput Temperature_amb annotation (
    Placement(transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Control_Signal_Compressor annotation (
    Placement(transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Actual_Supply_Temperature annotation (
    Placement(transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  Modelica.Blocks.Logical.Switch switch1 annotation (
    Placement(transformation(origin = {0, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constOFF(k = 0) annotation (
    Placement(transformation(origin = {66, -44}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold = 0.2)  annotation (
    Placement(transformation(origin = {0, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(Temperature_amb, Heating_Curve.TOut) annotation (
    Line(points = {{-60, 120}, {-60, 62}, {-51, 60}}, color = {0, 0, 127}));
  connect(Heating_Curve.TSup, PID_HP.u_s) annotation (
    Line(points = {{-19, 60}, {34, 60}}, color = {0, 0, 127}));
  connect(Actual_Supply_Temperature, PID_HP.u_m) annotation (
    Line(points = {{120, 0}, {50, 0}, {50, 44}}, color = {0, 0, 127}));
  connect(switch1.y, Control_Signal_Compressor) annotation (
    Line(points = {{0, -74}, {0, -110}}, color = {0, 0, 127}));
  connect(constOFF.y, switch1.u1) annotation (
    Line(points = {{56, -44}, {8, -44}, {8, -52}}, color = {0, 0, 127}));
  connect(lessThreshold.y, switch1.u2) annotation (
    Line(points = {{0, -29}, {0, -52}}, color = {255, 0, 255}));
  connect(PID_HP.y, lessThreshold.u) annotation (
    Line(points = {{64, 60}, {68, 60}, {68, 20}, {0, 20}, {0, -6}}, color = {0, 0, 127}));
  connect(PID_HP.y, switch1.u3) annotation (
    Line(points = {{64, 60}, {68, 60}, {68, 20}, {-20, 20}, {-20, -40}, {-8, -40}, {-8, -52}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Ellipse(origin = {0, -20}, lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}),
    Documentation(info = "<html><head></head><body>Control of the Compressor frequency of modulating HeatPump:<div>Heating Curve defines Supply Temperature depending on ambient Temperature.</div><div>PID Controller compares actual supply temperature with desired supply temperature defined by Heating Curve and controls the Frequency of the Heatpumps compressor</div><div><br><div><br></div></div></body></html>", revisions = "<html><head></head><body>Changed the control in a way that HeatPump modulates between 0.2 und 1<div><br></div></body></html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end CST5;
