within FPSS.Einzelkomponenten.TGA_all.FloorHeating;
model TGA_rooms
  package MediumAir = AixLib.Media.Air "Medium model for air";
  replaceable package MediumAF = AixLib.Media.Antifreeze.PropyleneGlycolWater (X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction";
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  AixLib.Fluid.HeatPumps.ScrollWaterToWater HeatPump(dp1_nominal = 2000, dp2_nominal = 2000, datHeaPum = AixLib.Fluid.HeatPumps.Data.ScrollWaterToWater.Heating.ClimateMaster_TMW036_12kW_4_90COP_R410A(), m1_flow_nominal = 0.3, m2_flow_nominal = 0.3, tau1 = 15, tau2 = 15, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, redeclare
      package Medium1 =
        AixLib.Media.Antifreeze.PropyleneGlycolWater (                                                                                                                                                                                                        X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction", redeclare
      package Medium2 =
        AixLib.Media.Antifreeze.PropyleneGlycolWater (                                                                                                                                                                                                        X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction", TEvaMin = 274.15, T1_start = 308.15, scaling_factor = 0.5) annotation (
    Placement(transformation(origin={-12,-166},   extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FPSS.Einzelkomponenten.PrimaryCircuit.PC_prescribed PrimaryCircuit
    annotation (Placement(transformation(origin={-69,-165}, extent={{-25,-25},{
            25,25}})));
  Modelica.Blocks.Math.Gain Q_eva_pos(k = -1)  annotation (
    Placement(transformation(origin={-1,-141},    extent = {{-5, -5}, {5, 5}})));
  Einzelkomponenten.SecondaryCircuit.SC SecondaryCircuit
    annotation (Placement(transformation(extent={{24,-186},{62,-148}})));
  Einzelkomponenten.DataInput.DataInput DataInput(DeltaT=-5)
    annotation (Placement(transformation(extent={{-218,-198},{-132,-112}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.distribution_room
    distribution_room
    annotation (Placement(transformation(extent={{62,-146},{142,144}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R1 annotation (
      Placement(transformation(extent={{212,282},{227,297}}),iconTransformation(
          extent={{208,290},{223,305}})));
  AixLib.Utilities.Interfaces.RadPort rad_R1 annotation (Placement(
        transformation(extent={{212,300},{227,315}}),iconTransformation(extent={{208,308},
            {223,323}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R2 annotation (Placement(
        transformation(extent={{212,202},{227,217}}),iconTransformation(extent={{210,214},
            {225,229}})));
  AixLib.Utilities.Interfaces.RadPort rad_R2 annotation (Placement(
        transformation(extent={{212,220},{227,235}}),iconTransformation(extent={{210,232},
            {225,247}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R3 annotation (Placement(
        transformation(extent={{212,122},{227,137}}),
                                                    iconTransformation(extent={{214,132},
            {227,147}})));
  AixLib.Utilities.Interfaces.RadPort rad_R3 annotation (Placement(
        transformation(extent={{212,140},{227,155}}),iconTransformation(extent={{212,150},
            {227,165}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R4 annotation (Placement(
        transformation(extent={{212,42},{227,57}}),iconTransformation(extent={{212,50},
            {227,65}})));
  AixLib.Utilities.Interfaces.RadPort rad_R4 annotation (Placement(
        transformation(extent={{212,60},{227,75}}),iconTransformation(extent={{212,68},
            {227,83}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R5 annotation (Placement(
        transformation(extent={{212,-38},{227,-23}}),
                                                  iconTransformation(extent={{212,-30},
            {227,-15}})));
  AixLib.Utilities.Interfaces.RadPort rad_R5 annotation (Placement(
        transformation(extent={{212,-20},{227,-5}}),
                                                   iconTransformation(extent={{212,-12},
            {227,3}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_B annotation (Placement(
        transformation(extent={{212,-116},{227,-101}}),
                                                     iconTransformation(extent={{212,
            -108},{227,-93}})));
  AixLib.Utilities.Interfaces.RadPort rad_B annotation (Placement(
        transformation(extent={{212,-98},{227,-83}}),
                                                    iconTransformation(extent={{212,-90},
            {227,-75}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_K annotation (Placement(
        transformation(extent={{212,-198},{227,-183}}),
                                                     iconTransformation(extent={{212,
            -188},{227,-173}})));
  AixLib.Utilities.Interfaces.RadPort rad_K annotation (Placement(
        transformation(extent={{212,-180},{227,-165}}),
                                                     iconTransformation(extent={{212,
            -170},{227,-155}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_C annotation (Placement(
        transformation(extent={{212,-278},{227,-263}}),
                                                      iconTransformation(extent={{212,
            -268},{227,-253}})));
  AixLib.Utilities.Interfaces.RadPort rad_C annotation (Placement(
        transformation(extent={{212,-260},{227,-245}}),
                                                     iconTransformation(extent={{212,
            -250},{227,-235}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_U annotation (Placement(
        transformation(extent={{212,-358},{227,-343}}),iconTransformation(
          extent={{212,-348},{227,-333}})));
  AixLib.Utilities.Interfaces.RadPort rad_U annotation (Placement(
        transformation(extent={{212,-340},{227,-325}}),iconTransformation(
          extent={{212,-330},{227,-315}})));
  Modelica.Blocks.Interfaces.RealInput T_Room1(unit="K") annotation (Placement(
        transformation(origin={224,272},  extent={{10,-10},{-10,10}}),
        iconTransformation(origin={214,274},  extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room2(unit="K") annotation (Placement(
        transformation(origin={224,192},  extent={{10,-10},{-10,10}}),
        iconTransformation(origin={214,196},  extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room3(unit="K") annotation (Placement(
        transformation(origin={224,112}, extent={{10,-10},{-10,10}}),
        iconTransformation(origin={218,114}, extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room4(unit="K") annotation (Placement(
        transformation(origin={224,32},  extent={{10,-10},{-10,10}}),
        iconTransformation(origin={218,34},  extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room5(unit="K") annotation (Placement(
        transformation(origin={222,-48}, extent={{10,-10},{-10,10}}),
        iconTransformation(origin={216,-44}, extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Bathroom(unit="K") annotation (Placement(
        transformation(origin={224,-128}, extent={{10,-10},{-10,10}}),
        iconTransformation(origin={218,-124}, extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Kitchen(unit="K") annotation (Placement(
        transformation(origin={224,-208}, extent={{10,-10},{-10,10}}),
        iconTransformation(origin={218,-204}, extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Corridor(unit="K") annotation (Placement(
        transformation(origin={224,-288},  extent={{10,-10},{-10,10}}),
        iconTransformation(origin={218,-286},  extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Utilityroom(unit="K") annotation (Placement(
        transformation(origin={224,-368},  extent={{10,-10},{-10,10}}),
        iconTransformation(origin={218,-366},  extent={{10,-10},{-10,10}})));
equation
  connect(PrimaryCircuit.FluidPort_HP_prim_in, HeatPump.port_a2) annotation (
    Line(points={{-43,-150},{-18,-150},{-18,-156}},        color = {0, 127, 255}));
  connect(PrimaryCircuit.FluidPort_HP_prim_out, HeatPump.port_b2) annotation (
    Line(points={{-42,-180},{-18,-180},{-18,-176}},        color = {0, 127, 255}));
  connect(HeatPump.QEva_flow, Q_eva_pos.u) annotation (
    Line(points={{-21,-155},{-21,-141},{-7,-141}},        color = {0, 0, 127}));
  connect(SecondaryCircuit.FluidPort_HP_SC_in, HeatPump.port_a1) annotation (
      Line(points={{22.1,-180.3},{-6,-180.3},{-6,-176}},
                                                       color={0,127,255}));
  connect(HeatPump.port_b1, SecondaryCircuit.FluidPort_HP_SC_out) annotation (
      Line(points={{-6,-156},{-6,-153.7},{22.1,-153.7}},
                                                       color={0,127,255}));
  connect(SecondaryCircuit.signal_ctr_HP, HeatPump.y) annotation (Line(points={{46.8,
          -187.9},{46.8,-202},{-9,-202},{-9,-178}},      color={0,0,127}));
  connect(DataInput.T_amb_mod, SecondaryCircuit.Temperature_amb) annotation (
      Line(points={{-127.7,-129.2},{52.5,-129.2},{52.5,-144.2}},
                                                               color={0,0,127}));
  connect(DataInput.T_sup_hp_prim, PrimaryCircuit.Temp_prim_source) annotation (
     Line(points={{-127.7,-146.4},{-116,-146.4},{-116,-158},{-99,-158}},
                                                                      color={0,
          0,127}));
  connect(DataInput.m_flow_hp_prim, PrimaryCircuit.mflow_HP_primary)
    annotation (Line(points={{-127.7,-163.6},{-120,-163.6},{-120,-143},{-99,-143}},
        color={0,0,127}));
  connect(SecondaryCircuit.FluidPort_supply_rooms, distribution_room.FluidPort_ret_main)
    annotation (Line(points={{62,-153.7},{76,-153.7},{76,-154},{94,-154},{94,-146}},
        color={0,127,255}));
  connect(SecondaryCircuit.FluidPort_return_rooms, distribution_room.FluidPort_sup_main)
    annotation (Line(points={{62,-180.3},{110,-180.3},{110,-146}}, color={0,127,
          255}));
  connect(T_Utilityroom, distribution_room.T_Utilityroom) annotation (Line(
        points={{224,-368},{160,-368},{160,-141.857},{141.2,-141.857}}, color={
          0,0,127}));
  connect(conv_U, distribution_room.conv_U) annotation (Line(points={{219.5,
          -350.5},{180,-350.5},{180,-131.293},{141.8,-131.293}}, color={191,0,0}));
  connect(rad_U, distribution_room.rad_U) annotation (Line(points={{219.5,
          -332.5},{194,-332.5},{194,-123.836},{141.8,-123.836}}, color={0,0,0}));
  connect(T_Corridor, distribution_room.T_Corridor) annotation (Line(points={{224,
          -288},{160,-288},{160,-108.714},{141.2,-108.714}},     color={0,0,127}));
  connect(T_Kitchen, distribution_room.T_Kitchen) annotation (Line(points={{224,
          -208},{160,-208},{160,-74.7429},{141.2,-74.7429}}, color={0,0,127}));
  connect(conv_C, distribution_room.conv_C) annotation (Line(points={{219.5,-270.5},
          {180,-270.5},{180,-98.15},{141.8,-98.15}}, color={191,0,0}));
  connect(conv_K, distribution_room.conv_K) annotation (Line(points={{219.5,
          -190.5},{180,-190.5},{180,-65.0071},{141.8,-65.0071}}, color={191,0,0}));
  connect(rad_C, distribution_room.rad_C) annotation (Line(points={{219.5,
          -252.5},{194,-252.5},{194,-90.6929},{141.8,-90.6929}}, color={0,0,0}));
  connect(rad_K, distribution_room.rad_K) annotation (Line(points={{219.5,-172.5},
          {194,-172.5},{194,-57.55},{141.8,-57.55}}, color={0,0,0}));
  connect(T_Bathroom, distribution_room.T_Bathroom) annotation (Line(points={{
          224,-128},{160,-128},{160,-41.6},{141.2,-41.6}}, color={0,0,127}));
  connect(conv_B, distribution_room.conv_B) annotation (Line(points={{219.5,
          -108.5},{180,-108.5},{180,-31.8643},{141.8,-31.8643}}, color={191,0,0}));
  connect(rad_B, distribution_room.rad_B) annotation (Line(points={{219.5,-90.5},
          {194,-90.5},{194,-24.4071},{141.8,-24.4071}}, color={0,0,0}));
  connect(T_Room5, distribution_room.T_Room5) annotation (Line(points={{222,-48},
          {160,-48},{160,-8.45714},{140.4,-8.45714}}, color={0,0,127}));
  connect(conv_R5, distribution_room.conv_R5) annotation (Line(points={{219.5,-30.5},
          {180,-30.5},{180,0.45},{141.8,0.45}}, color={191,0,0}));
  connect(rad_R5, distribution_room.rad_R5) annotation (Line(points={{219.5,-12.5},
          {194,-12.5},{194,7.90714},{141.8,7.90714}}, color={0,0,0}));
  connect(T_Room4, distribution_room.T_Room4) annotation (Line(points={{224,32},
          {160,32},{160,23.8571},{141.2,23.8571}}, color={0,0,127}));
  connect(conv_R4, distribution_room.conv_R4) annotation (Line(points={{219.5,
          49.5},{180,49.5},{180,33.5929},{141.8,33.5929}}, color={191,0,0}));
  connect(rad_R4, distribution_room.rad_R4) annotation (Line(points={{219.5,
          67.5},{194,67.5},{194,41.05},{141.8,41.05}}, color={0,0,0}));
  connect(T_Room3, distribution_room.T_Room3) annotation (Line(points={{224,112},
          {160,112},{160,57},{141.2,57}}, color={0,0,127}));
  connect(conv_R3, distribution_room.conv_R3) annotation (Line(points={{219.5,
          129.5},{180,129.5},{180,67.5643},{142.2,67.5643}}, color={191,0,0}));
  connect(rad_R3, distribution_room.rad_R3) annotation (Line(points={{219.5,
          147.5},{196,147.5},{196,75.0214},{141.8,75.0214}}, color={0,0,0}));
  connect(T_Room2, distribution_room.T_Room2) annotation (Line(points={{224,192},
          {160,192},{160,90.9714},{139.6,90.9714}}, color={0,0,127}));
  connect(conv_R2, distribution_room.conv_R2) annotation (Line(points={{219.5,
          209.5},{180,209.5},{180,101.536},{141,101.536}}, color={191,0,0}));
  connect(rad_R2, distribution_room.rad_R2) annotation (Line(points={{219.5,
          227.5},{196,227.5},{196,108.993},{141,108.993}}, color={0,0,0}));
  connect(T_Room1, distribution_room.T_Room1) annotation (Line(points={{224,272},
          {160,272},{160,123.286},{139.6,123.286}}, color={0,0,127}));
  connect(conv_R1, distribution_room.conv_R1) annotation (Line(points={{219.5,
          289.5},{180,289.5},{180,133.021},{140.2,133.021}}, color={191,0,0}));
  connect(rad_R1, distribution_room.rad_R1) annotation (Line(points={{219.5,
          307.5},{196,307.5},{196,140.479},{140.2,140.479}}, color={0,0,0}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-60,-380},{220,
            320}})),
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
    Icon(coordinateSystem(extent={{-60,-380},{220,320}}), graphics={Text(
          extent={{-207,257},{207,-257}},
          textColor={0,0,0},
          textString="TGA",
          origin={65,-1},
          rotation=90), Rectangle(
          extent={{-46,296},{192,-366}},
          lineColor={244,125,35},
          lineThickness=1)}));
end TGA_rooms;
