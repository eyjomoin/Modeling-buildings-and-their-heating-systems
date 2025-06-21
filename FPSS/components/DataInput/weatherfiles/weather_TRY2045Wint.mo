within FPSS.components.DataInput.weatherfiles;
record weather_TRY2045Wint
  extends weather_base_const(
  filename="modelica://FPSS/data/selfmade/TRY2045_converted_Wint.txt"
  );
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "input_weather");
end weather_TRY2045Wint;
