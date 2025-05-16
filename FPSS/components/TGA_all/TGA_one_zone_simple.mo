within FPSS.components.TGA_all;
model TGA_one_zone_simple
  replaceable package MediumAF = AixLib.Media.Antifreeze.PropyleneGlycolWater(X_a = 0.40, property_T = 293.15) "Propylene glycol water, 40% mass fraction";
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  replaceable parameter FPSS.Parameter.TGA.P_one_zone_start Parameter_TGA constrainedby
    FPSS.Parameter.TGA.P_one_zone_start                                                                                     annotation (
     Placement(transformation(extent={{-118,28},{-98,48}})),
     choicesAllMatching = true);
  AixLib.Fluid.HeatPumps.ScrollWaterToWater HeatPump(dp1_nominal = 2000, dp2_nominal = 2000,
    T2_start=Parameter_TGA.T_source,
    enable_temperature_protection=true,
    TConMax(displayUnit="K") = 340,                                                          datHeaPum = AixLib.Fluid.HeatPumps.Data.ScrollWaterToWater.Heating.ClimateMaster_TMW036_12kW_4_90COP_R410A(), m1_flow_nominal = Parameter_TGA.mflow_prim_max, m2_flow_nominal = Parameter_TGA.mflow_sec_max,
    tau1=15,                                                                                                                                                                                                        tau2 = 15, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, redeclare
      package Medium1 =                                                                                                                                                                                                         MediumAF, redeclare
      package Medium2 =                                                                                                                                                                                                         MediumAF,
    T1_start=Parameter_TGA.T_room_set+10,                                                                                                                                                                                                        scaling_factor = Parameter_TGA.scaling_factor_HP) annotation (
    Placement(transformation(origin = {-42, 2}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  FPSS.components.PrimaryCircuit.PC_m_const PrimaryCircuit annotation (
      Placement(transformation(origin={-99,3}, extent={{-25,-25},{25,25}})));
  FPSS.components.SecondaryCircuit.SC5_simple SecondaryCircuit(T_room_set=
        Parameter_TGA.T_room_set) annotation (Placement(transformation(origin={
            -68,38}, extent={{62,-56},{100,-18}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R1 annotation (
    Placement(transformation(origin = {-40, 40}, extent = {{132, -48}, {147, -33}}), iconTransformation(extent={{92,-6},
            {107,9}})));
  AixLib.Utilities.Interfaces.RadPort rad_R1 annotation (
    Placement(transformation(origin={-40,50},    extent = {{132, -18}, {147, -3}}), iconTransformation(extent={{92,42},
            {107,57}})));
  Modelica.Blocks.Interfaces.RealInput T_Room1(unit = "K") annotation (
    Placement(transformation(origin={104,-40},    extent = {{10, -10}, {-10, 10}}), iconTransformation(origin={100,-40},     extent = {{10, -10}, {-10, 10}})));
  FPSS.components.reverse_sign Q_eva_pos annotation (Placement(transformation(
          origin={-68,38}, extent={{26,-12},{36,-6}})));
  Modelica.Blocks.Interfaces.RealInput T_amb(unit = "K") annotation (
    Placement(transformation(origin={-20,60},     extent = {{10, -10}, {-10, 10}}, rotation=90),    iconTransformation(origin={-20,50},     extent = {{10, -10}, {-10, 10}}, rotation = 90)));
equation
  connect(PrimaryCircuit.FluidPort_HP_prim_in, HeatPump.port_a2) annotation (
    Line(points = {{-73, 18}, {-48, 18}, {-48, 12}}, color = {0, 127, 255}));
  connect(PrimaryCircuit.FluidPort_HP_prim_out, HeatPump.port_b2) annotation (
    Line(points = {{-72, -12}, {-48, -12}, {-48, -8}}, color = {0, 127, 255}));
  connect(SecondaryCircuit.FP_SC1_out, HeatPump.port_a1) annotation (
    Line(points = {{-7.9, -12.3}, {-36, -12.3}, {-36, -8}}, color = {0, 127, 255}));
  connect(HeatPump.port_b1, SecondaryCircuit.FP_SC1_in) annotation (
    Line(points = {{-36, 12}, {-36, 14.3}, {-7.9, 14.3}}, color = {0, 127, 255}));
  connect(SecondaryCircuit.signal_ctr_HP, HeatPump.y) annotation (
    Line(points = {{16.8, -19.9}, {16.8, -34}, {-39, -34}, {-39, -10}}, color = {0, 0, 127}));
  connect(HeatPump.QEva_flow, Q_eva_pos.x_in) annotation (
    Line(points = {{-51, 13}, {-50, 13}, {-50, 29}, {-43, 29}}, color = {0, 0, 127}));
  connect(T_Room1, SecondaryCircuit.T_room) annotation (
    Line(points={{104,-40},{52,-40},{52,-10.4},{32,-10.4}},          color = {0, 0, 127}));
  connect(conv_R1, SecondaryCircuit.thermConv) annotation (
    Line(points = {{99.5, -0.5}, {52, -0.5}, {52, 0.62}, {32, 0.62}}, color = {191, 0, 0}));
  connect(rad_R1, SecondaryCircuit.starRad) annotation (
    Line(points={{99.5,39.5},{52,39.5},{52,11.64},{32,11.64}}));
  connect(T_amb, SecondaryCircuit.Temperature_amb) annotation (Line(points={{
          -20,60},{-20,40},{24.4,40},{24.4,23.8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-120, -50}, {100, 50}})),
    experiment(Tolerance = 1e-6, StopTime = 1000000),
    Documentation(revisions = "<html><head></head><body><div><br></div>
</body></html>", info = "<html><head></head><body><p>Simple model for a heating system: The heat pump takes heat from the primary circuit and transfers it to the house via the secondary circuit. On the right side are the connectors to the house.</p>
</body></html>"),
    __Dymola_Commands(file = "modelica://AixLib/Resources/Scripts/Dymola/Examples/Tutorial/SimpleHouse/SimpleHouse4.mos" "Simulate and plot"),
    Icon(coordinateSystem(extent = {{-120, -50}, {100, 50}}), graphics={  Text(origin={-11.5,
              -3.5},                                                                                rotation=180,  extent={{-66.5,
              89.5},{66.5,-89.5}},                                                                                                                      textString = "TGA"), Rectangle(lineColor = {244, 125, 35}, lineThickness = 1, extent={{-120,50},
              {100,-50}})}));
end TGA_one_zone_simple;
