within FPSS.System.FloorHeating;
model house_with_rooms
  extends Modelica.Icons.Example;
  Einzelkomponenten.TGA_all.FloorHeating.TGA_rooms tGA
    annotation (Placement(transformation(extent={{-100,-98},{-18,112}})));
  Einzelkomponenten.House.House_geom house_geom2_1
    annotation (Placement(transformation(extent={{20,-96},{82,116}})));
equation
  connect(house_geom2_1.rad_R1, tGA.rad_R1) annotation (Line(points={{17.4812,
          111.609},{17.4812,110},{-20,110},{-20,110.65},{-19.3179,110.65}},
        color={0,0,0}));
  connect(house_geom2_1.conv_R1, tGA.conv_R1) annotation (Line(points={{17.4812,
          106.157},{16,105.25},{-19.3179,105.25}}, color={191,0,0}));
  connect(house_geom2_1.T_Room1, tGA.T_Room1) annotation (Line(points={{16.125,
          99.6457},{-12,99.6457},{-12,98.2},{-19.7571,98.2}}, color={0,0,127}));
  connect(house_geom2_1.rad_R2, tGA.rad_R2) annotation (Line(points={{17.4812,
          87.38},{16,87.85},{-18.7321,87.85}}, color={0,0,0}));
  connect(house_geom2_1.conv_R2, tGA.conv_R2) annotation (Line(points={{17.4812,
          81.9286},{16,82.45},{-18.7321,82.45}}, color={191,0,0}));
  connect(house_geom2_1.T_Room2, tGA.T_Room2) annotation (Line(points={{16.125,
          76.0229},{-10,76.0229},{-10,74.8},{-19.7571,74.8}}, color={0,0,127}));
  connect(house_geom2_1.rad_R3, tGA.rad_R3) annotation (Line(points={{17.4812,
          63.7571},{16,63.25},{-18.1464,63.25}}, color={0,0,0}));
  connect(house_geom2_1.conv_R3, tGA.conv_R3) annotation (Line(points={{17.8687,
          57.7},{16,57.85},{-17.8536,57.85}}, color={191,0,0}));
  connect(house_geom2_1.T_Room3, tGA.T_Room3) annotation (Line(points={{16.125,
          52.4},{-10,52.4},{-10,50.2},{-18.5857,50.2}}, color={0,0,127}));
  connect(house_geom2_1.rad_R4, tGA.rad_R4) annotation (Line(points={{17.4812,
          39.5286},{-10,39.5286},{-10,38.65},{-18.1464,38.65}}, color={0,0,0}));
  connect(house_geom2_1.conv_R4, tGA.conv_R4) annotation (Line(points={{17.4812,
          34.0771},{16,33.25},{-18.1464,33.25}}, color={191,0,0}));
  connect(house_geom2_1.T_Room4, tGA.T_Room4) annotation (Line(points={{16.125,
          28.1714},{-10,28.1714},{-10,26.2},{-18.5857,26.2}}, color={0,0,127}));
  connect(house_geom2_1.rad_R5, tGA.rad_R5) annotation (Line(points={{17.4812,
          15.3},{-10,15.3},{-10,14.65},{-18.1464,14.65}}, color={0,0,0}));
  connect(house_geom2_1.conv_R5, tGA.conv_R5) annotation (Line(points={{17.4812,
          9.84857},{16,9.25},{-18.1464,9.25}}, color={191,0,0}));
  connect(house_geom2_1.T_Room5, tGA.T_Room5) annotation (Line(points={{16.125,
          3.94286},{-10,3.94286},{-10,2.8},{-19.1714,2.8}}, color={0,0,127}));
  connect(house_geom2_1.rad_B, tGA.rad_B) annotation (Line(points={{17.4812,
          -8.92857},{16,-8.75},{-18.1464,-8.75}}, color={0,0,0}));
  connect(house_geom2_1.conv_B, tGA.conv_B) annotation (Line(points={{17.4812,
          -14.38},{16,-14.15},{-18.1464,-14.15}}, color={191,0,0}));
  connect(house_geom2_1.T_Bathroom, tGA.T_Bathroom) annotation (Line(points={{16.125,
          -19.68},{-10,-19.68},{-10,-21.2},{-18.5857,-21.2}},        color={0,0,
          127}));
  connect(house_geom2_1.rad_K, tGA.rad_K) annotation (Line(points={{17.4812,
          -32.5514},{16,-32.75},{-18.1464,-32.75}}, color={0,0,0}));
  connect(house_geom2_1.conv_K, tGA.conv_K) annotation (Line(points={{17.4812,
          -38.0029},{16,-38.15},{-18.1464,-38.15}}, color={191,0,0}));
  connect(house_geom2_1.T_Kitchen, tGA.T_Kitchen) annotation (Line(points={{16.125,
          -43.3029},{-10,-43.3029},{-10,-45.2},{-18.5857,-45.2}},        color=
          {0,0,127}));
  connect(house_geom2_1.rad_C, tGA.rad_C) annotation (Line(points={{17.4812,
          -56.78},{16,-56.75},{-18.1464,-56.75}}, color={0,0,0}));
  connect(house_geom2_1.conv_C, tGA.conv_C) annotation (Line(points={{17.4812,
          -62.2314},{16,-62.15},{-18.1464,-62.15}}, color={191,0,0}));
  connect(house_geom2_1.T_Corridor, tGA.T_Corridor) annotation (Line(points={{16.125,
          -67.5314},{-10,-67.5314},{-10,-69.8},{-18.5857,-69.8}},        color=
          {0,0,127}));
  connect(house_geom2_1.rad_U, tGA.rad_U) annotation (Line(points={{16.7062,
          -81.6143},{-10,-81.6143},{-10,-80.75},{-18.1464,-80.75}}, color={0,0,
          0}));
  connect(house_geom2_1.conv_U, tGA.conv_U) annotation (Line(points={{16.7062,
          -87.0657},{-10,-87.0657},{-10,-86.15},{-18.1464,-86.15}}, color={191,
          0,0}));
  connect(house_geom2_1.T_Utilityroom, tGA.T_Utilityroom) annotation (Line(
        points={{16.125,-92.9714},{-10,-92.9714},{-10,-93.8},{-18.5857,-93.8}},
        color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,120}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            120}})),
    experiment(StopTime=1000000, __Dymola_Algorithm="Dassl"));
end house_with_rooms;
