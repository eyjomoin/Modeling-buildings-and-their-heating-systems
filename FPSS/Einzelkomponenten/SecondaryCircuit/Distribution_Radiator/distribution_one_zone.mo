within FPSS.Einzelkomponenten.SecondaryCircuit.Distribution_Radiator;
model distribution_one_zone
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Modelica.Units.SI.Temperature T_room_set "Set temperature of the room";
  parameter Modelica.Units.SI.MassFlowRate m_flow_max "Maximum mass flow rate of heating medium";
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_nominal = 2000 "nominal heat flow";
  Distributor_Thilo
              distributor_Thilo(
    redeclare package Medium = MediumWater,
    T_start=307.15,
    m_flow_nominal=m_flow_max,
    n=1)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-60})));
  Modelica.Blocks.Sources.Constant T_set_multizone(k=T_room_set)  annotation (
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
  Modelica.Fluid.Interfaces.FluidPort_a FluidPort_sup_distributor(redeclare
      package Medium = MediumWater) annotation (Placement(transformation(origin
          ={-20,-100}, extent={{-10,-10},{10,10}}), iconTransformation(origin={
            -20,-80}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b FluidPort_ret_distributor(redeclare
      package Medium = MediumWater) annotation (Placement(transformation(origin
          ={20,-100}, extent={{-10,-10},{10,10}}), iconTransformation(origin={
            20,-80}, extent={{-10,-10},{10,10}})));
  Room_tubing one_zone(mflow_nominal=0.3, Q_flow_nominal=Q_flow_nominal)
    annotation (Placement(transformation(extent={{-24,-14},{20,8}})));
  Modelica.Blocks.Interfaces.RealOutput valve_room annotation (Placement(
        transformation(
        origin={-110,60},
        extent={{-10,-10},{10,10}},
        rotation=180), iconTransformation(
        origin={-110,70},
        extent={{-10,-10},{10,10}},
        rotation=180)));
equation
  connect(FluidPort_sup_distributor, FluidPort_sup_distributor)
    annotation (Line(points={{-20,-100},{-20,-100}}, color={0,127,255}));
  connect(FluidPort_ret_distributor, FluidPort_ret_distributor)
    annotation (Line(points={{20,-100},{20,-100}}, color={0,127,255}));
  connect(distributor_Thilo.mainFlow, FluidPort_sup_distributor) annotation (
      Line(points={{-10.6667,-80},{-10.6667,-88},{-20,-88},{-20,-100}}, color={
          0,127,255}));
  connect(distributor_Thilo.mainReturn, FluidPort_ret_distributor) annotation (
      Line(points={{10,-80},{10,-88},{20,-88},{20,-100}}, color={0,127,255}));
  connect(T_set_multizone.y, one_zone.T_room_set)
    annotation (Line(points={{71,0},{46,0},{46,1.23077},{22.2,1.23077}},
                                               color={0,0,127}));
  connect(distributor_Thilo.flowPorts[1], one_zone.heating_fluid_in)
    annotation (Line(points={{-20,-60},{-40,-60},{-40,-5.70769},{-24.2,-5.70769}},
        color={0,127,255}));
  connect(distributor_Thilo.returnPorts[1], one_zone.heating_fluid_out)
    annotation (Line(points={{20.6667,-60},{40,-60},{40,-5.36923},{20,-5.36923}},
                                                                          color
        ={0,127,255}));
  connect(conv_R1, one_zone.thermConv) annotation (Line(points={{99.5,39.5},{
          4.2,39.5},{4.2,8}}, color={191,0,0}));
  connect(rad_R1, one_zone.starRad)
    annotation (Line(points={{99.5,57.5},{-8,57.5},{-8,8}}, color={0,0,0}));
  connect(T_Room1, one_zone.T_room)
    annotation (Line(points={{-110,0},{-26.4,0},{-26.4,1.23077}},
                                                            color={0,0,127}));
  connect(one_zone.valve_room, valve_room) annotation (Line(points={{12.2,
          -11.4615},{12.2,-20},{-80,-20},{-80,60},{-110,60}},
                                                    color={0,0,127}));
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
