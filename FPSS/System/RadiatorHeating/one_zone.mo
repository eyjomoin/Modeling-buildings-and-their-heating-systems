within FPSS.System.RadiatorHeating;
model one_zone
  extends Modelica.Icons.Example;
  package MediumWater = AixLib.Media.Water;
  Einzelkomponenten.TGA_all.RadiatorHeating.TGA_one_zone tGA_multizone(MediumWater = MediumWater)
    annotation (Placement(transformation(extent={{-56,-26},{-28,44}})));
  Einzelkomponenten.House.house_one_zone multizone_geom
    annotation (Placement(transformation(extent={{12,-12},{52,28}})));
equation
  connect(tGA_multizone.rad_R1, multizone_geom.rad_R1) annotation (Line(points=
          {{-28.05,27.95},{4,27.95},{4,31.375},{7.375,31.375}}, color={0,0,0}));
  connect(multizone_geom.conv_R1, tGA_multizone.conv_R1) annotation (Line(
        points={{6.375,13.375},{-24,13.375},{-24,12.15},{-27.85,12.15}}, color=
          {191,0,0}));
  connect(tGA_multizone.T_Room1, multizone_geom.T_Room1) annotation (Line(
        points={{-28,-6},{-4,-6},{-4,-9.5},{6.5,-9.5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,120}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            120}})),
    experiment(
      StopTime=60000,
      Interval=30,
      __Dymola_Algorithm="Dassl"));
end one_zone;
