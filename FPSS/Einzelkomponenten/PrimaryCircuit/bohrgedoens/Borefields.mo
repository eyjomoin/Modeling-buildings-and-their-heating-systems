within FPSS.Einzelkomponenten.PrimaryCircuit.bohrgedoens;
model Borefields
  "Example model with several borefield configurations operating simultaneously"
  extends Modelica.Icons.Example;

  package Medium = AixLib.Media.Water;

  parameter Modelica.Units.SI.Time tLoaAgg=300
    "Time resolution of load aggregation";

  parameter Modelica.Units.SI.Temperature TGro=283.15 "Ground temperature";
  AixLib.Fluid.Geothermal.Borefields.TwoUTubes borFie2UTubPar(
    redeclare package Medium = Medium,
    borFieDat=borFie2UTubParDat,
    tLoaAgg=tLoaAgg,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    TExt0_start=TGro)
    "Borefield with a 2-U-tube connected in parallel borehole configuration"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  AixLib.Fluid.Sources.MassFlowSource_T sou1(
    redeclare package Medium = Medium,
    nPorts=1,
    use_T_in=false,
    m_flow=borFie2UTubParDat.conDat.mBorFie_flow_nominal,
    T=303.15) "Source" annotation (Placement(transformation(extent={{-92,-10},{
            -72,10}}, rotation=0)));
  AixLib.Fluid.Sensors.TemperatureTwoPort T2UTubParIn(
    redeclare package Medium = Medium,
    m_flow_nominal=borFie2UTubParDat.conDat.mBorFie_flow_nominal,
    tau=0)
    "Inlet temperature of the borefield with 2-UTube in serie configuration"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  AixLib.Fluid.Sources.Boundary_pT sin1(
    redeclare package Medium = Medium,
    use_p_in=false,
    use_T_in=false,
    nPorts=1,
    p=101330,
    T=283.15) "Sink" annotation (Placement(transformation(extent={{90,-10},{70,
            10}}, rotation=0)));
  AixLib.Fluid.Sensors.TemperatureTwoPort T2UTubParOut(
    redeclare package Medium = Medium,
    m_flow_nominal=borFie2UTubParDat.conDat.mBorFie_flow_nominal,
    tau=0)
    "Outlet temperature of the borefield with 2-UTube in parallel configuration"
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  parameter AixLib.Fluid.Geothermal.Borefields.Data.Borefield.Example borFie2UTubParDat(
    filDat=AixLib.Fluid.Geothermal.Borefields.Data.Filling.Bentonite(
    steadyState=true),
    conDat=AixLib.Fluid.Geothermal.Borefields.Data.Configuration.Example(
    borCon=AixLib.Fluid.Geothermal.Borefields.Types.BoreholeConfiguration.DoubleUTubeParallel))
    "Data from the borefield with 2-UTube in parallel borehole configuration"
    annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
equation
  connect(sou1.ports[1], T2UTubParIn.port_a) annotation (
    Line(points = {{-72, 0}, {-60, 0}}, color = {0, 127, 255}));
  connect(T2UTubParIn.port_b, borFie2UTubPar.port_a) annotation (
    Line(points = {{-40, 0}, {-10, 0}}, color = {0, 127, 255}));
  connect(T2UTubParOut.port_a, borFie2UTubPar.port_b) annotation (
    Line(points = {{40, 0}, {10, 0}}, color = {0, 127, 255}));
  connect(T2UTubParOut.port_b, sin1.ports[1]) annotation (
    Line(points = {{60, 0}, {70, 0}}, color = {0, 127, 255}));
  annotation (__Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/Geothermal/Borefields/Examples/Borefields.mos"
        "Simulate and plot"),
  Documentation(info="<html>
<p>
This example shows three different borefields, each with a different configuration
(single U-tube, double U-tube in parallel, and double U-tube in series) and compares
the thermal behaviour of the circulating fluid in each case.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 17, 2024, by Michael Wetter:<br/>
Updated model due to removal of parameter <code>dynFil</code>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1885\">IBPSA, #1885</a>.
</li>
<li>
April 8, 2021, by Michael Wetter:<br/>
Added missing <code>parameter</code> keyword.<br/>
For <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1464\">IBPSA, issue 1464</a>.
</li>
<li>
June 2018, by Damien Picard:<br/>
First implementation.
</li>
</ul>
</html>"),
    experiment(
      StopTime=36000,Tolerance=1e-6),
   __Dymola_LockedEditing="Model from IBPSA");
end Borefields;
