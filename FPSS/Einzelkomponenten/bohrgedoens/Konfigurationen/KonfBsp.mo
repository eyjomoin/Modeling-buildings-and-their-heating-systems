within FPSS.Einzelkomponenten.bohrgedoens.Konfigurationen;
record KonfBsp "Example definition of a configuration data record"
  extends AixLib.Fluid.Geothermal.Borefields.Data.Configuration.Template(
  borCon = AixLib.Fluid.Geothermal.Borefields.Types.BoreholeConfiguration.SingleUTube,
  cooBor = {{0, 0}, {0, 6}, {6, 0}, {6, 6}},
  mBor_flow_nominal = 0.438,
  dp_nominal = 5e4,
  hBor = 100.0,
  rBor = 0.075,
  dBor = 1.0,
  rTub = 0.02,
  kTub = 0.5,
  eTub = 0.002,
  xC = 0.05);                                // Cartesian coordinates of the boreholes in meters
                             // in experiment 2,3,4: mBor_flow_nominal = 0.438 | in experiment1: mBor_flow_nominal = 3.1326
            // Shank spacing, defined as the distance between the center of a pipe and the center of the borehole
  annotation (
    defaultComponentPrefixes = "parameter",
    defaultComponentName = "conDat",
    Documentation(info = "<html>
<p>
This record presents an example for how to define configuration data records
using the template in
<a href=\"modelica://AixLib.Fluid.Geothermal.Borefields.Data.Configuration.Template\">
AixLib.Fluid.Geothermal.Borefields.Data.Configuration.Template</a>.
</p>
</html>", revisions = "<html>
<ul>
<li>
July 15, 2018, by Michael Wetter:<br/>
Revised implementation, added <code>defaultComponentPrefixes</code> and
<code>defaultComponentName</code>.
</li>
<li>
June 28, 2018, by Damien Picard:<br/>
First implementation.
</li>
</ul>
</html>"),
    __Dymola_LockedEditing = "Model from IBPSA");
end KonfBsp;
