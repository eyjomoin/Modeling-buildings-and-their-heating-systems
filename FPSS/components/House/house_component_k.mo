within FPSS.components.House;

model house_component_k
  parameter Modelica.Units.SI.Area CA = 150 "Area of the component";
  parameter Modelica.Units.SI.Distance Cd = 0.02 "Thickness of the component";
  parameter Modelica.Units.SI.SpecificHeatCapacity Ccp = 960 "Specific heat capacity of the component";
  parameter Modelica.Units.SI.Density Crho = 500 "Density of the component";
  parameter Modelica.Units.SI.ThermalConductivity Ck = 0.18 "thermal conductivity of the component";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer Ch = 2 "Convective heat transfer coefficient of the component";
  parameter Modelica.Units.SI.Temperature T_start = 273.15 + 20 "starting temperature of the component";
  parameter Real R_Rad = 0.01 "Thermal resistance for radiative heat tranfer";
  AixLib.Utilities.Interfaces.RadPort rad "radiative heat coming from the radiator" annotation(
    Placement(transformation(origin = {40, -86}, extent = {{-128, 68}, {-113, 83}}), iconTransformation(origin = {125.2, -243.6}, extent = {{-265.2, 223.6}, {-226.2, 262.6}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cap(C = Ccp*(CA*Cd*Crho), T(start = T_start, fixed = true)) "Heat Capacity of the component" annotation(
    Placement(transformation(origin = {0, 10}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor R_cond_conv_e(R = Cd/(CA*Ck)) "Thermal resistor for heat transfer from component to outer conditions" annotation(
    Placement(transformation(origin = {46, -93}, extent = {{114, -19}, {152, 19}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor R_conv_i(R = 1/(Ch*CA)) "Thermal resistance for convective heat transfer between component and air" annotation(
    Placement(transformation(origin = {0, -44}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Real_to_T "Transferring the temperature signal(which is a Real) into a temperature" annotation(
    Placement(transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput T_out(unit = "K") "Temperature signal coming from the weather file" annotation(
    Placement(transformation(origin = {-86, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 180), iconTransformation(origin = {-120, 100}, extent = {{20, -20}, {-20, 20}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor res_rad(R = R_Rad) "Thermal resistance for radiative heat transfer between radiator and component" annotation(
    Placement(transformation(origin = {-90, -10}, extent = {{36, -6}, {48, 6}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a conv "convective heat that is transferred from the body to the air" annotation(
    Placement(transformation(origin = {202, -10}, extent = {{-128, -68}, {-113, -53}}), iconTransformation(origin = {390.4, -116.4}, extent = {{-270.4, 36.4}, {-231.4, 75.4}})));
equation
  connect(R_cond_conv_e.port_a, Cap.port) annotation(
    Line(points = {{46, 21}, {46, -10}, {0, -10}}, color = {191, 0, 0}));
  connect(Cap.port, R_conv_i.port_b) annotation(
    Line(points = {{0, -10}, {0, -24}}, color = {191, 0, 0}));
  connect(R_conv_i.port_a, conv) annotation(
    Line(points = {{0, -64}, {1, -64}, {1, -70.5}, {81.5, -70.5}}, color = {191, 0, 0}));
  connect(res_rad.port_b, Cap.port) annotation(
    Line(points = {{-42, -10}, {0, -10}}, color = {191, 0, 0}));
  connect(T_out, Real_to_T.T) annotation(
    Line(points = {{-86, 70}, {-62, 70}}, color = {0, 0, 127}));
  connect(Real_to_T.port, R_cond_conv_e.port_b) annotation(
    Line(points = {{-40, 70}, {-40, 71}, {46, 71}, {46, 59}}, color = {191, 0, 0}));
  connect(rad, res_rad.port_a) annotation(
    Line(points = {{-80.5, -10.5}, {-54.5, -10.5}}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 120}}), graphics = {Rectangle(fillPattern = FillPattern.Cross, extent = {{-40, 40}, {40, -40}}), Line(origin = {-74, 72}, points = {{-20, -20}, {20, 20}}, thickness = 5), Line(origin = {78.4814, -58.2493}, points = {{-50, 42}, {34, 0}}, color = {255, 0, 0}, thickness = 4, arrow = {Arrow.Filled, Arrow.Filled}), Line(origin = {-135.777, 92.5951}, points = {{92, -46}, {34, 0}}, color = {255, 0, 0}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-78.6194, -0.130318}, points = {{-34, 0}, {34, 0}}, color = {255, 0, 0}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {-7, -98}, extent = {{-109, 30}, {109, -30}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -80}, {80, 80}})),
    Documentation(info = "<html><head></head><body><p>Simple Model for heat transfer through a component of a house (e.g. wall, window, roof,...). There are 3 kinds of heat transfer from and to the thermal capacity of the component:</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>1. Radiative heat transfer from heat port rad (radiator)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>2. Convective heat transfer from heat port conv (indor air)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>3. Conductive heat transfer through the component to outside air&nbsp;</p><p>The convective heat transfer from wall to outside air is neglected. The thermal resistances are calculated with the help of area A, thicknes d, thermal conductivity k and convective heat transfer coefficient h.</p>
</body></html>"));
end house_component_k;
