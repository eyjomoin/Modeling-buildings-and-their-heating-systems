within FPSS.Einzelkomponenten.Control.Mixer;
model ctr_mixer_DeltaT
  parameter Real DeltaT=5 "Temperature difference between supply and return of the Heat Pump";
  AixLib.Controls.Continuous.LimPID PID_pump_sec(
    yMin=0,
    yMax=1,
    controllerType = Modelica.Blocks.Types.SimpleController.PID,
    Ti(displayUnit="s") = 20000,
    Td=0.1,
    k=1,                                                                                                                                                                                                        wp = 0, wd = 0) annotation (
    Placement(transformation(extent={{-10,62},{10,82}})));
  Modelica.Blocks.Sources.Constant Delta_T_set(k=DeltaT)
                                                    annotation (Placement(
        transformation(origin={-46,72},extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput Temperature_supply(unit="K") annotation (Placement(
        transformation(
        origin={-120,40},
        extent={{20,-20},{-20,20}},
        rotation=180), iconTransformation(
        origin={-120,40},
        extent={{20,-20},{-20,20}},
        rotation=180)));
  Modelica.Blocks.Interfaces.RealOutput control_signal_mixer annotation (
      Placement(transformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0), iconTransformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Temperature_return(unit="K") annotation (Placement(
        transformation(
        origin={-120,-40},
        extent={{20,-20},{-20,20}},
        rotation=180), iconTransformation(
        origin={-120,-40},
        extent={{20,-20},{-20,20}},
        rotation=180)));
  Optimization.Criteria.Signals.IntegratedDeviation integratedDeviation
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
equation

  connect(Delta_T_set.y, PID_pump_sec.u_s)
    annotation (Line(points={{-35,72},{-12,72}},
                                               color={0,0,127}));
  connect(Delta_T_set.y, integratedDeviation.u1) annotation (Line(points={{-35,
          72},{-20,72},{-20,36},{38,36}}, color={0,0,127}));
  connect(Temperature_supply, add.u1) annotation (Line(points={{-120,40},{-80,
          40},{-80,6},{-66,6}}, color={0,0,127}));
  connect(Temperature_return, add.u2) annotation (Line(points={{-120,-40},{-80,
          -40},{-80,-6},{-66,-6}}, color={0,0,127}));
  connect(add.y, PID_pump_sec.u_m)
    annotation (Line(points={{-43,0},{0,0},{0,60}}, color={0,0,127}));
  connect(add.y, integratedDeviation.u2)
    annotation (Line(points={{-43,0},{0,0},{0,24},{38,24}}, color={0,0,127}));
  connect(PID_pump_sec.y, control_signal_mixer) annotation (Line(points={{11,72},
          {80,72},{80,0},{110,0}}, color={0,0,127}));
annotation (
    Icon(graphics={  Ellipse(origin = {0, -20},lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}));
end ctr_mixer_DeltaT;
