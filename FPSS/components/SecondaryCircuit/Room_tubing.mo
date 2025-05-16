within FPSS.components.SecondaryCircuit;
model Room_tubing
  package MediumAir = AixLib.Media.Air "Medium model for air";
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Modelica.Units.SI.MassFlowRate mflow_nominal = 0.02 "nominal mass flow";
  parameter Modelica.Units.SI.PressureDifference dp_valve = 2000 "pressure drop across the valve";
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_nominal = 2000 "nominal heat flow";
  parameter Modelica.Units.SI.Temperature T_in_nominal = 273.15 + 60 "Radiator inlet Temperature at nominal condition";
  parameter Modelica.Units.SI.Temperature T_out_nominal = 273.15 + 40 "Radiator outlet Temperature at nominal condition";
  parameter Modelica.Units.SI.Temperature T_air_nominal = 273.15 + 20 "Air Temperature at nominal condition";

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
    dpValve_nominal(displayUnit="Pa") = 1000)
    annotation (Placement(transformation(extent={{-122,-170},{-102,-150}})));
  Control.RoomTemperature.CRT_PID        ctr_room
    annotation (Placement(transformation(extent={{90,-130},{110,-110}})));
  Modelica.Blocks.Interfaces.RealInput T_room_set(unit="K") annotation (Placement(
        transformation(origin={240,-100},
                                        extent={{20,-20},{-20,20}}),
        iconTransformation(origin={242,-80}, extent={{20,-20},{-20,20}})));
  Modelica.Blocks.Interfaces.RealInput T_room(unit="K") annotation (Placement(
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
  RadiatorEN442_2_Thilo radiator(
    redeclare package Medium = MediumWater,
    m_flow_nominal=mflow_nominal,
    T_start=323.15,
    Q_flow_nominal(displayUnit="W") = Q_flow_nominal,
    T_a_nominal=T_in_nominal,
    T_b_nominal=T_out_nominal,
    TAir_nominal=T_air_nominal,
    dp_nominal(displayUnit="Pa") = 10000)
    annotation (Placement(transformation(extent={{-22,-180},{18,-140}})));
  reverse_sign Q_rad_pos
    annotation (Placement(transformation(extent={{38,-192},{58,-172}})));
  Modelica.Blocks.Interfaces.RealOutput valve_room annotation (Placement(
        transformation(
        origin={100,-270},
        extent={{-10,-10},{10,10}},
        rotation=-90), iconTransformation(
        origin={142,-230},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  Modelica.Blocks.Sources.Constant const_ctr_HP(k=0.2) annotation (Placement(
        transformation(origin={-152,-126}, extent={{-10,-10},{10,10}})));
equation
  connect(T_room_set, ctr_room.T_room_set) annotation (Line(points={{240,-100},
          {212,-100},{212,-120},{112,-120}},
                                        color={0,0,127}));
  connect(T_room, ctr_room.Temperature_Room) annotation (Line(points={{-240,
          -100},{100,-100},{100,-108}},
                                  color={0,0,127}));
  connect(radiator.heatPortCon, thermConv) annotation (Line(points={{-6,-145.6},
          {-6,-40},{60,-40},{60,0}}, color={191,0,0}));
  connect(radiator.heatPortRad, starRad) annotation (Line(points={{2,-145.6},{2,
          -60},{-60,-60},{-60,0}}, color={191,0,0}));
  connect(radiator.Qflow_radiator, Q_rad_pos.x_in)
    annotation (Line(points={{12,-174},{12,-182},{36,-182}}, color={0,0,127}));
  connect(ctr_room.control_valve, valve_room) annotation (Line(points={{100,
          -131},{100,-270}},                       color={0,0,127}));
  connect(heating_fluid_in, heating_fluid_in)
    annotation (Line(points={{-220,-160},{-220,-160}}, color={0,127,255}));
  connect(heating_fluid_in, val.port_a)
    annotation (Line(points={{-220,-160},{-122,-160}}, color={0,127,255}));
  connect(val.port_b, radiator.port_a)
    annotation (Line(points={{-102,-160},{-22,-160}}, color={0,127,255}));
  connect(radiator.port_b, heating_fluid_out) annotation (Line(points={{18,-160},
          {220,-160},{220,-160}}, color={0,127,255}));
  connect(val.y, ctr_room.control_valve) annotation (Line(points={{-112,-148},{
          -112,-138},{100,-138},{100,-131}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-220,-260},{
            220,0}})),
    experiment(Tolerance = 1e-6, StopTime = 15000),
    Documentation(revisions = "<html><head></head><body><div><br></div>
</body></html>", info="<html>
<p>The PID controller controlles the valve infront of the radiator. It gets the actual room temperature and compares it to the room set temperature and changes the position of the valve in a way, that the desired room temperature is set.</p>
</html>"),
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
end Room_tubing;
