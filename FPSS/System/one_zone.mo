within FPSS.System;
model one_zone
  extends Modelica.Icons.Example;
  package MediumWater = AixLib.Media.Water;
  components.TGA_all.TGA_one_zone_simple tGA_one_zone_simple(MediumWater=
        MediumWater, redeclare FPSS.Parameter.TGA.P_one_zone_start
      Parameter_TGA) annotation (Placement(transformation(origin={14,-50},
          extent={{-90,10},{-62,24}})));
  components.House.house_one_zone_simple building_one_zone annotation (
      Placement(transformation(origin={14,-50}, extent={{12,-12},{52,28}})));
  FPSS.components.DataInput.Selfmade_weather.Input_weather_selfmade_minus2
    DataInput(DeltaT=0) annotation (Placement(transformation(origin={35.7674,
            99.0233}, extent={{-129.767,-49.0233},{-67.7674,12.9767}})));
equation
  connect(DataInput.T_amb, tGA_one_zone_simple.T_amb) annotation (
    Line(points={{-28.9,99.6},{0,99.6},{0,40},{-45.2,40},{-45.2,-8.08}}, color = {0, 0, 127}));
  connect(DataInput.T_amb, building_one_zone.T_ambb) annotation (
    Line(points={{-28.9,99.6},{0,99.6},{0,40},{44.4615,40},{44.4615,-20.3333}},
                                                                        color = {0, 0, 127}));
  connect(building_one_zone.rad_R1, tGA_one_zone_simple.rad_R1) annotation (
    Line(points={{29.3077,-26.4167},{0,-26.4167},{0,-10.67},{-32.7909,-10.67}}));
  connect(building_one_zone.conv_R1, tGA_one_zone_simple.conv_R1) annotation (
    Line(points={{28.6923,-38.4167},{0,-38.4167},{0,-32.79},{-32.5364,-32.79}},
                                                               color = {191, 0, 0}));
  connect(building_one_zone.Q_loss_total, tGA_one_zone_simple.T_Room1) annotation (
    Line(points={{28.7692,-53.6667},{0,-53.6667},{0,-58.2},{-32.7273,-58.2}},
                                                               color = {0, 0, 127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,120}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            120}})),
    experiment(
      StopTime=600000,
      Interval=30,
      __Dymola_Algorithm="Dassl"),
  Documentation(info = "<html><head></head><body>Model consisting of a Heating System model (TGA) and a house model (purple house)<div><br></div><div>We have 3 connections between the models:</div><div><ul><li>Heat flow connector for radiative heat transfer</li><li>Heat flow connector for convective heat transfer</li><li>Real connector that gives the Heating System model the measured temperature of the house</li></ul><div>Both models need the ambient temperature as imput. It is delivered by teh weather model.</div></div><div><br></div><div><br></div></body></html>"));
end one_zone;
