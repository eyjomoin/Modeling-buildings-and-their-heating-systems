within FPSS.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms;
model distribution_one_zone
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Real factor_pha=1 "Factor that can be used if panel heating area is to small or to big";
  parameter Real T_multizone_set(unit="C") = 21  "set temperature in the zone";
  AixLib.Fluid.HeatExchangers.ActiveWalls.Distributor
              distributor(
    redeclare package Medium = MediumWater,
    T_start=307.15,
    m_flow_nominal=0.5,
    n=1)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-60})));
  Modelica.Blocks.Sources.Constant T_set_multizone(k=273.15 + T_multizone_set)
                                                                  annotation (
      Placement(transformation(origin={82,0},   extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room1(unit="K") annotation (Placement(
        transformation(origin={-110,0},   extent={{-10,-10},{10,10}}),
        iconTransformation(origin={98,-2},    extent={{10,-10},{-10,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R1 annotation (
      Placement(transformation(extent={{92,32},{107,47}}),   iconTransformation(
          extent={{92,14},{107,29}})));
  AixLib.Utilities.Interfaces.RadPort rad_R1 annotation (Placement(
        transformation(extent={{92,50},{107,65}}),   iconTransformation(extent={{92,32},
            {107,47}})));
  Modelica.Fluid.Interfaces.FluidPort_a FluidPort_ret_main(redeclare package
      Medium = MediumWater) annotation (Placement(transformation(origin={-20,-100},
          extent={{-10,-10},{10,10}}), iconTransformation(origin={-20,-80},
          extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b FluidPort_sup_main(redeclare package
      Medium = MediumWater)                                                                        annotation (Placement(
        transformation(origin={20,-100}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={20,-80},  extent={{-10,-10},{10,10}})));
  SecondaryCircuit.Distribution_to_rooms.Room_tubing one_zone(
      mflow_heating_fluid=0.2, panelHeatingArea=115.96)
    annotation (Placement(transformation(extent={{-24,-14},{20,8}})));
equation
  connect(FluidPort_ret_main, FluidPort_ret_main)
    annotation (Line(points={{-20,-100},{-20,-100}}, color={0,127,255}));
  connect(FluidPort_sup_main, FluidPort_sup_main)
    annotation (Line(points={{20,-100},{20,-100}}, color={0,127,255}));
  connect(distributor.mainFlow, FluidPort_ret_main) annotation (Line(points={{
          -10.6667,-80},{-10.6667,-88},{-20,-88},{-20,-100}},
                                                        color={0,127,255}));
  connect(distributor.mainReturn, FluidPort_sup_main) annotation (Line(points={{10,-80},
          {10,-88},{20,-88},{20,-100}},            color={0,127,255}));
  connect(T_set_multizone.y, one_zone.T_room_set)
    annotation (Line(points={{71,0},{22.2,0}}, color={0,0,127}));
  connect(distributor.flowPorts[1], one_zone.Floorheating_in) annotation (Line(
        points={{-20,-60},{-40,-60},{-40,-8.2},{-24.2,-8.2}}, color={0,127,255}));
  connect(distributor.returnPorts[1], one_zone.Floorheating_out) annotation (
      Line(points={{20.6667,-60},{40,-60},{40,-7.8},{20,-7.8}}, color={0,127,
          255}));
  connect(conv_R1, one_zone.thermConv) annotation (Line(points={{99.5,39.5},{
          4.2,39.5},{4.2,8}}, color={191,0,0}));
  connect(rad_R1, one_zone.starRad)
    annotation (Line(points={{99.5,57.5},{-8,57.5},{-8,8}}, color={0,0,0}));
  connect(T_Room1, one_zone.T_room)
    annotation (Line(points={{-110,0},{-26.4,0},{-26.4,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -80},{100,100}}),
                         graphics={
        Line(
          points={{-60,-80},{-60,2}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{60,-80},{60,2}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,0},{-50,30},{-40,60},{-20,80},{20,80},{40,60},{60,0}},
          color={28,108,200},
          thickness=1)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end distribution_one_zone;
