within FPSS.components.Control.HeatingCurve;
model Example_HeatingCurve
  extends Modelica.Icons.Example;
  HeatingCurve_2s heatingCurve
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=40,
    duration=100,
    offset=273.15 - 15)
    annotation (Placement(transformation(extent={{-92,-28},{-72,-8}})));
  HeatingCurve_ih heatingCurve_ih
    annotation (Placement(transformation(extent={{-12,-54},{8,-34}})));
  HeatingCurve_ih_bounded heatingCurve_ih_bounded
    annotation (Placement(transformation(extent={{-12,36},{8,56}})));
equation
  connect(ramp.y, heatingCurve.T_amb) annotation (Line(points={{-71,-18},{-20,-18},
          {-20,-6},{-12,-6}}, color={0,0,127}));
  connect(ramp.y, heatingCurve_ih.T_amb) annotation (Line(points={{-71,-18},{
          -54,-18},{-54,-50},{-14,-50}}, color={0,0,127}));
  connect(ramp.y, heatingCurve_ih_bounded.T_amb) annotation (Line(points={{-71,
          -18},{-54,-18},{-54,40},{-14,40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),    experiment(
      StopTime=100,
      Interval=0.1,
      __Dymola_Algorithm="Dassl"));
end Example_HeatingCurve;
