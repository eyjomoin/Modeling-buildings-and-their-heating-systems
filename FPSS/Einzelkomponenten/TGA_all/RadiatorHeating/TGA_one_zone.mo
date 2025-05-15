within FPSS.Einzelkomponenten.TGA_all.RadiatorHeating;
model TGA_one_zone
  replaceable package MediumAF = AixLib.Media.Antifreeze.PropyleneGlycolWater (X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction";
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  replaceable parameter FPSS.Parameter.TGA.P_one_zone_start Parameter_TGA
    constrainedby FPSS.Parameter.TGA.P_one_zone_start annotation (Placement(
        transformation(extent={{40,30},{60,50}})), choicesAllMatching=true);

  AixLib.Fluid.HeatPumps.ScrollWaterToWater HeatPump(
    dp1_nominal = 2000,
    dp2_nominal = 2000,
    datHeaPum = AixLib.Fluid.HeatPumps.Data.ScrollWaterToWater.Heating.ClimateMaster_TMW036_12kW_4_90COP_R410A(),
    m1_flow_nominal = Parameter_TGA.mflow_prim_max,
    m2_flow_nominal = Parameter_TGA.mflow_sec_max,
    tau1 = 15,
    tau2 = 15,
    energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare package Medium1 = MediumAF,
    redeclare package Medium2 = MediumAF,
    T1_start=313.15,
    scaling_factor=Parameter_TGA.scaling_factor_HP) annotation (
    Placement(transformation(origin={26,-36},     extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FPSS.Einzelkomponenten.PrimaryCircuit.PC_const PrimaryCircuit annotation (
      Placement(transformation(origin={-31,-35}, extent={{-25,-25},{25,25}})));
  FPSS.Einzelkomponenten.SecondaryCircuit.SC4_one_pump
                                        SecondaryCircuit
    annotation (Placement(transformation(extent={{62,-56},{100,-18}})));
  FPSS.Einzelkomponenten.DataInput.Measurements.Input_weather DataInput(DeltaT=
        0) annotation (Placement(transformation(extent={{-180,-68},{-94,18}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R1 annotation (
      Placement(transformation(extent={{212,-8},{227,7}}),   iconTransformation(
          extent={{214,-6},{229,9}})));
  AixLib.Utilities.Interfaces.RadPort rad_R1 annotation (Placement(
        transformation(extent={{212,52},{227,67}}),  iconTransformation(extent={{212,152},
            {227,167}})));
  Modelica.Blocks.Interfaces.RealInput T_Room1(unit="K") annotation (Placement(
        transformation(origin={220,-60},  extent={{10,-10},{-10,10}}),
        iconTransformation(origin={220,-180}, extent={{10,-10},{-10,10}})));
  FPSS.Einzelkomponenten.SecondaryCircuit.Distribution_Radiator.distribution_one_zone
    distribution_one_zone(T_room_set=Parameter_TGA.T_room_set, m_flow_max=Parameter_TGA.mflow_sec_max,
    Q_flow_nominal=Parameter_TGA.Qflow_max)
    annotation (Placement(transformation(extent={{120,-20},{160,20}})));
  FPSS.Einzelkomponenten.reverse_sign Q_eva_pos
    annotation (Placement(transformation(extent={{34,-16},{54,4}})));
  FPSS.Einzelkomponenten.DataInput.Measurements.Input_Q input_Q
    annotation (Placement(transformation(extent={{-160,40},{-140,64}})));
equation
  connect(PrimaryCircuit.FluidPort_HP_prim_in, HeatPump.port_a2) annotation (
    Line(points={{-5,-20},{20,-20},{20,-26}},              color = {0, 127, 255}));
  connect(PrimaryCircuit.FluidPort_HP_prim_out, HeatPump.port_b2) annotation (
    Line(points={{-4,-50},{20,-50},{20,-46}},              color = {0, 127, 255}));
  connect(SecondaryCircuit.FP_SC1_out, HeatPump.port_a1) annotation (Line(
        points={{60.1,-50.3},{32,-50.3},{32,-46}}, color={0,127,255}));
  connect(HeatPump.port_b1, SecondaryCircuit.FP_SC1_in) annotation (Line(points
        ={{32,-26},{32,-23.7},{60.1,-23.7}}, color={0,127,255}));
  connect(SecondaryCircuit.signal_ctr_HP, HeatPump.y) annotation (Line(points={{84.8,
          -57.9},{84.8,-72},{29,-72},{29,-48}},          color={0,0,127}));
  connect(DataInput.T_amb_mod, SecondaryCircuit.Temperature_amb) annotation (
      Line(points={{-89.7,0.8},{-72,0.8},{-72,20},{92.4,20},{92.4,-14.2}},
                                                               color={0,0,127}));
  connect(SecondaryCircuit.FP_SC2_out, distribution_one_zone.FluidPort_sup_distributor)
    annotation (Line(points={{100,-23.7},{108,-23.7},{108,-24},{136,-24},{136,-20}},
        color={0,127,255}));
  connect(SecondaryCircuit.FP_SC2_in, distribution_one_zone.FluidPort_ret_distributor)
    annotation (Line(points={{100,-50.3},{116,-50.3},{116,-50},{144,-50},{144,-20}},
        color={0,127,255}));
  connect(rad_R1, distribution_one_zone.rad_R1) annotation (Line(points={{219.5,
          59.5},{180,59.5},{180,6.55556},{159.9,6.55556}}, color={0,0,0}));
  connect(conv_R1, distribution_one_zone.conv_R1) annotation (Line(points={{
          219.5,-0.5},{204,-0.5},{204,2.55556},{159.9,2.55556}}, color={191,0,0}));
  connect(T_Room1, distribution_one_zone.T_Room1) annotation (Line(points={{220,
          -60},{180,-60},{180,-2.66667},{159.6,-2.66667}}, color={0,0,127}));
  connect(HeatPump.QEva_flow, Q_eva_pos.x_in)
    annotation (Line(points={{17,-25},{17,-6},{32,-6}}, color={0,0,127}));
  connect(distribution_one_zone.valve_room, SecondaryCircuit.valve_room)
    annotation (Line(points={{118,13.3333},{102,13.3333},{102,12},{81,12},{81,
          -14.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(                             extent={{-200,-80},{220,
            80}})),
    experiment(Tolerance = 1e-6, StopTime = 1000000),
    Documentation(revisions = "<html><head></head><body><ul>
<li>Controlling of Supply temperature and Roomtemperature summarised in one Component each</li>
</ul>
</body></html>", info="<html>
<p>Model to simulate the HVAC System of a Building in Karlsruhe, Germany. The Building is the &quot;Living Lab Energy Campus Experimentalgeb&auml;ude (LLEC)&quot; at &quot;Karlsruher Institut f&uuml;r Technologie (KIT)&quot;.</p>
<p>Pumpe auf konstantes dp geregelt</p>
<p>Heizungsmischer &uuml;ber Heizkurve geregelt</p>
<p>WP so geregelt, dass sich Heizungsmischer control signal auf ca. 0.8 einpendelt.</p>
</html>"),
    __Dymola_Commands(file = "modelica://AixLib/Resources/Scripts/Dymola/Examples/Tutorial/SimpleHouse/SimpleHouse4.mos" "Simulate and plot"),
    Icon(coordinateSystem(extent={{20,-200},{220,180}}),  graphics={Text(
          extent={{-138,165},{138,-165}},
          textColor={0,0,0},
          textString="TGA",
          origin={117,-20},
          rotation=90), Rectangle(
          extent={{38,166},{208,-184}},
          lineColor={244,125,35},
          lineThickness=1)}));
end TGA_one_zone;
