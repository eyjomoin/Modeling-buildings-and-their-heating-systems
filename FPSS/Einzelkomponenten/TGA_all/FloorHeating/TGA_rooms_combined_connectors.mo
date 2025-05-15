within FPSS.Einzelkomponenten.TGA_all.FloorHeating;
model TGA_rooms_combined_connectors
  package MediumAir = AixLib.Media.Air "Medium model for air";
  replaceable package MediumAF = AixLib.Media.Antifreeze.PropyleneGlycolWater (X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction";
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  AixLib.Fluid.HeatPumps.ScrollWaterToWater HeatPump(dp1_nominal = 2000, dp2_nominal = 2000, datHeaPum = AixLib.Fluid.HeatPumps.Data.ScrollWaterToWater.Heating.ClimateMaster_TMW036_12kW_4_90COP_R410A(), m1_flow_nominal = 0.3, m2_flow_nominal = 0.3, tau1 = 15, tau2 = 15, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, redeclare
      package Medium1 =
        AixLib.Media.Antifreeze.PropyleneGlycolWater (                                                                                                                                                                                                        X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction", redeclare
      package Medium2 =
        AixLib.Media.Antifreeze.PropyleneGlycolWater (                                                                                                                                                                                                        X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction", TEvaMin = 274.15, T1_start = 308.15, scaling_factor = 0.5) annotation (
    Placement(transformation(origin={38,-4},      extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FPSS.Einzelkomponenten.PrimaryCircuit.PC_prescribed PrimaryCircuit
    annotation (Placement(transformation(origin={-19,-3}, extent={{-25,-25},{25,
            25}})));
  Modelica.Blocks.Math.Gain Q_eva_pos(k = -1)  annotation (
    Placement(transformation(origin={49,21},      extent = {{-5, -5}, {5, 5}})));
  Einzelkomponenten.SecondaryCircuit.SC SecondaryCircuit
    annotation (Placement(transformation(extent={{74,-24},{112,14}})));
  Einzelkomponenten.DataInput.DataInput DataInput(DeltaT=-5)
    annotation (Placement(transformation(extent={{-168,-36},{-82,50}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_rooms[9] annotation (Placement(
        transformation(extent={{214,12},{229,27}}), iconTransformation(extent={
            {214,12},{229,27}})));
  AixLib.Utilities.Interfaces.RadPort rad_rooms[9] annotation (Placement(
        transformation(extent={{212,74},{227,89}}), iconTransformation(extent={
            {212,74},{227,89}})));
  Modelica.Blocks.Interfaces.RealInput T_Rooms[9](unit="K") annotation (Placement(
        transformation(origin={224,-40}, extent={{10,-10},{-10,10}}),
        iconTransformation(origin={224,-40}, extent={{10,-10},{-10,10}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.distribution_room_combined_connectors
    distribution_room_combined_connectors
    annotation (Placement(transformation(extent={{132,22},{172,110}})));
equation
  connect(PrimaryCircuit.FluidPort_HP_prim_in, HeatPump.port_a2) annotation (
    Line(points={{7,12},{32,12},{32,6}},                   color = {0, 127, 255}));
  connect(PrimaryCircuit.FluidPort_HP_prim_out, HeatPump.port_b2) annotation (
    Line(points={{8,-18},{32,-18},{32,-14}},               color = {0, 127, 255}));
  connect(HeatPump.QEva_flow, Q_eva_pos.u) annotation (
    Line(points={{29,7},{29,21},{43,21}},                 color = {0, 0, 127}));
  connect(SecondaryCircuit.FluidPort_HP_SC_in, HeatPump.port_a1) annotation (
      Line(points={{72.1,-18.3},{44,-18.3},{44,-14}},  color={0,127,255}));
  connect(HeatPump.port_b1, SecondaryCircuit.FluidPort_HP_SC_out) annotation (
      Line(points={{44,6},{44,8.3},{72.1,8.3}},        color={0,127,255}));
  connect(SecondaryCircuit.signal_ctr_HP, HeatPump.y) annotation (Line(points={{96.8,
          -25.9},{96.8,-40},{41,-40},{41,-16}},          color={0,0,127}));
  connect(DataInput.T_amb_mod, SecondaryCircuit.Temperature_amb) annotation (
      Line(points={{-77.7,32.8},{102.5,32.8},{102.5,17.8}},    color={0,0,127}));
  connect(DataInput.T_sup_hp_prim, PrimaryCircuit.Temp_prim_source) annotation (
     Line(points={{-77.7,15.6},{-66,15.6},{-66,4},{-49,4}},           color={0,
          0,127}));
  connect(DataInput.m_flow_hp_prim, PrimaryCircuit.mflow_HP_primary)
    annotation (Line(points={{-77.7,-1.6},{-70,-1.6},{-70,19},{-49,19}},
        color={0,0,127}));
  connect(SecondaryCircuit.FluidPort_supply_rooms,
    distribution_room_combined_connectors.FluidPort_ret_main) annotation (Line(
        points={{112,8.3},{148,8.3},{148,22}}, color={0,127,255}));
  connect(SecondaryCircuit.FluidPort_return_rooms,
    distribution_room_combined_connectors.FluidPort_sup_main) annotation (Line(
        points={{112,-18.3},{156,-18.3},{156,22}}, color={0,127,255}));
  connect(distribution_room_combined_connectors.rad_rooms, rad_rooms)
    annotation (Line(points={{172,88},{200,88},{200,81.5},{219.5,81.5}}, color=
          {0,0,0}));
  connect(distribution_room_combined_connectors.conv_rooms, conv_rooms)
    annotation (Line(points={{172,70},{200,70},{200,19.5},{221.5,19.5}}, color=
          {191,0,0}));
  connect(distribution_room_combined_connectors.T_Rooms, T_Rooms) annotation (
      Line(points={{171.6,50},{180,50},{180,-40},{224,-40}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-180,-80},{220,
            120}})),
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
    Icon(coordinateSystem(extent={{-180,-80},{220,120}}), graphics={Text(
          extent={{-150,186},{150,-186}},
          textColor={0,0,0},
          textString="TGA",
          origin={14,12},
          rotation=0),  Rectangle(
          extent={{-180,120},{220,-80}},
          lineColor={244,125,35},
          lineThickness=1)}));
end TGA_rooms_combined_connectors;
