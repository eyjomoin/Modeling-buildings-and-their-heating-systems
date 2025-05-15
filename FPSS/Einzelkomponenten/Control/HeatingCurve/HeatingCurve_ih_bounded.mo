within FPSS.Einzelkomponenten.Control.HeatingCurve;
model HeatingCurve_ih_bounded

  parameter Real inclination = -5/6 "inclination of the linear function";
  parameter Real height = 537.442 "height of the linear function";

  parameter Modelica.Units.SI.Temperature Tlow = 273.15-10 "lower bound of heating curve";
  parameter Modelica.Units.SI.Temperature Thigh = 273.15+20 "higher bound of heating curve";

  Modelica.Blocks.Interfaces.RealInput T_amb(unit="K") "Ambient temperture" annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}),  iconTransformation(
          extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput TSupSet(unit="K") "Set temperature calculated by heating curve" annotation (Placement(
        transformation(extent={{100,-20},{140,20}}), iconTransformation(extent={
            {100,-20},{140,20}})));

equation
  TSupSet =
    FPSS.Einzelkomponenten.Control.HeatingCurve.Functions.HeatingCurve_inclination_height_bounded(
    TAmb=T_amb,
    inclination=inclination,
    height=height,
    Tlow=Tlow,
    Thigh=Thigh);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Polygon(
          points={{90,-82},{68,-74},{68,-90},{90,-82}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-82},{82,-82}}, color={192,192,192}),
        Line(points={{-80,76},{-80,-92}}, color={192,192,192}),
        Polygon(
          points={{-80,88},{-88,66},{-72,66},{-80,86},{-80,88}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-80,-82},{60,32}}),
        Line(
          points={{-80,-82},{-42,-38},{4,2},{60,32}},
          smooth=Smooth.Bezier),
        Line(
          points={{-80,-82},{-58,-42},{-4,8},{60,32}},
          smooth=Smooth.Bezier)}),                               Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HeatingCurve_ih_bounded;
