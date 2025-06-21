within FPSS.components.DataInput.weatherfiles;
record weather_TRY2045Somm
  extends weather_base_const(
  filename="modelica://FPSS/data/selfmade/TRY2045_converted_Somm.txt"
  );
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "input_weather");
end weather_TRY2045Somm;
