within FPSS.Einzelkomponenten.Control.SupplyTemperature;
model CST1_0_1
  AixLib.Controls.SetPoints.SupplyReturnTemperatureReset Heating_Curve(TOut_nominal = 263.15, TRet_nominal = 303.15, TRoo = 293.15, TSup_nominal = 318.15, dTOutHeaBal = 0, m = 1) annotation (
    Placement(transformation(origin = {-34, 52}, extent = {{-14, -14}, {14, 14}})));
  AixLib.Controls.Continuous.LimPID PID_HP( controllerType = Modelica.Blocks.Types.SimpleController.PID, yMax = 1, yMin = 0, k = 0.5, Ti = 300, Td = 30, initType = Modelica.Blocks.Types.Init.SteadyState, Ni = 2, Nd = 0.1) annotation (
    Placement(transformation(origin = {50, 60}, extent = {{-13, -13}, {13, 13}})));
  Modelica.Blocks.Interfaces.RealInput Temperature_amb annotation (
    Placement(transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Control_Signal_Compressor annotation (
    Placement(transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Actual_Supply_Temperature annotation (
    Placement(transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
equation
  connect(Temperature_amb, Heating_Curve.TOut) annotation (
    Line(points = {{-60, 120}, {-60, 62}, {-51, 60}}, color = {0, 0, 127}));
  connect(Heating_Curve.TSup, PID_HP.u_s) annotation (
    Line(points = {{-19, 60}, {34, 60}}, color = {0, 0, 127}));
  connect(Actual_Supply_Temperature, PID_HP.u_m) annotation (
    Line(points = {{120, 0}, {50, 0}, {50, 44}}, color = {0, 0, 127}));
  connect(PID_HP.y, Control_Signal_Compressor) annotation (
    Line(points = {{64, 60}, {80, 60}, {80, -40}, {0, -40}, {0, -110}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Ellipse(origin = {0, -20}, lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}),
    Documentation(info = "<html><head></head><body>Control of the Compressor frequency of modulating HeatPump:<div>Heating Curve defines Supply Temperature depending on ambient Temperature.</div><div>PID Controller compares actual supply temperature with desired supply temperature defined by Heating Curve and controls the Frequency of the Heatpumps compressor</div><div><br><div><br></div></div></body></html>", revisions = "<html><head></head><body>Original controller, that controlls between 0 and 1<div><br></div></body></html>"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end CST1_0_1;
