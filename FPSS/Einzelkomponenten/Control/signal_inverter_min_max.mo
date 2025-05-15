within FPSS.Einzelkomponenten.Control;
model signal_inverter_min_max
  parameter Real ctr_min=0 "minimum value of control signal";
  parameter Real ctr_max=1 "maximum value of control signal";

  Modelica.Blocks.Sources.Constant const_inverter_max(k=ctr_max) annotation (
      Placement(transformation(origin={-50,50}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput inverted_signal annotation (Placement(
        transformation(
        origin={120,0},
        extent={{-20,-20},{20,20}},
        rotation=0), iconTransformation(
        origin={120,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput controler_signal annotation (Placement(
        transformation(
        origin={-120,0},
        extent={{20,-20},{-20,20}},
        rotation=180), iconTransformation(
        origin={-120,0},
        extent={{20,-20},{-20,20}},
        rotation=180)));
  Modelica.Blocks.Math.Add3 add3_1(
    k1=+1,
    k2=-1,
    k3=+1)
    annotation (Placement(transformation(extent={{4,-10},{24,10}})));
  Modelica.Blocks.Sources.Constant const_inverter_min(k=ctr_min) annotation (
      Placement(transformation(origin={-50,-50}, extent={{-10,-10},{10,10}})));
equation
  connect(controler_signal, add3_1.u2)
    annotation (Line(points={{-120,0},{2,0}}, color={0,0,127}));
  connect(add3_1.y, inverted_signal)
    annotation (Line(points={{25,0},{120,0},{120,0}}, color={0,0,127}));
  connect(const_inverter_max.y, add3_1.u1) annotation (Line(points={{-39,50},{
          -20,50},{-20,8},{2,8}}, color={0,0,127}));
  connect(const_inverter_min.y, add3_1.u3) annotation (Line(points={{-39,-50},{
          -20,-50},{-20,-8},{2,-8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{-94,92},{-16,46}}, lineColor={28,108,200}),
        Text(
          extent={{-94,96},{-16,48}},
          textColor={28,108,200},
          textString="ctr_max"),
        Rectangle(extent={{16,32},{70,-66}}, lineColor={28,108,200}),
        Text(
          extent={{22,24},{64,6}},
          textColor={28,108,200},
          textString="+1"),
        Text(
          extent={{20,0},{68,-26}},
          textColor={28,108,200},
          textString="-1"),
        Line(
          points={{70,0},{96,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-98,0},{-64,0},{-2,0},{-2,-20},{16,-20}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-16,70},{-8,70},{2,70},{2,16},{16,16}},
          color={28,108,200},
          thickness=1),
        Text(
          extent={{-86,-28},{-8,-76}},
          textColor={28,108,200},
          textString="ctr_min"),
        Rectangle(extent={{-88,-28},{-10,-74}},
                                              lineColor={28,108,200}),
        Text(
          extent={{22,-40},{64,-58}},
          textColor={28,108,200},
          textString="+1"),
        Line(
          points={{-10,-48},{16,-48}},
          color={28,108,200},
          thickness=1)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end signal_inverter_min_max;
