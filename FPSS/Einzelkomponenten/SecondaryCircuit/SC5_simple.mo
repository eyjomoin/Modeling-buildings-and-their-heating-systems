within FPSS.Einzelkomponenten.SecondaryCircuit;
model SC5_simple
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Modelica.Units.SI.Temperature T_room_set = 273.15 + 20 "Room set temperature";
  replaceable parameter FPSS.Parameter.TGA.P_one_zone_start Parameter_TGA
    constrainedby FPSS.Parameter.TGA.P_one_zone_start annotation (Placement(
        transformation(extent={{-204,190},{-184,210}})), choicesAllMatching=true);

  AixLib.Fluid.Sources.Boundary_pT bouWat(redeclare package Medium =
        MediumWater,
    p=Parameter_TGA.p_sec,           nPorts=1)                                                                "Pressure bound for water circuit" annotation (
    Placement(transformation(origin={-70,-128},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  AixLib.Fluid.Sensors.TemperatureTwoPort T_HP_ret(m_flow_nominal=Parameter_TGA.mflow_sec_max,
      redeclare package Medium = MediumWater) annotation (Placement(
        transformation(origin={-170,-100}, extent={{10,-10},{-10,10}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort T_HP_sup(redeclare package Medium =
        MediumWater, m_flow_nominal=Parameter_TGA.mflow_sec_max)                       annotation (Placement(
        transformation(origin={-190,120}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a FP_SC1_in(redeclare package Medium =
        MediumWater) annotation (Placement(transformation(origin={-220,120},
          extent={{-18,-18},{18,18}}), iconTransformation(origin={-110,70},
          extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b FP_SC1_out(redeclare package Medium =
        MediumWater) annotation (Placement(transformation(origin={-220,-100},
          extent={{-20,-20},{20,20}}), iconTransformation(origin={-110,-70},
          extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput Temperature_amb annotation (
    Placement(transformation(origin={44,240},      extent = {{-20, -20}, {20, 20}},
        rotation=-90),                                                               iconTransformation(origin={60,120},      extent = {{-20, -20}, {20, 20}},
        rotation=-90)));
  Modelica.Blocks.Interfaces.RealOutput signal_ctr_HP annotation (Placement(
        transformation(
        origin={52,-240},
        extent={{20,-20},{-20,20}},
        rotation=90), iconTransformation(
        origin={20,-110},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Control.HeatPump.Ctr_HP_HC_only_PID ctr_HP(
    T_HC_1_amb=Parameter_TGA.T_HC_1_amb,
    T_HC_1_sup=Parameter_TGA.T_HC_1_sup,
    T_HC_2_amb=Parameter_TGA.T_HC_2_amb,
    T_HC_2_sup=Parameter_TGA.T_HC_2_sup)
    annotation (Placement(transformation(extent={{40,144},{60,164}})));

  AixLib.Fluid.Sensors.HeatMeter HeatMeater_SC_in(redeclare package Medium =
        MediumWater,
    allowFlowReversal=false,                                                              m_flow_nominal=Parameter_TGA.mflow_sec_max)
    annotation (Placement(transformation(extent={{-146,10},{-126,30}})));
  AixLib.Fluid.Movers.Preconfigured.FlowControlled_dp pum_HP(
    redeclare package Medium = MediumWater,
    use_inputFilter=false,
    m_flow_nominal=Parameter_TGA.mflow_sec_max,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    allowFlowReversal=false) "Pump" annotation (Placement(transformation(origin
          ={8,200}, extent={{-110,-190},{-90,-170}})));
  Modelica.Blocks.Sources.Constant const1(k=Parameter_TGA.dp_pump)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-92,58})));
  Room_tubing room_tubing(
    mflow_nominal=Parameter_TGA.mflow_sec_max,
    dp_valve=Parameter_TGA.dp_pump,
    Q_flow_nominal=Parameter_TGA.Qflow_max,
    T_in_nominal=Parameter_TGA.T_sup_nom,
    T_out_nominal=Parameter_TGA.T_ret_nom,
    T_air_nominal=Parameter_TGA.T_room_set) annotation (Placement(
        transformation(
        extent={{-40.5,-23.5006},{40.5,23.4997}},
        rotation=270,
        origin={126.5,-51.5})));
  Modelica.Blocks.Sources.Constant T_set(k=T_room_set) annotation (Placement(
        transformation(origin={182,-140}, extent={{10,-10},{-10,10}})));
  AixLib.Utilities.Interfaces.RadPort starRad annotation (Placement(transformation(extent={{210,-24},
            {230,-4}}),                                                                                        iconTransformation(extent={{90,46},
            {110,66}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermConv annotation (
      Placement(transformation(extent={{212,-110},{232,-90}}),
                                                         iconTransformation(
          extent={{90,-12},{110,8}})));
  Modelica.Blocks.Interfaces.RealInput T_room(unit="K") annotation (Placement(
        transformation(origin={240,60},    extent={{-20,-20},{20,20}},
        rotation=180),
        iconTransformation(origin={100,-60},extent={{-20,-20},{20,20}},
        rotation=180)));
equation
  connect(FP_SC1_in,T_HP_sup. port_a)
    annotation (Line(points={{-220,120},{-200,120}}));
  connect(FP_SC1_out, T_HP_ret.port_b)
    annotation (Line(points={{-220,-100},{-180,-100}}));
  connect(FP_SC1_out, FP_SC1_out)
    annotation (Line(points={{-220,-100},{-220,-100}}, color={0,127,255}));
  connect(FP_SC1_in, FP_SC1_in)
    annotation (Line(points={{-220,120},{-220,120}}, color={0,127,255}));
  connect(ctr_HP.control_signal_HP, signal_ctr_HP) annotation (Line(points={{50,
          143},{50,-48},{52,-48},{52,-240}}, color={0,0,127}));
  connect(T_HP_sup.T, ctr_HP.T_HP_out_meas) annotation (Line(points={{-190,131},
          {-190,158},{38,158}}, color={0,0,127}));
  connect(T_HP_ret.T, HeatMeater_SC_in.TExt) annotation (Line(points={{-170,-89},
          {-170,26},{-148,26}}, color={0,0,127}));
  connect(T_HP_sup.port_b, HeatMeater_SC_in.port_a) annotation (Line(points={{
          -180,120},{-160,120},{-160,20},{-146,20}}, color={0,127,255}));
  connect(HeatMeater_SC_in.port_b, pum_HP.port_a)
    annotation (Line(points={{-126,20},{-102,20}}, color={0,127,255}));
  connect(const1.y, pum_HP.dp_in)
    annotation (Line(points={{-92,47},{-92,32}}, color={0,0,127}));
  connect(Temperature_amb, ctr_HP.T_amb)
    annotation (Line(points={{44,240},{44,166}}, color={0,0,127}));
  connect(T_HP_ret.port_a, bouWat.ports[1]) annotation (Line(points={{-160,-100},
          {-70,-100},{-70,-118}}, color={0,127,255}));
  connect(pum_HP.port_b, room_tubing.heating_fluid_in) annotation (Line(points={{-82,20},
          {120.715,20},{120.715,-10.6318}},          color={0,127,255}));
  connect(room_tubing.heating_fluid_out, T_HP_ret.port_a) annotation (Line(
        points={{121.438,-92},{121.438,-100},{-160,-100}}, color={0,127,255}));
  connect(T_set.y, room_tubing.T_room_set) annotation (Line(points={{171,-140},
          {135.538,-140},{135.538,-96.05}},color={0,0,127}));
  connect(thermConv, room_tubing.thermConv) annotation (Line(points={{222,-100},
          {180,-100},{180,-62.9136},{150,-62.9136}}, color={191,0,0}));
  connect(starRad, room_tubing.starRad) annotation (Line(points={{220,-14},{180,
          -14},{180,-40.4545},{150,-40.4545}}, color={0,0,0}));
  connect(T_room, room_tubing.T_room) annotation (Line(points={{240,60},{
          135.538,60},{135.538,-6.58182}},
                                   color={0,0,127}));
  connect(room_tubing.valve_room, ctr_HP.valve_room) annotation (Line(points={{108.423,
          -77.6409},{0,-77.6409},{0,150},{38,150}},         color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-220, -220}, {220, 220}})),
    experiment(Tolerance = 1e-6, StopTime = 15000),
    Documentation(revisions = "<html><head></head><body><ul>
<li>Normally only the primary circuit needs antifreeze. But I get an error anyway if temperature goes below 1°C. If I change primary and secondary circuit, it works.</li><li>dfghj</li><li>vbn</li>
</ul>
</body></html>", info = "<html><head></head><body><p>All components of the secondary circuit summarised to one component.</p><ul>
</ul>
</body></html>"),
    __Dymola_Commands(file = "modelica://AixLib/Resources/Scripts/Dymola/Examples/Tutorial/SimpleHouse/SimpleHouse4.mos" "Simulate and plot"),
    Icon(graphics={
        Line(
          points={{-98,70},{-36,70},{16,70},{44,58},{58,30},{58,-42},{46,-58},{0,
              -70},{-100,-70}},
          color={238,46,47},
          thickness=1),
        Rectangle(
          extent={{42,34},{72,-44}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-92,44},{18,-30}},
          textColor={0,0,0},
          textString="sec")}));
end SC5_simple;
