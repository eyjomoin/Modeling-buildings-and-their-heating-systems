within FPSS.Einzelkomponenten.Control.Pump;
model CSC_pump_const

//  parameter Modelica.Units.SI.MassFlowRate mWat_flow_nominal = 0.3 "Nominal mass flow rate for water loop. Maximum Value found in data was 0.982 m3/h = 0.278233 kg/s";
  parameter Modelica.Units.SI.MassFlowRate mWat_flow_nominal = 0.003 "bla";
  Modelica.Blocks.Interfaces.RealInput Temperature_return annotation (Placement(
        transformation(
        origin={-40,-120},
        extent={{20,-20},{-20,20}},
        rotation=-90), iconTransformation(
        origin={-40,-120},
        extent={{20,-20},{-20,20}},
        rotation=-90)));
  Modelica.Blocks.Interfaces.RealOutput control_signal_pump annotation (
      Placement(transformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0), iconTransformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Temperature_supply annotation (Placement(
        transformation(
        origin={40,-120},
        extent={{20,-20},{-20,20}},
        rotation=-90), iconTransformation(
        origin={40,-120},
        extent={{20,-20},{-20,20}},
        rotation=-90)));
  Modelica.Blocks.Sources.Constant const(k=0.18)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
equation

  connect(const.y, control_signal_pump)
    annotation (Line(points={{13,0},{110,0}}, color={0,0,127}));
annotation (
    Icon(graphics={  Ellipse(origin = {0, -20},lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}));
end CSC_pump_const;
