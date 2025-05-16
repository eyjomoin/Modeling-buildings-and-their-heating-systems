within FPSS.components.Control.HeatPump;
model Ctr_HP_const

  parameter Modelica.Units.SI.Temperature T_HC_1_amb = 273.15-10 "ambient temperature at first setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_1_sup = 273.15+45 "supply temperature at first setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_2_amb = 273.15+20 "ambient temperature at second setpoint of the Heating Curve";
  parameter Modelica.Units.SI.Temperature T_HC_2_sup = 273.15+20 "ambient temperature at second setpoint of the Heating Curve";

  Modelica.Blocks.Interfaces.RealOutput control_signal_HP annotation (Placement(
        transformation(
        origin={0,-110},
        extent={{-10,-10},{10,10}},
        rotation=-90),
                     iconTransformation(
        origin={0,-110},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  Modelica.Blocks.Interfaces.RealInput T_HP_out_meas(unit="K") annotation (Placement(
        transformation(
        origin={-120,40},
        extent={{20,-20},{-20,20}},
        rotation=180), iconTransformation(
        origin={-120,40},
        extent={{20,-20},{-20,20}},
        rotation=180)));
  AixLib.Controls.Continuous.LimPID PID_HP(
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=5.8636,
    Ti=200.008,
    Td=0.09834,
    yMax=1,
    yMin=0)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Blocks.Interfaces.RealInput T_amb(unit="K") annotation (Placement(
        transformation(
        origin={-60,120},
        extent={{20,-20},{-20,20}},
        rotation=90), iconTransformation(
        origin={-60,120},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  HeatingCurve.HeatingCurve_2s         heatingCurve_2s(
    T_amb1=T_HC_1_amb,
    T_set1=T_HC_1_sup,
    T_amb2=T_HC_2_amb,
    T_set2=T_HC_2_sup)
    annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
  Modelica.Blocks.Interfaces.RealInput valve_room annotation (Placement(
        transformation(
        origin={-120,-40},
        extent={{20,-20},{-20,20}},
        rotation=180), iconTransformation(
        origin={-120,-40},
        extent={{20,-20},{-20,20}},
        rotation=180)));
  Optimization.Criteria.Signals.IntegratedDeviation integratedDeviation
    annotation (Placement(transformation(extent={{68,50},{88,70}})));
  Modelica.Blocks.Sources.Constant const_ctr_HP(k=1) annotation (Placement(
        transformation(origin={-16,-20}, extent={{-10,-10},{10,10}})));
equation

  connect(T_HP_out_meas, PID_HP.u_m)
    annotation (Line(points={{-120,40},{0,40},{0,48}},   color={0,0,127}));
  connect(heatingCurve_2s.TSupSet, PID_HP.u_s) annotation (Line(points={{-50,65},
          {-32,65},{-32,60},{-12,60}}, color={0,0,127}));
  connect(T_amb, heatingCurve_2s.T_amb) annotation (Line(points={{-60,120},{-60,
          80},{-80,80},{-80,54},{-74,54}}, color={0,0,127}));
  connect(heatingCurve_2s.TSupSet, integratedDeviation.u1) annotation (Line(
        points={{-50,65},{-34,65},{-34,80},{46,80},{46,66},{66,66}}, color={0,0,
          127}));
  connect(T_HP_out_meas, integratedDeviation.u2) annotation (Line(points={{-120,
          40},{46,40},{46,54},{66,54}}, color={0,0,127}));
annotation (
    Icon(graphics={  Ellipse(origin = {0, -20},lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}),
      Documentation(info="<html>
<p>Controlles the heat pump, so that the heat pump outlet temperature is set according to the Heating curve</p>
</html>"));
end Ctr_HP_const;
