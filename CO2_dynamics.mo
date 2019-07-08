within ;
model CO2_dynamics
  Physiolibrary.Chemical.Components.Substance substance(useNormalizedVolume=
        false) annotation (Placement(transformation(extent={{-2,62},{18,82}})));
  Physiolibrary.Chemical.Components.Stream Stream(useSolutionFlowInput=true)
    annotation (Placement(transformation(extent={{-44,50},{-24,70}})));
  Physiolibrary.Chemical.Components.Stream Stream1(useSolutionFlowInput=true)
    annotation (Placement(transformation(extent={{-24,70},{-44,90}})));
  Physiolibrary.Chemical.Components.Substance substance1
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  Physiolibrary.Chemical.Components.Substance substance2
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Physiolibrary.Chemical.Components.Stream Stream2(useSolutionFlowInput=true)
    annotation (Placement(transformation(extent={{12,-68},{-8,-48}})));
  Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage
    unlimitedSolutionStorage
    annotation (Placement(transformation(extent={{-90,62},{-70,82}})));
  Physiolibrary.Chemical.Sources.UnlimitedSolutePump unlimitedSolutePump(
      SoluteFlow=0.001)
    annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  Modelica.Blocks.Sources.Step step(
    height=0.00015,
    offset=0.00015,
    startTime=100)
    annotation (Placement(transformation(extent={{-66,90},{-58,98}})));
  Physiolibrary.Types.Constants.VolumeConst dead_volume(k=0.0002)
    annotation (Placement(transformation(extent={{-12,88},{-4,96}})));
  Physiolibrary.Chemical.Components.Diffusion diffusion(Conductance(displayUnit
        ="l/min") = 0.016666666666667)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k(
        displayUnit="l/min") = 8.3333333333333e-05)
    annotation (Placement(transformation(extent={{-26,-32},{-18,-24}})));
  Physiolibrary.Chemical.Components.Stream Stream3(useSolutionFlowInput=true)
    annotation (Placement(transformation(extent={{-8,10},{12,-10}})));
equation
  connect(unlimitedSolutionStorage.q_out, Stream.q_in) annotation (Line(
      points={{-70,72},{-58,72},{-58,60},{-44,60}},
      color={107,45,134},
      thickness=1));
  connect(substance.q_out, Stream.q_out) annotation (Line(
      points={{8,72},{-10,72},{-10,60},{-24,60}},
      color={107,45,134},
      thickness=1));
  connect(unlimitedSolutionStorage.q_out, Stream1.q_out) annotation (Line(
      points={{-70,72},{-58,72},{-58,80},{-44,80}},
      color={107,45,134},
      thickness=1));
  connect(substance.q_out, Stream1.q_in) annotation (Line(
      points={{8,72},{-10,72},{-10,80},{-24,80}},
      color={107,45,134},
      thickness=1));
  connect(Stream.solutionFlow, step.y) annotation (Line(points={{-34,67},{-46,
          67},{-46,94},{-57.6,94}}, color={0,0,127}));
  connect(Stream1.solutionFlow, step.y) annotation (Line(points={{-34,87},{-46,
          87},{-46,94},{-57.6,94}}, color={0,0,127}));
  connect(substance1.q_out, Stream2.q_in) annotation (Line(
      points={{50,-30},{50,-58},{12,-58}},
      color={107,45,134},
      thickness=1));
  connect(substance2.q_out, Stream2.q_out) annotation (Line(
      points={{-50,-30},{-50,-58},{-8,-58}},
      color={107,45,134},
      thickness=1));
  connect(substance.solutionVolume, dead_volume.y)
    annotation (Line(points={{4,76},{0,76},{0,92},{-3,92}}, color={0,0,127}));
  connect(Stream3.q_in, substance2.q_out) annotation (Line(
      points={{-8,0},{-50,0},{-50,-30}},
      color={107,45,134},
      thickness=1));
  connect(Stream3.q_out, substance1.q_out) annotation (Line(
      points={{12,0},{50,0},{50,-30}},
      color={107,45,134},
      thickness=1));
  connect(volumeFlowRate1.y, Stream3.solutionFlow)
    annotation (Line(points={{-17,-28},{2,-28},{2,-7}}, color={0,0,127}));
  connect(volumeFlowRate1.y, Stream2.solutionFlow)
    annotation (Line(points={{-17,-28},{2,-28},{2,-51}}, color={0,0,127}));
  connect(unlimitedSolutePump.q_out, Stream2.q_out) annotation (Line(
      points={{-20,-80},{-8,-80},{-8,-58}},
      color={107,45,134},
      thickness=1));
  connect(substance.q_out, diffusion.q_in) annotation (Line(
      points={{8,72},{8,30},{20,30}},
      color={107,45,134},
      thickness=1));
  connect(diffusion.q_out, substance1.q_out) annotation (Line(
      points={{40,30},{50,30},{50,-30}},
      color={107,45,134},
      thickness=1));
  annotation (uses(Physiolibrary(version="2.3.2-beta"), Modelica(version=
            "3.2.3")), experiment(StopTime=150));
end CO2_dynamics;
