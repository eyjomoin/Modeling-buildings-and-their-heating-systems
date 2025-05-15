within FPSS.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms;
model distribution_room
  replaceable package MediumWater = AixLib.Media.Water "Medium model for water";
  parameter Real factor_pha=1 "Factor that can be used if panel heating area is to small or to big";
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing
    Bathroom(
    mflow_heating_fluid=0.03,
    panelHeatingArea=5.45,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing
    UtilityRoom(panelHeatingArea=7.7, f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,-160},{10,-140}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing
    Corridor(panelHeatingArea=12.02 + 9.9, f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing
    Kitchen(panelHeatingArea=10.9, f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing
    Room1(
    mflow_heating_fluid=0.025,
    panelHeatingArea=10.65,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,160},{10,180}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing
    Room2(
    mflow_heating_fluid=0.025,
    panelHeatingArea=10.58,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,120},{10,140}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing
    Room3(
    mflow_heating_fluid=0.02,
    panelHeatingArea=11.99,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing_2circuits
    Room4(
    mflow_heating_fluid1=0.015,
    mflow_heating_fluid2=0.02,
    panelHeatingArea=16.7,
    f_pha=factor_pha)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  POF.Einzelkomponenten.SecondaryCircuit.Distribution_to_rooms.Room_tubing_2circuits
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
  Modelica.Blocks.Interfaces.RealInput T_Room1(unit="K") annotation (Placement(
        transformation(origin={-110,172}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={94,410},   extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room2(unit="K") annotation (Placement(
        transformation(origin={-110,130}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={94,332},   extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room3(unit="K") annotation (Placement(
        transformation(origin={-110,90}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={98,250},  extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room4(unit="K") annotation (Placement(
        transformation(origin={-110,50}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={98,170},  extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Room5(unit="K") annotation (Placement(
        transformation(origin={-110,10}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={96,92},   extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Bathroom(unit="K") annotation (Placement(
        transformation(origin={-110,-30}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={98,12},    extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Kitchen(unit="K") annotation (Placement(
        transformation(origin={-110,-70}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={98,-68},   extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Corridor(unit="K") annotation (Placement(
        transformation(origin={-110,-110}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={98,-150},   extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Utilityroom(unit="K") annotation (Placement(
        transformation(origin={-110,-150}, extent={{-10,-10},{10,10}}),
        iconTransformation(origin={98,-230},   extent={{10,-10},{-10,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R1 annotation (
      Placement(transformation(extent={{90,166},{105,181}}), iconTransformation(
          extent={{88,426},{103,441}})));
  AixLib.Utilities.Interfaces.RadPort rad_R1 annotation (Placement(
        transformation(extent={{90,184},{105,199}}), iconTransformation(extent={{88,444},
            {103,459}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R2 annotation (Placement(
        transformation(extent={{90,126},{105,141}}), iconTransformation(extent={{90,350},
            {105,365}})));
  AixLib.Utilities.Interfaces.RadPort rad_R2 annotation (Placement(
        transformation(extent={{90,144},{105,159}}), iconTransformation(extent={{90,368},
            {105,383}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R3 annotation (Placement(
        transformation(extent={{90,86},{105,101}}), iconTransformation(extent={{94,268},
            {107,283}})));
  AixLib.Utilities.Interfaces.RadPort rad_R3 annotation (Placement(
        transformation(extent={{90,104},{105,119}}), iconTransformation(extent={{92,286},
            {107,301}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R4 annotation (Placement(
        transformation(extent={{90,46},{105,61}}), iconTransformation(extent={{92,186},
            {107,201}})));
  AixLib.Utilities.Interfaces.RadPort rad_R4 annotation (Placement(
        transformation(extent={{90,64},{105,79}}), iconTransformation(extent={{92,204},
            {107,219}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_R5 annotation (Placement(
        transformation(extent={{90,6},{105,21}}), iconTransformation(extent={{92,106},
            {107,121}})));
  AixLib.Utilities.Interfaces.RadPort rad_R5 annotation (Placement(
        transformation(extent={{90,24},{105,39}}), iconTransformation(extent={{92,124},
            {107,139}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_B annotation (Placement(
        transformation(extent={{90,-34},{105,-19}}), iconTransformation(extent={{92,28},
            {107,43}})));
  AixLib.Utilities.Interfaces.RadPort rad_B annotation (Placement(
        transformation(extent={{90,-16},{105,-1}}), iconTransformation(extent={{92,46},
            {107,61}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_K annotation (Placement(
        transformation(extent={{90,-74},{105,-59}}), iconTransformation(extent={{92,-52},
            {107,-37}})));
  AixLib.Utilities.Interfaces.RadPort rad_K annotation (Placement(
        transformation(extent={{90,-56},{105,-41}}), iconTransformation(extent={{92,-34},
            {107,-19}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_C annotation (Placement(
        transformation(extent={{90,-114},{105,-99}}), iconTransformation(extent={{92,-132},
            {107,-117}})));
  AixLib.Utilities.Interfaces.RadPort rad_C annotation (Placement(
        transformation(extent={{90,-96},{105,-81}}), iconTransformation(extent={{92,-114},
            {107,-99}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv_U annotation (Placement(
        transformation(extent={{90,-154},{105,-139}}), iconTransformation(
          extent={{92,-212},{107,-197}})));
  AixLib.Utilities.Interfaces.RadPort rad_U annotation (Placement(
        transformation(extent={{90,-136},{105,-121}}), iconTransformation(
          extent={{92,-194},{107,-179}})));
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
  connect(Room1.T_room, T_Room1) annotation (Line(points={{-11.0909,172.727},{
          -16.5455,172.727},{-16.5455,172},{-110,172}},
                                               color={0,0,127}));
  connect(T_Room2, Room2.T_room) annotation (Line(points={{-110,130},{-16,130},
          {-16,132.727},{-11.0909,132.727}},color={0,0,127}));
  connect(T_Room3, Room3.T_room) annotation (Line(points={{-110,90},{-16,90},{
          -16,92.7273},{-11.0909,92.7273}},
                                        color={0,0,127}));
  connect(T_Room4, Room4.T_room) annotation (Line(points={{-110,50},{-82,50},{
          -82,52},{-11.0909,52},{-11.0909,52.7273}},
                                                 color={0,0,127}));
  connect(T_Bathroom, Bathroom.T_room) annotation (Line(points={{-110,-30},{-16,
          -30},{-16,-27.2727},{-11.0909,-27.2727}}, color={0,0,127}));
  connect(T_Kitchen, Kitchen.T_room) annotation (Line(points={{-110,-70},{-16,
          -70},{-16,-67.2727},{-11.0909,-67.2727}},
                                               color={0,0,127}));
  connect(T_Corridor, Corridor.T_room) annotation (Line(points={{-110,-110},{
          -16,-110},{-16,-107.273},{-11.0909,-107.273}},
                                                     color={0,0,127}));
  connect(T_Utilityroom, UtilityRoom.T_room) annotation (Line(points={{-110,
          -150},{-16,-150},{-16,-147.273},{-11.0909,-147.273}},
                                                          color={0,0,127}));
  connect(T_Room5, Room5.T_room) annotation (Line(points={{-110,10},{-11.0909,
          10},{-11.0909,12.7273}},
                               color={0,0,127}));
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
  connect(Room1.starRad, rad_R1) annotation (Line(points={{-2.72727,180},{-4,
          180},{-4,191.5},{97.5,191.5}},
                                    color={0,0,0}));
  connect(Room1.thermConv, conv_R1) annotation (Line(points={{2.81818,180},{2,
          180},{2,184},{80,184},{80,173.5},{97.5,173.5}},
                                                     color={191,0,0}));
  connect(Room2.starRad, rad_R2) annotation (Line(points={{-2.72727,140},{-4,
          140},{-4,151.5},{97.5,151.5}},
                                    color={0,0,0}));
  connect(Room2.thermConv, conv_R2) annotation (Line(points={{2.81818,140},{4,
          140},{4,144},{80,144},{80,133.5},{97.5,133.5}},
                                                     color={191,0,0}));
  connect(Room3.starRad, rad_R3) annotation (Line(points={{-2.72727,100},{-4,
          100},{-4,111.5},{97.5,111.5}},
                                    color={0,0,0}));
  connect(Room3.thermConv, conv_R3) annotation (Line(points={{2.81818,100},{2,
          100},{2,104},{80,104},{80,93.5},{97.5,93.5}},
                                                   color={191,0,0}));
  connect(Room4.starRad, rad_R4) annotation (Line(points={{-2.72727,60},{-4,60},
          {-4,71.5},{97.5,71.5}}, color={0,0,0}));
  connect(Room4.thermConv, conv_R4) annotation (Line(points={{2.81818,60},{2,60},
          {2,64},{80,64},{80,53.5},{97.5,53.5}}, color={191,0,0}));
  connect(Room5.starRad, rad_R5) annotation (Line(points={{-2.72727,20},{-4,20},
          {-4,31.5},{97.5,31.5}}, color={0,0,0}));
  connect(Room5.thermConv, conv_R5) annotation (Line(points={{2.81818,20},{2,20},
          {2,24},{80,24},{80,13.5},{97.5,13.5}}, color={191,0,0}));
  connect(Bathroom.starRad, rad_B) annotation (Line(points={{-2.72727,-20},{-4,
          -20},{-4,-8.5},{97.5,-8.5}},
                                  color={0,0,0}));
  connect(Bathroom.thermConv, conv_B) annotation (Line(points={{2.81818,-20},{2,
          -20},{2,-14},{80,-14},{80,-26.5},{97.5,-26.5}}, color={191,0,0}));
  connect(Kitchen.starRad, rad_K) annotation (Line(points={{-2.72727,-60},{-4,
          -60},{-4,-48.5},{97.5,-48.5}},
                                    color={0,0,0}));
  connect(Kitchen.thermConv, conv_K) annotation (Line(points={{2.81818,-60},{2,
          -60},{2,-54},{80,-54},{80,-66.5},{97.5,-66.5}},
                                                     color={191,0,0}));
  connect(Corridor.starRad, rad_C) annotation (Line(points={{-2.72727,-100},{-4,
          -100},{-4,-88.5},{97.5,-88.5}}, color={0,0,0}));
  connect(Corridor.thermConv, conv_C) annotation (Line(points={{2.81818,-100},{
          2,-100},{2,-96},{80,-96},{80,-106.5},{97.5,-106.5}},
                                                             color={191,0,0}));
  connect(UtilityRoom.starRad, rad_U) annotation (Line(points={{-2.72727,-140},
          {-4,-140},{-4,-128.5},{97.5,-128.5}},color={0,0,0}));
  connect(UtilityRoom.thermConv, conv_U) annotation (Line(points={{2.81818,-140},
          {2,-140},{2,-136},{80,-136},{80,-146.5},{97.5,-146.5}}, color={191,0,0}));
  connect(FluidPort_ret_main, FluidPort_ret_main)
    annotation (Line(points={{-20,-240},{-20,-240}}, color={0,127,255}));
  connect(FluidPort_sup_main, FluidPort_sup_main)
    annotation (Line(points={{20,-240},{20,-240}}, color={0,127,255}));
  connect(distributor.mainFlow, FluidPort_ret_main) annotation (Line(points={{
          -10.6667,-220},{-10.6667,-228},{-20,-228},{-20,-240}},
                                                        color={0,127,255}));
  connect(distributor.mainReturn, FluidPort_sup_main) annotation (Line(points={{
          10,-220},{10,-228},{20,-228},{20,-240}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-240},
            {100,460}}), graphics={
        Line(
          points={{-60,-238},{-60,360}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{60,-238},{60,360}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,358},{-50,388},{-40,418},{-20,438},{20,438},{40,418},{60,
              358}},
          color={28,108,200},
          thickness=1)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-240},{100,
            460}})));
end distribution_room;
