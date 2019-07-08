within ;
model CO2_dynamics
  Physiolibrary.Chemical.Components.Substance Lungs(useNormalizedVolume=false)
    annotation (Placement(transformation(extent={{10,62},{30,82}})));
  Physiolibrary.Chemical.Components.Stream Stream(useSolutionFlowInput=true)
    annotation (Placement(transformation(extent={{-44,50},{-24,70}})));
  Physiolibrary.Chemical.Components.Stream Stream1(useSolutionFlowInput=true)
    annotation (Placement(transformation(extent={{-24,70},{-44,90}})));
  Physiolibrary.Chemical.Components.Substance Arteries(useNormalizedVolume=
        false)
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  Physiolibrary.Chemical.Components.Substance Veins(useNormalizedVolume=false)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Physiolibrary.Chemical.Components.Stream Heart1(useSolutionFlowInput=true)
    annotation (Placement(transformation(extent={{12,-68},{-8,-48}})));
  Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage environment
    annotation (Placement(transformation(extent={{-90,62},{-70,82}})));
  Physiolibrary.Chemical.Sources.UnlimitedSolutePump unlimitedSolutePump(
      SoluteFlow=0.001)
    annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  Modelica.Blocks.Sources.Step step(
    height=6.6666666666667e-05,
    offset=0.0001,
    startTime=500)
    annotation (Placement(transformation(extent={{-66,90},{-58,98}})));
  Physiolibrary.Types.Constants.VolumeConst dead_volume(k=0.0002)
    annotation (Placement(transformation(extent={{-12,88},{-4,96}})));
  Physiolibrary.Chemical.Components.Diffusion diffusion(Conductance(displayUnit=
         "l/min") = 0.016666666666667)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k(
        displayUnit="l/min") = 8.3333333333333e-05)
    annotation (Placement(transformation(extent={{-26,-32},{-18,-24}})));
  Physiolibrary.Chemical.Components.Stream Heart2(useSolutionFlowInput=true)
    annotation (Placement(transformation(extent={{-8,10},{12,-10}})));
  Physiolibrary.Types.Constants.VolumeConst dead_volume1(k=0.004)
    annotation (Placement(transformation(extent={{-78,-28},{-70,-20}})));
  Physiolibrary.Types.Constants.VolumeConst dead_volume2(k=0.001)
    annotation (Placement(transformation(extent={{18,-28},{26,-20}})));
  Physiolibrary.Chemical.Components.AdvectionStream Heart3(
    useSolutionFlowInput=true,
    N=100,
    length=10,
    d=0.02) annotation (Placement(transformation(extent={{-22,-68},{-42,-48}})));
equation
  connect(environment.q_out, Stream.q_in) annotation (Line(
      points={{-70,72},{-58,72},{-58,60},{-44,60}},
      color={107,45,134},
      thickness=1));
  connect(Lungs.q_out, Stream.q_out) annotation (Line(
      points={{20,72},{-10,72},{-10,60},{-24,60}},
      color={107,45,134},
      thickness=1));
  connect(environment.q_out, Stream1.q_out) annotation (Line(
      points={{-70,72},{-58,72},{-58,80},{-44,80}},
      color={107,45,134},
      thickness=1));
  connect(Lungs.q_out, Stream1.q_in) annotation (Line(
      points={{20,72},{-10,72},{-10,80},{-24,80}},
      color={107,45,134},
      thickness=1));
  connect(Stream.solutionFlow, step.y) annotation (Line(points={{-34,67},{-46,
          67},{-46,94},{-57.6,94}}, color={0,0,127}));
  connect(Stream1.solutionFlow, step.y) annotation (Line(points={{-34,87},{-46,
          87},{-46,94},{-57.6,94}}, color={0,0,127}));
  connect(Arteries.q_out, Heart1.q_in) annotation (Line(
      points={{50,-30},{50,-58},{12,-58}},
      color={107,45,134},
      thickness=1));
  connect(Lungs.solutionVolume, dead_volume.y)
    annotation (Line(points={{16,76},{0,76},{0,92},{-3,92}},color={0,0,127}));
  connect(Heart2.q_in, Veins.q_out) annotation (Line(
      points={{-8,0},{-50,0},{-50,-30}},
      color={107,45,134},
      thickness=1));
  connect(Heart2.q_out, Arteries.q_out) annotation (Line(
      points={{12,0},{50,0},{50,-30}},
      color={107,45,134},
      thickness=1));
  connect(volumeFlowRate1.y, Heart2.solutionFlow)
    annotation (Line(points={{-17,-28},{2,-28},{2,-7}}, color={0,0,127}));
  connect(volumeFlowRate1.y, Heart1.solutionFlow)
    annotation (Line(points={{-17,-28},{2,-28},{2,-51}}, color={0,0,127}));
  connect(unlimitedSolutePump.q_out, Heart1.q_out) annotation (Line(
      points={{-20,-80},{-8,-80},{-8,-58}},
      color={107,45,134},
      thickness=1));
  connect(Lungs.q_out, diffusion.q_in) annotation (Line(
      points={{20,72},{20,30}},
      color={107,45,134},
      thickness=1));
  connect(diffusion.q_out, Arteries.q_out) annotation (Line(
      points={{40,30},{50,30},{50,-30}},
      color={107,45,134},
      thickness=1));
  connect(Veins.solutionVolume, dead_volume1.y) annotation (Line(points={{-54,
          -26},{-62,-26},{-62,-24},{-69,-24}}, color={0,0,127}));
  connect(Arteries.solutionVolume, dead_volume2.y) annotation (Line(points={{46,
          -26},{36,-26},{36,-24},{27,-24}}, color={0,0,127}));
  connect(Veins.q_out, Heart3.q_out) annotation (Line(
      points={{-50,-30},{-50,-58},{-42,-58}},
      color={107,45,134},
      thickness=1));
  connect(Heart3.q_in, Heart1.q_out) annotation (Line(
      points={{-22,-58},{-8,-58}},
      color={107,45,134},
      thickness=1));
  connect(Heart3.solutionFlow, Heart1.solutionFlow) annotation (Line(points={{
          -32,-51},{-16,-51},{-16,-42},{2,-42},{2,-51}}, color={0,0,127}));
  annotation (uses(Physiolibrary(version="2.3.2-beta"), Modelica(version=
            "3.2.3")), experiment(StopTime=750));
end CO2_dynamics;
