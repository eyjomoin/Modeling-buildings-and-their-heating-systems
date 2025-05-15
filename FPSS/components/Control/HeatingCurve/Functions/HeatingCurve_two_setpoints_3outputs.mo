within FPSS.components.Control.HeatingCurve.Functions;
function HeatingCurve_two_setpoints_3outputs

  input Modelica.Units.SI.Temperature T_amb1 "ambient temperature point 1";
  input Modelica.Units.SI.Temperature T_set1 "supply set temperature point 1";
  input Modelica.Units.SI.Temperature T_amb2 "ambient temperature point 2";
  input Modelica.Units.SI.Temperature T_set2 "supply set temperature point 2";
  input Modelica.Units.SI.Temperature TAmb "acutal ambient temperature";
  output Modelica.Units.SI.Temperature TSet "actual temperature set point";
  output Real slope "slope of the linear function";
  output Modelica.Units.SI.Temperature n "height of the linear function";

algorithm
  slope :=   (T_set2-T_set1)/(T_amb2-T_amb1);
  n :=   T_set2 - slope * T_amb2;

  if TAmb < T_amb1 then
    TSet := T_set1;
  elseif TAmb > T_amb2 then
    TSet := T_set2;
  else
    TSet := slope * TAmb + n;
  end if;

end HeatingCurve_two_setpoints_3outputs;
