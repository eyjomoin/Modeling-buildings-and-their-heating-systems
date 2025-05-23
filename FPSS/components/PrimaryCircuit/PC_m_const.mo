within FPSS.components.PrimaryCircuit;
model PC_m_const
  replaceable package MediumAF = AixLib.Media.Antifreeze.PropyleneGlycolWater(X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction";
  parameter Parameter.TGA.TGA_base Parameter_TGA "parameter from parameter file";

  AixLib.Fluid.Sensors.TemperatureTwoPort TBorIn(redeclare package Medium = MediumAF, m_flow_nominal = Parameter_TGA.mflow_prim_max, T_start = Parameter_TGA.T_source-Parameter_TGA.DeltaT_prim, T(start = Parameter_TGA.T_source-Parameter_TGA.DeltaT_prim)) annotation (
    Placement(transformation(origin = {20, -100}, extent = {{10, -10}, {-10, 10}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort TBorOut(redeclare package Medium = MediumAF, m_flow_nominal = Parameter_TGA.mflow_prim_max,
    T(start=Parameter_TGA.T_source),
    T_start=Parameter_TGA.T_source)                                                                                                                                             annotation (
    Placement(transformation(origin = {-2, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b FluidPort_HP_prim_in(redeclare package
      Medium =                                                                          MediumAF) annotation (
    Placement(transformation(origin = {220, 80}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {104, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_a FluidPort_HP_prim_out(redeclare package
      Medium =                                                                           MediumAF) annotation (
    Placement(transformation(origin = {220, -100}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {108, -60}, extent = {{-10, -10}, {10, 10}})));
  AixLib.Fluid.Sources.Boundary_pT Sink(
    redeclare package Medium = MediumAF,
    p=Parameter_TGA.p_sec,
    T=Parameter_TGA.T_source,
    nPorts=1)                                                                                        annotation (
    Placement(transformation(origin={-52,-100},    extent = {{-10, -10}, {10, 10}})));
  AixLib.Fluid.Sources.MassFlowSource_T sou1(
    use_m_flow_in=true,
    nPorts=1,
    redeclare package Medium = MediumAF,
    T=Parameter_TGA.T_source)
    annotation (Placement(transformation(extent={{-62,70},{-42,90}})));
  AixLib.Fluid.Sensors.MassFlowRate mflow_primary(redeclare package Medium =
        MediumAF) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={98,80})));
  Modelica.Blocks.Sources.Constant const1(k=0.5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-130,90})));
  Control.BoreholeMassflow.CBM1_pump_const cbm1(
    mflow_min=Parameter_TGA.mflow_prim_min,
    mflow_max=Parameter_TGA.mflow_prim_max,
    DeltaT_bor=Parameter_TGA.DeltaT_prim)                                             annotation (Placement(
        transformation(origin={-90,120},extent={{-10,-10},{10,10}})));
equation
  connect(TBorIn.port_a, FluidPort_HP_prim_out) annotation (
    Line(points = {{30, -100}, {220, -100}}, color = {0, 127, 255}));
  connect(TBorIn.port_b, Sink.ports[1])
    annotation (Line(points={{10,-100},{-42,-100}}, color={0,127,255}));
  connect(sou1.ports[1], TBorOut.port_a) annotation (Line(points={{-42,80},{-12,
          80}},                   color={0,127,255}));
  connect(TBorOut.port_b, mflow_primary.port_a)
    annotation (Line(points={{8,80},{88,80}}, color={0,127,255}));
  connect(FluidPort_HP_prim_in, mflow_primary.port_b)
    annotation (Line(points={{220,80},{108,80}}, color={0,127,255}));
  connect(TBorOut.T, cbm1.T_Bor_out) annotation (Line(points={{-2,91},{-2,160},
          {-120,160},{-120,114},{-100,114}}, color={0,0,127}));
  connect(TBorIn.T, cbm1.T_Bor_in) annotation (Line(points={{20,-89},{20,0},{
          -160,0},{-160,126},{-100,126}}, color={0,0,127}));
  connect(cbm1.Control_m_flow, sou1.m_flow_in) annotation (Line(points={{-79,
          120},{-76,120},{-76,88},{-64,88}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-220, -220}, {220, 220}})),
    experiment(Tolerance = 1e-6, StopTime = 15000),
    Documentation(revisions = "<html><head></head><body><ul>
<li>Circuit with antifreeze medium. That way evaporation temperature can go below 0°C.</li>
</ul>
</body></html>", info="<html>
<p>Model for the primary circuit of the water to water heat pump. The Heat Pump is supplied by an infinitive source of brine with a temperature, that can be set in the Parameter file. The pump is controlled in a way that it generates a mass flow of brine to the heat pump so that a DeltaT is set, that was set in the Parameter file.</p>
</html>"),
    __Dymola_Commands(file = "modelica://AixLib/Resources/Scripts/Dymola/Examples/Tutorial/SimpleHouse/SimpleHouse4.mos" "Simulate and plot"),
    Icon(graphics={  Text(origin = {6, 8}, extent = {{-44, 50}, {44, -50}}, textString = "prim"), Line(origin = {6.04, -11.04}, points = {{53.9568, 71.0432}, {-36.0432, 71.0432}, {-56.0432, 63.0432}, {-70.0432, 47.0432}, {-76.0432, 35.0432}, {-76.0432, -0.956786}, {-76.0432, -26.9568}, {-62.0432, -38.9568}, {-40.0432, -48.9568}, {41.9568, -48.9568}, {53.9568, -48.9568}}, color = {0, 85, 255}, thickness = 4, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 10), Rectangle(origin = {-82, -7}, lineColor = {191, 96, 0}, fillColor = {170, 85, 0}, fillPattern = FillPattern.Solid, extent = {{-10, 31}, {10, -31}}), Rectangle(origin = {-59, -7}, lineColor = {191, 96, 0}, fillColor = {170, 85, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 30}, {9, -30}})}));
end PC_m_const;
