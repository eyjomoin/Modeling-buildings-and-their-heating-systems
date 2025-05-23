within FPSS.components.DataInput.weatherfiles;
record weather_gen_all_temp "Artivficial sequence of all possible temperatures"
  extends weather_base_const(
  filename="modelica://FPSS/data/selfmade/temperature_selfmade_all_temp.txt"
  );
  annotation (
      defaultComponentPrefixes = "parameter",
      defaultComponentName = "input_weather");
end weather_gen_all_temp;
