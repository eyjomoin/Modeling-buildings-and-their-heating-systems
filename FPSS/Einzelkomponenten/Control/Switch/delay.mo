within FPSS.Einzelkomponenten.Control.Switch;
model delay
  Modelica.Clocked.BooleanSignals.Sampler.Hold hold annotation (
    Placement(transformation(origin = {28, 0}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock(period = perio)  annotation (
    Placement(transformation(origin = {-46, -40}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Clocked.BooleanSignals.Sampler.SampleClocked sample1 annotation (
    Placement(transformation(origin = {-20, 0}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Interfaces.BooleanInput u annotation (
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-108, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.BooleanOutput y annotation (
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {104, 0}, extent = {{-10, -10}, {10, 10}})));

  parameter Modelica.Units.SI.Time perio=600 "Period of time after output is set to input";

equation
  connect(periodicClock.y, sample1.clock) annotation (
    Line(points = {{-40, -40}, {-20, -40}, {-20, -8}}, color = {175, 175, 175}));
  connect(u, sample1.u) annotation (
    Line(points = {{-120, 0}, {-28, 0}}, color = {255, 0, 255}));
  connect(sample1.y, hold.u) annotation (
    Line(points = {{-14, 0}, {20, 0}}, color = {255, 0, 255}));
  connect(hold.y, y) annotation (
    Line(points = {{34, 0}, {110, 0}}, color = {255, 0, 255}));
end delay;
