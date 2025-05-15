within FPSS.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating;
model Room_tubing_2circuits
  package MediumAir = AixLib.Media.Air "Medium model for air";
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Modelica.Units.SI.MassFlowRate mflow_heating_fluid1 = 0.02 "In hysteris mode there is eather mflow_heating_fluid or 0";
  parameter Modelica.Units.SI.MassFlowRate mflow_heating_fluid2 = 0.02 "In hysteris mode there is eather mflow_heating_fluid or 0";
  parameter Modelica.Units.SI.Area panelHeatingArea = 20 "Area for the heat exchange";
  parameter Real f_pha=1 "factor that can be used if panel heating area is to small or to big";
  AixLib.Fluid.HeatExchangers.ActiveWalls.PanelHeating floorheating_2(
    redeclare package Medium = MediumWater,
    A=f_pha*panelHeatingArea,
    T0=307.15)
    annotation (Placement(transformation(extent={{-148,-194},{-56,-160}})));
  Modelica.Fluid.Interfaces.FluidPort_b Floorheating_out2(redeclare final
      package Medium = MediumWater) annotation (Placement(transformation(extent
          ={{200,-200},{240,-160}}), iconTransformation(extent={{210,-170},{230,
            -150}})));
  Modelica.Fluid.Interfaces.FluidPort_a Floorheating_in2(redeclare final
      package Medium = MediumWater) annotation (Placement(transformation(extent
          ={{-230,-190},{-210,-170}}), iconTransformation(extent={{-232,-172},{-212,
            -152}})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear val2(
    redeclare package Medium = MediumWater,
    m_flow_nominal=mflow_heating_fluid2,
    dpValve_nominal=200000)
    annotation (Placement(transformation(extent={{58,-190},{78,-170}})));
  Control.RoomTemperature.CRT_Hysteresis ctr_room
    annotation (Placement(transformation(extent={{160,-90},{180,-70}})));
  Modelica.Blocks.Interfaces.RealInput T_room_set annotation (Placement(
        transformation(origin={240,-60},extent={{20,-20},{-20,20}}),
        iconTransformation(origin={242,-80}, extent={{20,-20},{-20,20}})));
  Modelica.Blocks.Interfaces.RealInput T_room annotation (Placement(
        transformation(origin={-240,-60},  extent={{-20,-20},{20,20}}),
        iconTransformation(origin={-244,-80},
                                            extent={{-20,-20},{20,20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermConv annotation (
      Placement(transformation(extent={{50,-10},{70,10}}),
                                                         iconTransformation(
          extent={{52,-10},{72,10}})));
  AixLib.Utilities.Interfaces.RadPort starRad annotation (Placement(transformation(extent={{-70,-10},
            {-50,10}}),                                                                                        iconTransformation(extent={{-70,-10},
            {-50,10}})));
  AixLib.Fluid.HeatExchangers.ActiveWalls.PanelHeating floorheating_1(
    redeclare package Medium = MediumWater,
    A=f_pha*panelHeatingArea,
    T0=307.15)
    annotation (Placement(transformation(extent={{4,-134},{96,-100}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature FixedTemp1(T=293.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-192,-206})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear val1(
    redeclare package Medium = MediumWater,
    m_flow_nominal=mflow_heating_fluid1,
    dpValve_nominal=200000)
    annotation (Placement(transformation(extent={{160,-130},{180,-110}})));
  Modelica.Fluid.Interfaces.FluidPort_b Floorheating_out1(redeclare final
      package Medium = MediumWater) annotation (Placement(transformation(extent={{200,
            -140},{240,-100}}),     iconTransformation(extent={{208,-210},{228,-190}})));
  Modelica.Fluid.Interfaces.FluidPort_a Floorheating_in1(redeclare final
      package Medium = MediumWater) annotation (Placement(transformation(extent={{-230,
            -130},{-210,-110}}),       iconTransformation(extent={{-232,-212},{-212,
            -192}})));
equation
  connect(Floorheating_in2, floorheating_2.port_a) annotation (Line(points={{-220,
          -180},{-220,-179.833},{-148,-179.833}}, color={0,127,255}));
  connect(Floorheating_out2, val2.port_b)
    annotation (Line(points={{220,-180},{78,-180}}, color={0,127,255}));
  connect(floorheating_2.port_b, val2.port_a) annotation (Line(points={{-56,
          -179.833},{58,-179.833},{58,-180}}, color={0,127,255}));
  connect(T_room_set, ctr_room.T_room_set) annotation (Line(points={{240,-60},{212,
          -60},{212,-80},{182,-80}},    color={0,0,127}));
  connect(T_room, ctr_room.Temperature_Room) annotation (Line(points={{-240,-60},
          {170,-60},{170,-68}},   color={0,0,127}));
  connect(Floorheating_in1, floorheating_1.port_a) annotation (Line(points={{-220,
          -120},{-220,-119.833},{4,-119.833}}, color={0,127,255}));
  connect(Floorheating_out1, val1.port_b)
    annotation (Line(points={{220,-120},{180,-120}}, color={0,127,255}));
  connect(floorheating_1.port_b, val1.port_a) annotation (Line(points={{96,
          -119.833},{96,-120},{160,-120}},
                                 color={0,127,255}));
  connect(ctr_room.control_valve, val1.y)
    annotation (Line(points={{170,-91},{170,-108}}, color={0,0,127}));
  connect(ctr_room.control_valve, val2.y) annotation (Line(points={{170,-91},{
          170,-100},{120,-100},{120,-150},{68,-150},{68,-168}}, color={0,0,127}));
  connect(FixedTemp1.port, floorheating_2.ThermDown) annotation (Line(points={{-182,
          -206},{-98.32,-206},{-98.32,-195.7}}, color={191,0,0}));
  connect(FixedTemp1.port, floorheating_1.ThermDown) annotation (Line(points={{-182,
          -206},{-20,-206},{-20,-152},{53.68,-152},{53.68,-135.7}}, color={191,0,
          0}));
  connect(floorheating_2.starRad, starRad) annotation (Line(points={{-107.52,-158.3},
          {-107.52,-40},{-60,-40},{-60,0}}, color={0,0,0}));
  connect(floorheating_1.starRad, starRad) annotation (Line(points={{44.48,-98.3},
          {44.48,-40},{-60,-40},{-60,0}}, color={0,0,0}));
  connect(floorheating_2.thermConv, thermConv) annotation (Line(points={{-95.56,
          -157.167},{-95.56,-80},{60,-80},{60,0}}, color={191,0,0}));
  connect(floorheating_1.thermConv, thermConv) annotation (Line(points={{56.44,
          -97.1667},{56.44,-80},{60,-80},{60,0}},
                                        color={191,0,0}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-220,-220},{220,
            0}})),
    experiment(Tolerance = 1e-6, StopTime = 15000),
    Documentation(revisions = "<html><head></head><body><div><br></div>
</body></html>", info = "<html><head></head><body><p>Model to simulate a simple house with one room, that can be attached to a HVAC system</p><ul>
</ul>
</body></html>"),
    __Dymola_Commands(file = "modelica://AixLib/Resources/Scripts/Dymola/Examples/Tutorial/SimpleHouse/SimpleHouse4.mos" "Simulate and plot"),
    Icon(coordinateSystem(extent={{-220,-220},{220,0}}),
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
          points={{-214,-162},{-198,-162},{-194,-150},{-192,-178},{-182,-150},{-182,
              -176},{-174,-152},{-172,-176},{-164,-152},{-158,-174},{-146,-150},
              {-140,-176},{-130,-152},{-124,-174},{-116,-152},{-108,-174},{-104,
              -152},{-96,-174},{-88,-152},{-82,-172},{-72,-154},{-68,-172},{-60,
              -150},{-52,-172},{-42,-148},{-36,-172},{-24,-150},{-18,-172}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-10,-150},{-2,-174},{12,-150},{16,-174},{28,-152},{32,-174},{
              42,-150},{46,-174},{60,-150},{62,-174},{78,-148},{84,-174},{94,-150},
              {100,-172},{108,-150},{116,-172},{120,-150},{128,-172},{136,-150},
              {142,-170},{152,-152},{156,-170},{164,-148},{172,-170},{182,-146},
              {188,-170},{196,-160},{210,-160}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-18,-172},{-10,-150}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-216,-200},{-200,-200},{-196,-188},{-194,-216},{-184,-188},{-184,
              -214},{-176,-190},{-174,-214},{-166,-190},{-160,-212},{-148,-188},
              {-142,-214},{-132,-190},{-126,-212},{-118,-190},{-110,-212},{-106,
              -190},{-98,-212},{-90,-190},{-84,-210},{-74,-192},{-70,-210},{-62,
              -188},{-54,-210},{-44,-186},{-38,-210},{-26,-188},{-20,-210}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-12,-190},{-2,-214},{12,-190},{16,-214},{28,-192},{32,-214},{
              42,-190},{46,-214},{60,-190},{62,-214},{78,-188},{84,-214},{94,-190},
              {100,-212},{108,-190},{116,-212},{120,-190},{128,-212},{136,-190},
              {142,-210},{152,-192},{156,-210},{164,-188},{172,-210},{182,-186},
              {188,-210},{196,-200},{210,-200}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-20,-212},{-12,-190}},
          color={28,108,200},
          thickness=1)}));
end Room_tubing_2circuits;
