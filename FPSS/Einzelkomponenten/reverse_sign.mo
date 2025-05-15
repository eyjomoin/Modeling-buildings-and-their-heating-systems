within FPSS.Einzelkomponenten;
model reverse_sign
  Modelica.Blocks.Math.Gain Gain(k=-1)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
public
  Modelica.Blocks.Interfaces.RealInput x_in(unit="W") "negative input"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
        iconTransformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput x_out(unit="W") "positive output"
    annotation (Placement(transformation(extent={{100,-20},{140,20}}),
        iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(x_in, Gain.u)
    annotation (Line(points={{-120,0},{-24,0},{-24,0}}, color={0,0,127}));
  connect(Gain.y, x_out)
    annotation (Line(points={{22,0},{120,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-88,90},{94,-68}},
          textColor={0,0,0},
          textString="*(-1)")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end reverse_sign;
