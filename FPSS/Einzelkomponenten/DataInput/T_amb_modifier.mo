within FPSS.Einzelkomponenten.DataInput;
model T_amb_modifier
//  parameter Modelica.Units.SI.Temperature DeltaT = 0 "modifies the ambient temperature";
  parameter Real DeltaT = 0 "modifies the ambient temperature";
  Modelica.Blocks.Math.Add Temperature_modified annotation (Placement(
        transformation(origin={20,0},   extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant Delta_Temp(k=DeltaT) annotation (Placement(
        transformation(origin={-40,20}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_amb_original
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput T_amb_modified
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin
    annotation (Placement(transformation(extent={{54,-10},{74,10}})));
equation
  connect(Delta_Temp.y, Temperature_modified.u1) annotation (Line(points={{-29,20},
          {-20,20},{-20,6},{8,6}}, color={0,0,127}));
  connect(T_amb_original, Temperature_modified.u2) annotation (Line(points={{-120,
          0},{-56,0},{-56,-6},{8,-6}}, color={0,0,127}));
  connect(Temperature_modified.y, toKelvin.Celsius)
    annotation (Line(points={{31,0},{52,0}}, color={0,0,127}));
  connect(T_amb_modified, toKelvin.Kelvin)
    annotation (Line(points={{110,0},{75,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-60,28},{60,-28}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-50,26},{46,-20}},
          textColor={255,255,255},
          textString="T_amb"),
        Rectangle(
          extent={{-20,28},{20,68}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,68},{40,68},{0,94},{-40,68}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,-28},{20,-68}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,-68},{40,-68},{0,-94},{-40,-68}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end T_amb_modifier;
