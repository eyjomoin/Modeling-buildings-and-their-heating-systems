within FPSS.Einzelkomponenten.Control.HeatingCurve;
model HeatingCurve_2s

  parameter Modelica.Units.SI.Temperature T_amb1=273.15-10 "ambient temperature point 1";
  parameter Modelica.Units.SI.Temperature T_set1=273.15+45 "supply set temperature point 1";
  parameter Modelica.Units.SI.Temperature T_amb2=273.15+20 "ambient temperature point 2";
  parameter Modelica.Units.SI.Temperature T_set2=273.15+20 "supply set temperature point 2";

//  parameter Real slope "slope of the linear function";
//  parameter Modelica.Units.SI.Temperature n "height of the linear function";

  Modelica.Blocks.Interfaces.RealInput T_amb(unit="K") "Ambient temperture" annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}),  iconTransformation(
          extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput TSupSet(unit="K") "Set temperature calculated by heating curve" annotation (Placement(
        transformation(extent={{100,30},{140,70}}), iconTransformation(extent={{
            100,30},{140,70}})));

  Modelica.Blocks.Interfaces.RealOutput slope "slope of the linear function"                        annotation (Placement(
        transformation(extent={{100,-40},{120,-20}}), iconTransformation(extent
          ={{100,-40},{120,-20}})));
  Modelica.Blocks.Interfaces.RealOutput n "height of the linear function"
    annotation (Placement(transformation(extent={{100,-80},{120,-60}}),
        iconTransformation(extent={{100,-80},{120,-60}})));
equation
  (TSupSet,slope,n) =
    FPSS.Einzelkomponenten.Control.HeatingCurve.Functions.HeatingCurve_two_setpoints_3outputs(
    T_amb1=T_amb1,
    T_set1=T_set1,
    T_amb2=T_amb2,
    T_set2=T_set2,
    TAmb=T_amb);

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
end HeatingCurve_2s;
