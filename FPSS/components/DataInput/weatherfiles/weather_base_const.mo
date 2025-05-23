within FPSS.components.DataInput.weatherfiles;
record weather_base_const "base record for weather input files - constant temperature of 0°C"
extends Modelica.Icons.Record;

parameter String filename="modelica://FPSS/data/selfmade/temperature_selfmade_const.txt" "weather input file" ;

annotation (
    defaultComponentPrefixes = "parameter",
    defaultComponentName = "input_weather");
end weather_base_const;
