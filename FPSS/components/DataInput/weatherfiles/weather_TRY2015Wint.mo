within FPSS.components.DataInput.weatherfiles;
record weather_TRY2015Wint
  extends weather_base_const(
  filename="modelica://FPSS/data/selfmade/TRY2015_converted_Wint.txt"
  );
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "input_weather");
end weather_TRY2015Wint;
