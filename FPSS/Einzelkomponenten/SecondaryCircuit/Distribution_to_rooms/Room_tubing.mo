within FPSS.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms;
model Room_tubing
  package MediumAir = AixLib.Media.Air "Medium model for air";
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Modelica.Units.SI.MassFlowRate mflow_heating_fluid = 0.02 "In hysteris mode there is eather mflow_heating_fluid or 0";
  parameter Modelica.Units.SI.Area panelHeatingArea = 20 "Area for the heat exchange";
  parameter Real f_pha=1 "factor that can be used if area is to small or to big";
  AixLib.Fluid.HeatExchangers.ActiveWalls.PanelHeating floorheating_1(
    redeclare package Medium = MediumWater,
    A=f_pha*panelHeatingArea,
    T0=307.15)
    annotation (Placement(transformation(extent={{-48,-174},{44,-140}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature FixedTemp2(T=293.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-144,-194})));
  Modelica.Fluid.Interfaces.FluidPort_b Floorheating_out(redeclare final
      package Medium = MediumWater) annotation (Placement(transformation(extent={{
            200,-180},{240,-140}}), iconTransformation(extent={{210,-168},{230,
            -148}})));
  Modelica.Fluid.Interfaces.FluidPort_a Floorheating_in(redeclare final package
      Medium =         MediumWater) annotation (Placement(transformation(extent
          ={{-230,-170},{-210,-150}}), iconTransformation(extent={{-232,-172},{
            -212,-152}})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear val(redeclare package Medium =
        MediumWater,
    m_flow_nominal=mflow_heating_fluid,
      dpValve_nominal=200000)
    annotation (Placement(transformation(extent={{160,-170},{180,-150}})));
  Control.RoomTemperature.CRT_Hysteresis ctr_room
    annotation (Placement(transformation(extent={{160,-130},{180,-110}})));
  Modelica.Blocks.Interfaces.RealInput T_room_set annotation (Placement(
        transformation(origin={240,-100},
                                        extent={{20,-20},{-20,20}}),
        iconTransformation(origin={242,-80}, extent={{20,-20},{-20,20}})));
  Modelica.Blocks.Interfaces.RealInput T_room annotation (Placement(
        transformation(origin={-240,-100}, extent={{-20,-20},{20,20}}),
        iconTransformation(origin={-244,-80},
                                            extent={{-20,-20},{20,20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermConv annotation (
      Placement(transformation(extent={{50,-10},{70,10}}),
                                                         iconTransformation(
          extent={{52,-10},{72,10}})));
  AixLib.Utilities.Interfaces.RadPort starRad annotation (Placement(transformation(extent={{-70,-10},
            {-50,10}}),                                                                                        iconTransformation(extent={{-70,-10},
            {-50,10}})));
equation
  connect(FixedTemp2.port, floorheating_1.ThermDown) annotation (Line(points={{
          -134,-194},{1.68,-194},{1.68,-175.7}}, color={191,0,0}));
  connect(Floorheating_in, floorheating_1.port_a) annotation (Line(points={{-220,
          -160},{-220,-159.833},{-48,-159.833}},      color={0,127,255}));
  connect(Floorheating_out, val.port_b)
    annotation (Line(points={{220,-160},{180,-160}}, color={0,127,255}));
  connect(floorheating_1.port_b, val.port_a) annotation (Line(points={{44,
          -159.833},{66,-159.833},{66,-160},{160,-160}}, color={0,127,255}));
  connect(val.y, ctr_room.control_valve)
    annotation (Line(points={{170,-148},{170,-131}},color={0,0,127}));
  connect(T_room_set, ctr_room.T_room_set) annotation (Line(points={{240,-100},{
          212,-100},{212,-120},{182,-120}},
                                        color={0,0,127}));
  connect(T_room, ctr_room.Temperature_Room) annotation (Line(points={{-240,-100},
          {170,-100},{170,-108}}, color={0,0,127}));
  connect(floorheating_1.starRad, starRad) annotation (Line(points={{-7.52,
          -138.3},{-7.52,-60},{-60,-60},{-60,0}}, color={0,0,0}));
  connect(floorheating_1.thermConv, thermConv) annotation (Line(points={{4.44,
          -137.167},{4.44,-60},{60,-60},{60,0}}, color={191,0,0}));
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
end Room_tubing;
