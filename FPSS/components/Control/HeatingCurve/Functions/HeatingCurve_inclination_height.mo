within FPSS.components.Control.HeatingCurve.Functions;
function HeatingCurve_inclination_height
  input Real inclination "inclination of the linear function";
  input Modelica.Units.SI.Temperature height "height of the linear function";
  input Modelica.Units.SI.Temperature TAmb "acutal ambient temperature";
  output Modelica.Units.SI.Temperature TSet "actual temperature set point";

algorithm
   TSet := inclination * TAmb + height;

end HeatingCurve_inclination_height;
