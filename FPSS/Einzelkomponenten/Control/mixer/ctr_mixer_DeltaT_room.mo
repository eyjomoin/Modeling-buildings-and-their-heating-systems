within FPSS.Einzelkomponenten.Control.Mixer;
model ctr_mixer_DeltaT_room
  parameter Real DeltaT=5 "Temperature difference between supply and return of the Heat Pump";
  AixLib.Controls.Continuous.LimPID PID_pump_sec(
    yMin=0.1,
    yMax=0.95,
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    Ti(displayUnit="s") = 8000,
    Td=100,
    k=0.1,
    wp=0.5,
    wd=0.5)                                                                                                                                                                                                      annotation (
    Placement(transformation(extent={{-22,-20},{-2,0}})));
  Modelica.Blocks.Sources.Constant Delta_T_set(k=DeltaT)
                                                    annotation (Placement(
        transformation(origin={-50,-10},
                                       extent={{-10,-10},{10,10}})));
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
        origin={-120,-80},
        extent={{20,-20},{-20,20}},
        rotation=180), iconTransformation(
        origin={-120,-80},
        extent={{20,-20},{-20,20}},
        rotation=180)));
  Optimization.Criteria.Signals.IntegratedDeviation integratedDeviation
    annotation (Placement(transformation(extent={{0,-64},{20,-44}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-64,-70},{-44,-50}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={80,0})));
  Modelica.Blocks.Sources.Constant const1(k=0.5)
                                               annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={28,70})));
  Modelica.Blocks.Interfaces.RealInput valve_room annotation (Placement(
        transformation(
        origin={-20,120},
        extent={{20,-20},{-20,20}},
        rotation=90), iconTransformation(
        origin={-20,120},
        extent={{20,-20},{-20,20}},
        rotation=90)));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow=0.2, uHigh=0.6)
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
    annotation (Placement(transformation(extent={{12,0},{26,14}})));
equation

  connect(Delta_T_set.y, PID_pump_sec.u_s)
    annotation (Line(points={{-39,-10},{-24,-10}},
                                               color={0,0,127}));
  connect(Delta_T_set.y, integratedDeviation.u1) annotation (Line(points={{-39,-10},
          {-32,-10},{-32,-48},{-2,-48}},  color={0,0,127}));
  connect(Temperature_supply, add.u1) annotation (Line(points={{-120,40},{-80,
          40},{-80,-54},{-66,-54}},
                                color={0,0,127}));
  connect(Temperature_return, add.u2) annotation (Line(points={{-120,-80},{-80,
          -80},{-80,-66},{-66,-66}},
                                   color={0,0,127}));
  connect(add.y, PID_pump_sec.u_m)
    annotation (Line(points={{-43,-60},{-12,-60},{-12,-22}},
                                                    color={0,0,127}));
  connect(add.y, integratedDeviation.u2)
    annotation (Line(points={{-43,-60},{-2,-60}},           color={0,0,127}));
  connect(control_signal_mixer, switch1.y)
    annotation (Line(points={{110,0},{91,0}}, color={0,0,127}));
  connect(valve_room, hysteresis.u)
    annotation (Line(points={{-20,120},{-20,40},{-2,40}}, color={0,0,127}));
  connect(const1.y, switch1.u3)
    annotation (Line(points={{39,70},{52,70},{52,8},{68,8}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{26.7,7},{
          26.7,6},{40,6},{40,0},{68,0}}, color={255,0,255}));
  connect(PID_pump_sec.y, switch1.u1) annotation (Line(points={{-1,-10},{44,-10},
          {44,-8},{68,-8}}, color={0,0,127}));
annotation (
    Icon(graphics={  Ellipse(origin = {0, -20},lineThickness = 6, extent = {{-60, 60}, {60, -60}}), Line(origin = {-71, 30}, points = {{-9, 10}, {11, -10}}, thickness = 2), Line(origin = {48.9092, 30.5135}, points = {{31, 10}, {11, -10}}, thickness = 2), Line(origin = {-10.6602, 62.8659}, points = {{11, 12}, {11, -10}}, thickness = 2), Line(origin = {-50.7156, 47.46}, points = {{-7, 14}, {11, -10}}, thickness = 2), Line(origin = {-31.2014, 57.7306}, points = {{1, 14}, {11, -10}}, thickness = 2), Line(origin = {52.2471, 26.662}, points = {{-9, 10}, {7, 28}}, thickness = 2), Line(origin = {8.59712, 58.5009}, points = {{23, 10}, {11, -10}}, thickness = 2), Line(origin = {22.18, 17.51}, points = {{5, 16}, {-7, -8}}, thickness = 6)}));
end ctr_mixer_DeltaT_room;
