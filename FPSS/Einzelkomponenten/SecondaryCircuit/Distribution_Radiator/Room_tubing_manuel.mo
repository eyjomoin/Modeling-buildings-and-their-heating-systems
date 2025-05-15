within FPSS.Einzelkomponenten.SecondaryCircuit.Distribution_Radiator;
model Room_tubing_manuel
  package MediumAir = AixLib.Media.Air "Medium model for air";
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Modelica.Units.SI.MassFlowRate mflow_nominal = 0.02 "nominal mass flow";
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_nominal = 2000 "nominal heat flow";
  parameter Modelica.Units.SI.Temperature T_in_nominal = 273.15 + 60 "Radiator inlet Temperature at nominal condition";
  parameter Modelica.Units.SI.Temperature T_out_nominal = 273.15 + 40 "Radiator outlet Temperature at nominal condition";

  Modelica.Fluid.Interfaces.FluidPort_b heating_fluid_out(redeclare final
      package Medium = MediumWater) annotation (Placement(transformation(extent
          ={{200,-180},{240,-140}}), iconTransformation(extent={{210,-168},{230,
            -148}})));
  Modelica.Fluid.Interfaces.FluidPort_a heating_fluid_in(redeclare final
      package Medium = MediumWater) annotation (Placement(transformation(extent
          ={{-230,-170},{-210,-150}}), iconTransformation(extent={{-232,-172},{-212,
            -152}})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear val(redeclare package Medium =
        MediumWater,
    m_flow_nominal=mflow_nominal,
      dpValve_nominal=200000)
    annotation (Placement(transformation(extent={{68,-170},{88,-150}})));
  RadiatorEN442_2_Thilo                                 radiator(
    redeclare package Medium = MediumWater,
    T_start=323.15,
    Q_flow_nominal(displayUnit="W") = Q_flow_nominal,
    T_a_nominal=333.15,
    T_b_nominal=313.15,
    TAir_nominal=294.15)
    annotation (Placement(transformation(extent={{-20,-180},{20,-140}})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear bypass(
    redeclare package Medium = MediumWater,
    m_flow_nominal=mflow_nominal,
    dpValve_nominal=200000)
    annotation (Placement(transformation(extent={{-10,-250},{10,-230}})));
  Control.signal_inverter_min_max signal_inverter_min_max(ctr_min=0, ctr_max=1)
    annotation (Placement(transformation(extent={{64,-222},{44,-202}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=-50)
    annotation (Placement(transformation(extent={{-74,-110},{-54,-90}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow=-50)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={32,-100})));
  Modelica.Blocks.Interfaces.RealInput valve_position annotation (Placement(
        transformation(
        origin={80,20},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        origin={66,18},
        extent={{-20,-20},{20,20}},
        rotation=270)));
equation
  connect(heating_fluid_out, val.port_b)
    annotation (Line(points={{220,-160},{88,-160}},  color={0,127,255}));
  connect(val.port_a, radiator.port_b)
    annotation (Line(points={{68,-160},{20,-160}},  color={0,127,255}));
  connect(heating_fluid_in, heating_fluid_in)
    annotation (Line(points={{-220,-160},{-220,-160}}, color={0,127,255}));
  connect(heating_fluid_in, bypass.port_a) annotation (Line(points={{-220,-160},
          {-140,-160},{-140,-240},{-10,-240}}, color={0,127,255}));
  connect(heating_fluid_in, radiator.port_a)
    annotation (Line(points={{-220,-160},{-20,-160}}, color={0,127,255}));
  connect(bypass.port_b, heating_fluid_out) annotation (Line(points={{10,-240},
          {160,-240},{160,-160},{220,-160}}, color={0,127,255}));
  connect(signal_inverter_min_max.inverted_signal, bypass.y)
    annotation (Line(points={{42,-212},{0,-212},{0,-228}}, color={0,0,127}));
  connect(fixedHeatFlow.port, radiator.heatPortCon) annotation (Line(points={{
          -54,-100},{-4,-100},{-4,-145.6}}, color={191,0,0}));
  connect(fixedHeatFlow1.port, radiator.heatPortRad)
    annotation (Line(points={{22,-100},{4,-100},{4,-145.6}}, color={191,0,0}));
  connect(valve_position, val.y)
    annotation (Line(points={{80,20},{80,-148},{78,-148}}, color={0,0,127}));
  connect(valve_position, signal_inverter_min_max.controler_signal) annotation (
     Line(points={{80,20},{82,20},{82,-40},{100,-40},{100,-212},{66,-212}},
        color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-220,-260},{
            220,0}})),
    experiment(Tolerance = 1e-6, StopTime = 15000),
    Documentation(revisions = "<html><head></head><body><div><br></div>
</body></html>", info = "<html><head></head><body><p>Model to simulate a simple house with one room, that can be attached to a HVAC system</p><ul>
</ul>
</body></html>"),
    __Dymola_Commands(file = "modelica://AixLib/Resources/Scripts/Dymola/Examples/Tutorial/SimpleHouse/SimpleHouse4.mos" "Simulate and plot"),
    Icon(coordinateSystem(extent={{-220,-260},{220,0}}),
         graphics={
        Rectangle(
          extent={{-222,0},{220,-220}},
          lineColor={162,29,33},
          fillColor={162,29,33},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-178,-46},{170,-118}},
          textColor={255,255,255},
          textString="%name"),
        Line(
          points={{-214,-162},{-198,-162},{-194,-150},{-192,-178},{-182,-150},{
              -182,-176},{-174,-152},{-172,-176},{-164,-152},{-158,-174},{-146,
              -150},{-140,-176},{-130,-152},{-124,-174},{-116,-152},{-108,-174},
              {-104,-152},{-96,-174},{-88,-152},{-82,-172},{-72,-154},{-68,-172},
              {-60,-150},{-52,-172},{-42,-148},{-36,-172},{-24,-150},{-18,-172}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-10,-150},{-2,-174},{12,-150},{16,-174},{28,-152},{32,-174},
              {42,-150},{46,-174},{60,-150},{62,-174},{78,-148},{84,-174},{94,
              -150},{100,-172},{108,-150},{116,-172},{120,-150},{128,-172},{136,
              -150},{142,-170},{152,-152},{156,-170},{164,-148},{172,-170},{182,
              -146},{188,-170},{196,-160},{210,-160}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-18,-172},{-10,-150}},
          color={28,108,200},
          thickness=1)}));
end Room_tubing_manuel;
