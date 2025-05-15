within FPSS.components.Control.BoreholeMassflow;
model CBM1_pump_const
  extends components.Control.Partial.icon;
  parameter Real DeltaT_bor = 5 "Temperature difference between supply and return of the borehole";
  parameter Real mflow_min = 0 "minimal mass flow rate of the primary circuit";
  parameter Real mflow_max = 2 "nominal mass flow rate of the primary circuit";

  Modelica.Blocks.Interfaces.RealInput T_Bor_in(unit="K") annotation (
    Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput T_Bor_out(unit="K") annotation (
    Placement(transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput Control_m_flow(unit="kg/s") annotation (
    Placement(transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add(k1=-1, k2=+1)     annotation (
    Placement(transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.LimPID PID(
    yMax=mflow_max,
    yMin=mflow_min,
    k=0.001,                                                             Ti = 20,
    Td=0.001)                                                                             annotation (
    Placement(transformation(                  extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant deltaT_Bor(k=DeltaT_bor)
                                                     annotation (
    Placement(transformation(origin={-58,30},    extent = {{-10, -10}, {10, 10}})));
  FPSS.components.Control.signal_inverter_min_max signal_inverter(ctr_max=
        mflow_max, ctr_min=mflow_min)
    annotation (Placement(transformation(extent={{44,-10},{64,10}})));
equation
  connect(deltaT_Bor.y, PID.u_s) annotation (
    Line(points={{-47,30},{-20,30},{-20,0},{-12,0}},   color = {0, 0, 127}));
  connect(T_Bor_in, add.u1) annotation (
    Line(points = {{-120, 60}, {-80, 60}, {-80, -24}, {-62, -24}}, color = {0, 0, 127}));
  connect(T_Bor_out, add.u2) annotation (
    Line(points = {{-120, -60}, {-80, -60}, {-80, -36}, {-62, -36}}, color = {0, 0, 127}));
  connect(add.y, PID.u_m)
    annotation (Line(points={{-39,-30},{0,-30},{0,-12}}, color={0,0,127}));
  connect(PID.y, signal_inverter.controler_signal)
    annotation (Line(points={{11,0},{42,0}}, color={0,0,127}));
  connect(Control_m_flow, signal_inverter.inverted_signal)
    annotation (Line(points={{120,0},{66,0}}, color={0,0,127}));
  annotation (
    Documentation(info = "<html><head></head><body>Delta T between T_Bor_in and T_Bor_out is controlled to 3<div>Thats a usaual value (sagt Anne, bzw Nutzerhandbuch von WP)</div><div><br></div><div>Laut Gesetzt dürfen sich die Temperaturen nicht mehr als 6K unterscheiden</div><div><br></div><div>Minimum mass flow</div><div><div>Experiment 1 : 2.8 kg/s</div><div>Experiment 2,3,4 : 0.167 kg/s</div></div><div><br></div><div>Maximum mass flow:</div><div><div>Experiment 1 : 3.1326 kg/s</div></div><div>Experiment 2,3,4 : 0.438 kg/s</div><div><br></div><div><br></div></body></html>"));
end CBM1_pump_const;
