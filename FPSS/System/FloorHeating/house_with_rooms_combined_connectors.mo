within FPSS.System.FloorHeating;
model house_with_rooms_combined_connectors
  extends Modelica.Icons.Example;
  Einzelkomponenten.TGA_all.FloorHeating.TGA_rooms_combined_connectors
    tGA_rooms_combined_connectors
    annotation (Placement(transformation(extent={{-82,-18},{-12,18}})));
  Einzelkomponenten.House.House_geom_combined_connectors
    house_geom_combined_connectors
    annotation (Placement(transformation(extent={{22,-16},{46,14}})));
equation
  connect(tGA_rooms_combined_connectors.rad_rooms,
    house_geom_combined_connectors.rad_rooms) annotation (Line(points={{
          -12.0875,11.07},{20.5,11.07},{20.5,9.5}}, color={0,0,0}));
  connect(tGA_rooms_combined_connectors.conv_rooms,
    house_geom_combined_connectors.conv_rooms) annotation (Line(points={{
          -11.7375,-0.09},{20.2,-0.09},{20.2,0.5}}, color={191,0,0}));
  connect(tGA_rooms_combined_connectors.T_Rooms, house_geom_combined_connectors.T_Rooms)
    annotation (Line(points={{-11.3,-10.8},{-10,-10},{18.7,-10}}, color={0,0,
          127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,120}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            120}})),
    experiment(StopTime=1000000, __Dymola_Algorithm="Dassl"));
end house_with_rooms_combined_connectors;
