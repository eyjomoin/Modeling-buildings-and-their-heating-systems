within FPSS.Einzelkomponenten.Control.HeatingCurve.Functions;
function HeatingCurve_inclination_height_bounded
  input Real inclination "inclination of the linear function";
  input Modelica.Units.SI.Temperature height "height of the linear function";
  input Modelica.Units.SI.Temperature TAmb "acutal ambient temperature";
  input Modelica.Units.SI.Temperature Tlow "lower bound of heating curve";
  input Modelica.Units.SI.Temperature Thigh "higher bound of heating curve";
  output Modelica.Units.SI.Temperature TSet "actual temperature set point";

algorithm
  if TAmb < Tlow then
    TSet := inclination * Tlow + height;
  elseif TAmb > Thigh then
    TSet := inclination * Thigh + height;
  else
    TSet := inclination * TAmb + height;
  end if;


end HeatingCurve_inclination_height_bounded;
