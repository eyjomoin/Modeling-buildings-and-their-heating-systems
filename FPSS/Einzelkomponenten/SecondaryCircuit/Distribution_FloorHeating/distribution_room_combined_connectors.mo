within FPSS.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating;
model distribution_room_combined_connectors
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Real factor_pha=1 "Factor that can be used if panel heating area is to small or to big";
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing
    Bathroom(
    mflow_heating_fluid=0.03,
    panelHeatingArea=5.45,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing
    UtilityRoom(panelHeatingArea=7.7, f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,-160},{10,-140}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing
    Corridor(panelHeatingArea=12.02 + 9.9, f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing
    Kitchen(panelHeatingArea=10.9, f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing
    Room1(
    mflow_heating_fluid=0.025,
    panelHeatingArea=10.65,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,160},{10,180}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing
    Room2(
    mflow_heating_fluid=0.025,
    panelHeatingArea=10.58,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,120},{10,140}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing
    Room3(
    mflow_heating_fluid=0.02,
    panelHeatingArea=11.99,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing_2circuits
    Room4(
    mflow_heating_fluid1=0.015,
    mflow_heating_fluid2=0.02,
    panelHeatingArea=16.7,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_FloorHeating.Room_tubing_2circuits
    Room5(
    mflow_heating_fluid1=0.025,
    mflow_heating_fluid2=0.02,
    panelHeatingArea=20.07,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  DataInput.Input_T_rooms_set input_T_rooms_set
    annotation (Placement(transformation(extent={{106,-236},{68,-170}})));
  AixLib.Fluid.HeatExchangers.ActiveWalls.Distributor
              distributor(
    redeclare package Medium = MediumWater,
    T_start=307.15,
    m_flow_nominal=0.5,
    n=11)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-200})));
  Modelica.Blocks.Sources.Constant T_set_room_U(k=273.15 + 17)
                                                        annotation (
    Placement(transformation(origin={92,-238},  extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Rooms[9](unit="K") annotation (Placement(
        transformation(origin={-110,0}, extent={{-20,-20},{20,20}}),
        iconTransformation(origin={98,-100}, extent={{20,-20},{-20,20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_rooms[9] annotation (Placement(
        transformation(extent={{90,-60},{110,-40}}), iconTransformation(extent={{90,-10},
            {110,10}})));
  AixLib.Utilities.Interfaces.RadPort rad_rooms[9] annotation (Placement(
        transformation(extent={{90,40},{110,60}}), iconTransformation(extent={{90,80},
            {110,100}})));
  Modelica.Fluid.Interfaces.FluidPort_a FluidPort_ret_main(redeclare package
      Medium = MediumWater) annotation (Placement(transformation(origin={-20,-240},
          extent={{-10,-10},{10,10}}), iconTransformation(origin={-20,-240},
          extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b FluidPort_sup_main(redeclare package
      Medium = MediumWater)                                                                        annotation (Placement(
        transformation(origin={20,-240}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={20,-240}, extent={{-10,-10},{10,10}})));
equation
  connect(distributor.flowPorts[1], UtilityRoom.Floorheating_in) annotation (
      Line(points={{-20,-203.636},{-40,-203.636},{-40,-154.727},{-10.0909,
          -154.727}},
        color={0,127,255}));
  connect(Corridor.Floorheating_in, distributor.flowPorts[2]) annotation (Line(
        points={{-10.0909,-114.727},{-40,-114.727},{-40,-202.909},{-20,-202.909}},
        color={0,127,255}));
  connect(Kitchen.Floorheating_in, distributor.flowPorts[3]) annotation (Line(
        points={{-10.0909,-74.7273},{-40,-74.7273},{-40,-202.182},{-20,-202.182}},
        color={0,127,255}));
  connect(Bathroom.Floorheating_in, distributor.flowPorts[4]) annotation (Line(
        points={{-10.0909,-34.7273},{-40,-34.7273},{-40,-197.333},{-20,-197.333},
          {-20,-201.455}}, color={0,127,255}));
  connect(Room5.Floorheating_in1, distributor.flowPorts[5]) annotation (Line(
        points={{-10.0909,1.63636},{-40,1.63636},{-40,-197.333},{-20,-197.333},
          {-20,-200.727}},color={0,127,255}));
  connect(Room5.Floorheating_in2, distributor.flowPorts[6]) annotation (Line(
        points={{-10.0909,5.27273},{-40,5.27273},{-40,-197.333},{-20,-197.333},{
          -20,-200}}, color={0,127,255}));
  connect(Room4.Floorheating_in1, distributor.flowPorts[7]) annotation (Line(
        points={{-10.0909,41.6364},{-40,41.6364},{-40,-197.333},{-20,-197.333},
          {-20,-199.273}},color={0,127,255}));
  connect(Room4.Floorheating_in2, distributor.flowPorts[8]) annotation (Line(
        points={{-10.0909,45.2727},{-40,45.2727},{-40,-197.333},{-20,-197.333},
          {-20,-198.545}},color={0,127,255}));
  connect(Room3.Floorheating_in, distributor.flowPorts[9]) annotation (Line(
        points={{-10.0909,85.2727},{-40,85.2727},{-40,-197.333},{-20,-197.333},
          {-20,-197.818}},color={0,127,255}));
  connect(Room2.Floorheating_in, distributor.flowPorts[10]) annotation (Line(
        points={{-10.0909,125.273},{-40,125.273},{-40,-197.333},{-20,-197.333},
          {-20,-197.091}},color={0,127,255}));
  connect(Room1.Floorheating_in, distributor.flowPorts[11]) annotation (Line(
        points={{-10.0909,165.273},{-40,165.273},{-40,-197.333},{-20,-197.333},
          {-20,-196.364}},color={0,127,255}));
  connect(UtilityRoom.Floorheating_out, distributor.returnPorts[1]) annotation (
     Line(points={{10,-154.364},{16,-154.364},{16,-154},{40,-154},{40,-203.636},
          {20.6667,-203.636}}, color={0,127,255}));
  connect(Corridor.Floorheating_out, distributor.returnPorts[2]) annotation (
      Line(points={{10,-114.364},{20,-114.364},{20,-114},{40,-114},{40,-202.909},
          {20.6667,-202.909}}, color={0,127,255}));
  connect(Kitchen.Floorheating_out, distributor.returnPorts[3]) annotation (
      Line(points={{10,-74.3636},{16,-74.3636},{16,-74},{40,-74},{40,-198},{
          20.6667,-198},{20.6667,-202.182}},
                                     color={0,127,255}));
  connect(Bathroom.Floorheating_out, distributor.returnPorts[4]) annotation (
      Line(points={{10,-34.3636},{18,-34.3636},{18,-34},{40,-34},{40,-198},{
          20.667,-198},{20.667,-201.455},{20.6667,-201.455}},
                                                       color={0,127,255}));
  connect(Room5.Floorheating_out1, distributor.returnPorts[5]) annotation (Line(
        points={{9.90909,1.81818},{40,1.81818},{40,-198},{20.667,-198},{20.667,
          -197},{20.6667,-197},{20.6667,-200.727}},
                                              color={0,127,255}));
  connect(Room5.Floorheating_out2, distributor.returnPorts[6]) annotation (Line(
        points={{10,5.45455},{18,5.45455},{18,6},{40,6},{40,-198},{20.667,-198},
          {20.667,-197},{20.6667,-197},{20.6667,-200},{20.6667,-200}}, color={0,
          127,255}));
  connect(Room4.Floorheating_out1, distributor.returnPorts[7]) annotation (Line(
        points={{9.90909,41.8182},{40,41.8182},{40,-198},{20.667,-198},{20.667,
          -197},{20.667,-197},{20.667,-199.273},{20.6667,-199.273}},
                                                               color={0,127,255}));
  connect(Room4.Floorheating_out2, distributor.returnPorts[8]) annotation (Line(
        points={{10,45.4545},{16,45.4545},{16,46},{40,46},{40,-198},{20.667,
          -198},{20.667,-196.571},{20.667,-198.545},{20.6667,-198.545}},
                                                                   color={0,127,
          255}));
  connect(Room3.Floorheating_out, distributor.returnPorts[9]) annotation (Line(
        points={{10,85.6364},{20,85.6364},{20,86},{40,86},{40,-198},{20.667,
          -198},{20.667,-197.5},{20.667,-197.818},{20.6667,-197.818}},
                                                                 color={0,127,255}));
  connect(Room2.Floorheating_out, distributor.returnPorts[10]) annotation (Line(
        points={{10,125.636},{16,125.636},{16,126},{40,126},{40,-198},{20.667,
          -198},{20.667,-196.444},{20.667,-197.091},{20.6667,-197.091}},
                                                                   color={0,127,
          255}));
  connect(Room1.Floorheating_out, distributor.returnPorts[11]) annotation (Line(
        points={{10,165.636},{16,165.636},{16,166},{40,166},{40,-198},{20.667,
          -198},{20.667,-196.4},{20.667,-196.364},{20.6667,-196.364}},
                                                                 color={0,127,255}));
  connect(input_T_rooms_set.T_R1_set, Room1.T_room_set) annotation (Line(points={{66.1,
          -174.125},{60,-174.125},{60,172.727},{11,172.727}},       color={0,0,127}));
  connect(input_T_rooms_set.T_R2_set, Room2.T_room_set) annotation (Line(points={{66.1,
          -182.375},{60,-182.375},{60,132.727},{11,132.727}},       color={0,0,127}));
  connect(input_T_rooms_set.T_R3_set, Room3.T_room_set) annotation (Line(points={{66.1,
          -190.625},{60,-190.625},{60,92.7273},{11,92.7273}},       color={0,0,127}));
  connect(input_T_rooms_set.T_R4_set, Room4.T_room_set) annotation (Line(points={{66.1,
          -198.875},{60,-198.875},{60,52.7273},{11,52.7273}},       color={0,0,127}));
  connect(input_T_rooms_set.T_R5_set, Room5.T_room_set) annotation (Line(points={{66.1,
          -207.125},{60,-207.125},{60,12.7273},{11,12.7273}},       color={0,0,127}));
  connect(input_T_rooms_set.T_B_set, Bathroom.T_room_set) annotation (Line(
        points={{66.1,-215.375},{60,-215.375},{60,-27.2727},{11,-27.2727}},
        color={0,0,127}));
  connect(input_T_rooms_set.T_K_set, Kitchen.T_room_set) annotation (Line(
        points={{66.1,-223.625},{60,-223.625},{60,-67.2727},{11,-67.2727}},
        color={0,0,127}));
  connect(input_T_rooms_set.T_C_set, Corridor.T_room_set) annotation (Line(
        points={{66.1,-231.875},{60,-231.875},{60,-107.273},{11,-107.273}},
        color={0,0,127}));
  connect(T_set_room_U.y, UtilityRoom.T_room_set) annotation (Line(points={{81,-238},
          {60,-238},{60,-147.273},{11,-147.273}}, color={0,0,127}));
  connect(FluidPort_ret_main, FluidPort_ret_main)
    annotation (Line(points={{-20,-240},{-20,-240}}, color={0,127,255}));
  connect(FluidPort_sup_main, FluidPort_sup_main)
    annotation (Line(points={{20,-240},{20,-240}}, color={0,127,255}));
  connect(distributor.mainFlow, FluidPort_ret_main) annotation (Line(points={{
          -10.6667,-220},{-10.6667,-228},{-20,-228},{-20,-240}},
                                                        color={0,127,255}));
  connect(distributor.mainReturn, FluidPort_sup_main) annotation (Line(points={{
          10,-220},{10,-228},{20,-228},{20,-240}}, color={0,127,255}));
  connect(Room1.T_room, T_Rooms[1]) annotation (Line(points={{-11.0909,172.727},
          {-60,172.727},{-60,-8.88889},{-110,-8.88889}}, color={0,0,127}));
  connect(Room2.T_room, T_Rooms[2]) annotation (Line(points={{-11.0909,132.727},
          {-60,132.727},{-60,-6.66667},{-110,-6.66667}}, color={0,0,127}));
  connect(Room3.T_room, T_Rooms[3]) annotation (Line(points={{-11.0909,92.7273},
          {-60,92.7273},{-60,-4.44444},{-110,-4.44444}}, color={0,0,127}));
  connect(Room4.T_room, T_Rooms[4]) annotation (Line(points={{-11.0909,52.7273},
          {-60,52.7273},{-60,-2.22222},{-110,-2.22222}}, color={0,0,127}));
  connect(Room5.T_room, T_Rooms[5]) annotation (Line(points={{-11.0909,12.7273},
          {-60,12.7273},{-60,0},{-110,0}}, color={0,0,127}));
  connect(Bathroom.T_room, T_Rooms[6]) annotation (Line(points={{-11.0909,
          -27.2727},{-60,-27.2727},{-60,2.22222},{-110,2.22222}},
                                                        color={0,0,127}));
  connect(Kitchen.T_room, T_Rooms[7]) annotation (Line(points={{-11.0909,
          -67.2727},{-60,-67.2727},{-60,4.44444},{-110,4.44444}},
                                                        color={0,0,127}));
  connect(Corridor.T_room, T_Rooms[8]) annotation (Line(points={{-11.0909,
          -107.273},{-60,-107.273},{-60,6.66667},{-110,6.66667}},
                                                        color={0,0,127}));
  connect(UtilityRoom.T_room, T_Rooms[9]) annotation (Line(points={{-11.0909,
          -147.273},{-60,-147.273},{-60,8.88889},{-110,8.88889}},
                                                        color={0,0,127}));
  connect(Room1.starRad, rad_rooms[1]) annotation (Line(points={{-2.72727,180},
          {-4,180},{-4,194},{80,194},{80,45.5556},{100,45.5556}},color={0,0,0}));
  connect(Room1.thermConv, conv_rooms[1]) annotation (Line(points={{2.81818,180},
          {4,180},{4,186},{70,186},{70,-54.4444},{100,-54.4444}}, color={191,0,0}));
  connect(Room2.starRad, rad_rooms[2]) annotation (Line(points={{-2.72727,140},
          {-4,140},{-4,154},{80,154},{80,46.6667},{100,46.6667}},color={0,0,0}));
  connect(Room2.thermConv, conv_rooms[2]) annotation (Line(points={{2.81818,140},
          {4,140},{4,146},{70,146},{70,-53.3333},{100,-53.3333}}, color={191,0,0}));
  connect(Room3.thermConv, conv_rooms[3]) annotation (Line(points={{2.81818,100},
          {4,100},{4,106},{70,106},{70,-52.2222},{100,-52.2222}}, color={191,0,0}));
  connect(Room3.starRad, rad_rooms[3]) annotation (Line(points={{-2.72727,100},
          {-4,100},{-4,112},{80,112},{80,47.7778},{100,47.7778}},color={0,0,0}));
  connect(Room4.thermConv, conv_rooms[4]) annotation (Line(points={{2.81818,60},
          {4,60},{4,68},{70,68},{70,-51.1111},{100,-51.1111}}, color={191,0,0}));
  connect(Room4.starRad, rad_rooms[4]) annotation (Line(points={{-2.72727,60},{
          -4,60},{-4,74},{80,74},{80,48.8889},{100,48.8889}},
                                                 color={0,0,0}));
  connect(Room5.thermConv, conv_rooms[5]) annotation (Line(points={{2.81818,20},
          {4,20},{4,26},{70,26},{70,-50},{100,-50}}, color={191,0,0}));
  connect(Room5.starRad, rad_rooms[5]) annotation (Line(points={{-2.72727,20},{-4,
          20},{-4,30},{80,30},{80,50},{100,50}}, color={0,0,0}));
  connect(Bathroom.thermConv, conv_rooms[6]) annotation (Line(points={{2.81818,
          -20},{4,-20},{4,-16},{70,-16},{70,-48.8889},{100,-48.8889}},
                                                                  color={191,0,0}));
  connect(Bathroom.starRad, rad_rooms[6]) annotation (Line(points={{-2.72727,
          -20},{-4,-20},{-4,-10},{80,-10},{80,51.1111},{100,51.1111}},
                                                                  color={0,0,0}));
  connect(Kitchen.thermConv, conv_rooms[7]) annotation (Line(points={{2.81818,
          -60},{4,-60},{4,-54},{70,-54},{70,-47.7778},{100,-47.7778}},
                                                                  color={191,0,0}));
  connect(Kitchen.starRad, rad_rooms[7]) annotation (Line(points={{-2.72727,-60},
          {-4,-60},{-4,-48},{80,-48},{80,52.2222},{100,52.2222}}, color={0,0,0}));
  connect(Corridor.thermConv, conv_rooms[8]) annotation (Line(points={{2.81818,
          -100},{4,-100},{4,-94},{70,-94},{70,-46.6667},{100,-46.6667}},
                                                                   color={191,0,
          0}));
  connect(Corridor.starRad, rad_rooms[8]) annotation (Line(points={{-2.72727,
          -100},{-4,-100},{-4,-86},{80,-86},{80,53.3333},{100,53.3333}},
                                                                   color={0,0,0}));
  connect(UtilityRoom.thermConv, conv_rooms[9]) annotation (Line(points={{2.81818,
          -140},{4,-140},{4,-134},{70,-134},{70,-45.5556},{100,-45.5556}},
        color={191,0,0}));
  connect(UtilityRoom.starRad, rad_rooms[9]) annotation (Line(points={{-2.72727,
          -140},{-4,-140},{-4,-128},{80,-128},{80,54.4444},{100,54.4444}},
        color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-240},
            {100,200}}), graphics={
        Line(
          points={{-60,-238},{-60,62}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{60,-238},{60,60}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,60},{-50,90},{-40,120},{-20,140},{20,140},{40,120},{60,60}},
          color={28,108,200},
          thickness=1)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-240},{100,
            200}})));
end distribution_room_combined_connectors;
