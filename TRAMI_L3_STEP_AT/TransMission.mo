within TRAMI_L3_STEP_AT;
package TransMission
  package Mechanics
    model TransMission
      constant Real GearRatio[9] = {5.354, 3.243, 2.252, 1.636, 1.211, 1, 0.865, 0.717, 0.601};
      Real SyncRev[9];
      parameter Real Oil_Viscosity_Breakpoint[:];
      Modelica.Blocks.Interfaces.RealInput tau_clutch_cap[6] annotation (
        Placement(visible = true, transformation(origin = {-120, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput trq_FW_PNT_in_Nm annotation (
        Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_DS_PNT_out_radps annotation (
        Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_ENG_PNT_radps annotation (
        Placement(visible = true, transformation(origin = {110, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_DS_PNT_out_Nm annotation (
        Placement(visible = true, transformation(origin = {110, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_GB_PNT_W annotation (
        Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput ratio_AT annotation (
        Placement(visible = true, transformation(origin = {-120, -76}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
        Placement(visible = true, transformation(origin = {-120, -108}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
        Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_gearbox_input_radps annotation (
        Placement(visible = true, transformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 260}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_gearbox_output_radps annotation (
        Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput I_actuator_A annotation (
        Placement(visible = true, transformation(origin = {-120, -170}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput I_EOP_A annotation (
        Placement(visible = true, transformation(origin = {-120, -210}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -240}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput V_BT_PNT_Lo_V annotation (
        Placement(visible = true, transformation(origin = {-120, -250}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_HYD_W annotation (
        Placement(visible = true, transformation(origin = {110, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_SD_PNT_W annotation (
        Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.OilPump oilPump(Oil_Pump_Loss_Table_Filename = "OP.txt", Oil_Viscosity_Breakpoint = {5.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6}) annotation (
        Placement(visible = true, transformation(origin = {6, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Vehicle.Flywheel Flywheel(Jfw = 0.29) annotation (
        Placement(visible = true, transformation(origin = {-70, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Electrics.Actuator_eLoss actuator_eLoss annotation (
        Placement(visible = true, transformation(origin = {6, -174}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Electrics.EOP_eLoss eOP_eLoss annotation (
        Placement(visible = true, transformation(origin = {6, -214}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.AT_DS at_ds(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {6, 1.49012e-08}, extent = {{-10, -30}, {10, 28}}, rotation = 0)));
      Modelica.Blocks.Math.Add3 add3 annotation (
        Placement(visible = true, transformation(origin = {70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput tau_lockup_cap annotation (
        Placement(visible = true, transformation(origin = {-120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 240}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput ToutOil annotation (
        Placement(visible = true, transformation(origin = {-120, -138}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    equation
      for i in 1:9 loop
        SyncRev[i] = w_gearbox_output_radps * GearRatio[i];
      end for;
      connect(p_line_Pa, at_ds.p_line_Pa) annotation (
        Line(points = {{-120, -108}, {-30, -108}, {-30, -10}, {-6, -10}}, color = {0, 0, 127}));
      connect(Flywheel.w_TM_PNT_FW_radps, at_ds.w_TM_PNT_FW_radps) annotation (
        Line(points = {{-59, 8}, {-6, 8}}, color = {0, 0, 127}));
      connect(w_DS_PNT_out_radps, at_ds.w_DS_PNT_out_radps) annotation (
        Line(points = {{-120, -40}, {-40, -40}, {-40, 2}, {-6, 2}}, color = {0, 0, 127}));
      connect(nu_oil_m2ps, at_ds.nu_oil_m2ps) annotation (
        Line(points = {{-120, 40}, {-44, 40}, {-44, 14}, {-6, 14}}, color = {0, 0, 127}));
      connect(nu_oil_m2ps, oilPump.nu_oil_m2ps) annotation (
        Line(points = {{-120, 40}, {-44, 40}, {-44, -72}, {-5, -72}}, color = {0, 0, 127}));
      connect(ratio_AT, at_ds.ratio_AT) annotation (
        Line(points = {{-120, -76}, {-36, -76}, {-36, -4}, {-6, -4}}, color = {0, 0, 127}));
      connect(oilPump.PHI_TM_PNT_OP_W, add3.u1) annotation (
        Line(points = {{17, -72}, {38, -72}, {38, -102}, {58, -102}}, color = {0, 0, 127}));
      connect(p_line_Pa, oilPump.p_Line_Pa) annotation (
        Line(points = {{-120, -108}, {-30, -108}, {-30, -68}, {-5, -68}}, color = {0, 0, 127}));
      connect(tau_lockup_cap, at_ds.tau_lockup_cap) annotation (
        Line(points = {{-120, 70}, {-20, 70}, {-20, 20}, {-6, 20}}, color = {0, 0, 127}));
      connect(tau_clutch_cap, at_ds.tau_clutch_cap) annotation (
        Line(points = {{-120, 100}, {-12, 100}, {-12, 26}, {-6, 26}}, color = {0, 0, 127}, thickness = 0.5));
      connect(add3.y, Qf_HYD_W) annotation (
        Line(points = {{81, -110}, {110, -110}}, color = {0, 0, 127}));
      connect(at_ds.Qf_GB_PNT_W, Qf_GB_PNT_W) annotation (
        Line(points = {{17, -16}, {50, -16}, {50, -70}, {110, -70}}, color = {0, 0, 127}));
      connect(at_ds.Qf_SD_PNT_W, Qf_SD_PNT_W) annotation (
        Line(points = {{17, -10}, {60, -10}, {60, -30}, {110, -30}}, color = {0, 0, 127}));
      connect(eOP_eLoss.PHI_TM_PNT_EOP_W, add3.u3) annotation (
        Line(points = {{17, -214}, {52, -214}, {52, -118}, {58, -118}}, color = {0, 0, 127}));
      connect(actuator_eLoss.PHI_TM_PNT_Actuator_W, add3.u2) annotation (
        Line(points = {{17, -174}, {37.5, -174}, {37.5, -110}, {58, -110}}, color = {0, 0, 127}));
      connect(at_ds.w_gearbox_output_radps, w_gearbox_output_radps) annotation (
        Line(points = {{17, 18}, {50, 18}, {50, 70}, {110, 70}}, color = {0, 0, 127}));
      connect(at_ds.w_gearbox_input_radps, w_gearbox_input_radps) annotation (
        Line(points = {{17, 26}, {40, 26}, {40, 90}, {110, 90}}, color = {0, 0, 127}));
      connect(Flywheel.w_ENG_PNT_radps, w_ENG_PNT_radps) annotation (
        Line(points = {{-81, 8}, {-88, 8}, {-88, 46}, {110, 46}}, color = {0, 0, 127}));
      connect(trq_FW_PNT_in_Nm, Flywheel.trq_ENG_PNT_in_Nm) annotation (
        Line(points = {{-120, 0}, {-82, 0}}, color = {0, 0, 127}));
      connect(V_BT_PNT_Lo_V, actuator_eLoss.V_BT_PNT_Lo_V) annotation (
        Line(points = {{-120, -250}, {-20, -250}, {-20, -178}, {-6, -178}}, color = {0, 0, 127}));
      connect(I_actuator_A, actuator_eLoss.I_actuator_A) annotation (
        Line(points = {{-120, -170}, {-6, -170}}, color = {0, 0, 127}));
      connect(V_BT_PNT_Lo_V, eOP_eLoss.V_BT_PNT_Lo_V) annotation (
        Line(points = {{-120, -250}, {-20, -250}, {-20, -218}, {-6, -218}}, color = {0, 0, 127}));
      connect(I_EOP_A, eOP_eLoss.I_EOP_A) annotation (
        Line(points = {{-120, -210}, {-6, -210}}, color = {0, 0, 127}));
      connect(at_ds.trq_TM_PNT_FW_Nm, Flywheel.trq_TM_PNT_FW_Nm) annotation (
        Line(points = {{17, 8}, {40, 8}, {40, -44}, {-52, -44}, {-52, 0}, {-58, 0}}, color = {0, 0, 127}));
      connect(at_ds.trq_DS_PNT_out_Nm, trq_DS_PNT_out_Nm) annotation (
        Line(points = {{18, 2}, {102, 2}, {102, 2}, {110, 2}}, color = {0, 0, 127}));
      connect(oilPump.trq_AT_PNT_Nm, at_ds.trq_TM_PNT_OP_Nm) annotation (
        Line(points = {{-4, -62}, {-18, -62}, {-18, -22}, {-6, -22}, {-6, -22}}, color = {0, 0, 127}));
      connect(at_ds.w_TM_PNT_OP_radps, oilPump.w_AT_PNT_radps) annotation (
        Line(points = {{-4, -26}, {-12, -26}, {-12, -56}, {-6, -56}, {-6, -56}}, color = {0, 0, 127}));
      connect(ToutOil, at_ds.t_trans_fluid_K) annotation (
        Line(points = {{-120, -138}, {-24, -138}, {-24, -16}, {-6, -16}, {-6, -16}}, color = {0, 0, 127}));
      annotation (
        Diagram(coordinateSystem(extent = {{-100, -300}, {100, 280}})),
        __OpenModelica_commandLineOptions = "",
        Icon(coordinateSystem(extent = {{-100, -320}, {100, 320}}), graphics={  Rectangle(origin = {0, -10}, extent = {{-100, 330}, {100, -310}}), Text(origin = {0, -348}, lineColor = {0, 0, 255}, extent = {{-140, 26}, {140, -26}}, textString = "%name")}));
    end TransMission;

    model TransmissionGear
      parameter Real Oil_Viscosity_Breakpoint[:];
      constant Real BRG_DummyLoad = 0;
      Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_TC_Nm annotation (
        Placement(visible = true, transformation(origin = {-2360, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_TM_PNT_AT_Gear_radps annotation (
        Placement(visible = true, transformation(origin = {2360, 20}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 80}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput tau_clutch_cap[6] annotation (
        Placement(visible = true, transformation(origin = {-2360, 190}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 220}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput ratio_AT annotation (
        Placement(visible = true, transformation(origin = {-2360, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
        Placement(visible = true, transformation(origin = {-2360, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_TC_radps annotation (
        Placement(visible = true, transformation(origin = {-2350, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_AT_GEAR_Nm annotation (
        Placement(visible = true, transformation(origin = {2350, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Nu_oil_m2ps annotation (
        Placement(visible = true, transformation(origin = {-2360, -240}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -240}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_GB_PNT_W annotation (
        Placement(visible = true, transformation(origin = {2350, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1(use_a = false, use_w = true) annotation (
        Placement(visible = true, transformation(origin = {-2258, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor2(use_a = false, use_w = false) annotation (
        Placement(visible = true, transformation(origin = {2258, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_Carrier_P1(J = 0.002) annotation (
        Placement(visible = true, transformation(origin = {-1210, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_SunGear_P1(J = 0.0001, phi(displayUnit = "rad", fixed = true, start = 0), w(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {-1490, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_RingGear_P1(J = 0.002, w(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {-1050, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_PlanetGear_P1(J = 0.0001) annotation (
        Placement(visible = true, transformation(origin = {-1210, 332}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_SunGear_P2(J = 0.0001) annotation (
        Placement(visible = true, transformation(origin = {-250, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_RingGear_P2(J = 0.002, phi(displayUnit = "rad", fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {-690, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_PlanetGear_P2(J = 0.0001) annotation (
        Placement(visible = true, transformation(origin = {-530, 392}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_Carrier_P2(J = 0.002, phi(displayUnit = "rad", fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {-530, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_SunGear_P3(J = 0.0001, w(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {810, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_Carrier_P3(J = 0.002) annotation (
        Placement(visible = true, transformation(origin = {530, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_PlanetGear_P3(J = 0.0001) annotation (
        Placement(visible = true, transformation(origin = {530, 392}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_RingGear_P3(J = 0.002) annotation (
        Placement(visible = true, transformation(origin = {370, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_PlanetGear_P4(J = 0.0001) annotation (
        Placement(visible = true, transformation(origin = {1270, 392}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_RingGear_P4(J = 0.002) annotation (
        Placement(visible = true, transformation(origin = {1430, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_Carrier_P4(J = 0.002) annotation (
        Placement(visible = true, transformation(origin = {1270, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_SunGear_P4(J = 0.0001) annotation (
        Placement(visible = true, transformation(origin = {990, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain3(k = -1) annotation (
        Placement(visible = true, transformation(origin = {-2310, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain4(k = -1) annotation (
        Placement(visible = true, transformation(origin = {2310, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator2(k = 1, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {2310, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
        Placement(visible = true, transformation(origin = {20, 596}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch ClutchC2 annotation (
        Placement(visible = true, transformation(origin = {-910, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch BrakeB2 annotation (
        Placement(visible = true, transformation(origin = {-50, 570}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch BrakeB3 annotation (
        Placement(visible = true, transformation(origin = {160, 570}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed3 annotation (
        Placement(visible = true, transformation(origin = {-1400, 596}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch ClutchC1 annotation (
        Placement(visible = true, transformation(origin = {-1640, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch BrakeB1 annotation (
        Placement(visible = true, transformation(origin = {-1470, 570}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch ClutchC3 annotation (
        Placement(visible = true, transformation(origin = {1690, 450}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR1(SealRing_friction_filename = "SR1_1.txt") annotation (
        Placement(visible = true, transformation(origin = {-2110, 9.99201e-16}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR2(SealRing_friction_filename = "SR1_2.txt") annotation (
        Placement(visible = true, transformation(origin = {-2080, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR3(SealRing_friction_filename = "SR1_3.txt") annotation (
        Placement(visible = true, transformation(origin = {-2050, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR4(SealRing_friction_filename = "SR1_4.txt") annotation (
        Placement(visible = true, transformation(origin = {-2020, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR5(SealRing_friction_filename = "SR1_5.txt") annotation (
        Placement(visible = true, transformation(origin = {-1990, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR6(SealRing_friction_filename = "SR2_1.txt") annotation (
        Placement(visible = true, transformation(origin = {-1220, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR7(SealRing_friction_filename = "SR2_2.txt") annotation (
        Placement(visible = true, transformation(origin = {-1190, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR8(SealRing_friction_filename = "SR2_3.txt") annotation (
        Placement(visible = true, transformation(origin = {-1160, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR9(SealRing_friction_filename = "SR2_4.txt") annotation (
        Placement(visible = true, transformation(origin = {-1130, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR10(SealRing_friction_filename = "SR3_1.txt") annotation (
        Placement(visible = true, transformation(origin = {2010, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR11(SealRing_friction_filename = "SR3_2.txt") annotation (
        Placement(visible = true, transformation(origin = {2040, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR12(SealRing_friction_filename = "SR4_1.txt") annotation (
        Placement(visible = true, transformation(origin = {-1800, 370}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR13(SealRing_friction_filename = "SR4_2.txt") annotation (
        Placement(visible = true, transformation(origin = {-1770, 370}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN1(BRG_Friction_Filename = "SN1.txt") annotation (
        Placement(visible = true, transformation(origin = {-1870, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN2(BRG_Friction_Filename = "SN2.txt") annotation (
        Placement(visible = true, transformation(origin = {-1640, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN3(BRG_Friction_Filename = "SN3.txt") annotation (
        Placement(visible = true, transformation(origin = {-910, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN5(BRG_Friction_Filename = "SN5.txt") annotation (
        Placement(visible = true, transformation(origin = {-770, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN6(BRG_Friction_Filename = "SN6.txt") annotation (
        Placement(visible = true, transformation(origin = {-150, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN7(BRG_Friction_Filename = "SN7.txt") annotation (
        Placement(visible = true, transformation(origin = {60, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN8(BRG_Friction_Filename = "SN8.txt") annotation (
        Placement(visible = true, transformation(origin = {270, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN9(BRG_Friction_Filename = "SN9.txt") annotation (
        Placement(visible = true, transformation(origin = {910, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN10(BRG_Friction_Filename = "SN10.txt") annotation (
        Placement(visible = true, transformation(origin = {1550, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN11(BRG_Friction_Filename = "SN11.txt") annotation (
        Placement(visible = true, transformation(origin = {1690, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N1(BRG_Friction_Filename = "N1.txt") annotation (
        Placement(visible = true, transformation(origin = {-1870, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N2(BRG_Friction_Filename = "N2.txt") annotation (
        Placement(visible = true, transformation(origin = {-1570, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N3(BRG_Friction_Filename = "N3.txt") annotation (
        Placement(visible = true, transformation(origin = {-980, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N4(BRG_Friction_Filename = "N4.txt") annotation (
        Placement(visible = true, transformation(origin = {-660, 120}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N5(BRG_Friction_Filename = "N5.txt") annotation (
        Placement(visible = true, transformation(origin = {-500, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N6(BRG_Friction_Filename = "N6.txt") annotation (
        Placement(visible = true, transformation(origin = {-570, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N7(BRG_Friction_Filename = "N7.txt") annotation (
        Placement(visible = true, transformation(origin = {510, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N8(BRG_Friction_Filename = "N8.txt") annotation (
        Placement(visible = true, transformation(origin = {370, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N9(BRG_Friction_Filename = "N9.txt") annotation (
        Placement(visible = true, transformation(origin = {1830, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N10(BRG_Friction_Filename = "N10.txt") annotation (
        Placement(visible = true, transformation(origin = {1940, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N12_15(BRG_Friction_Filename = "N12_15.txt") annotation (
        Placement(visible = true, transformation(origin = {-1290, 190}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N16_19(BRG_Friction_Filename = "N16_19.txt") annotation (
        Placement(visible = true, transformation(origin = {-450, 250}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N20_23(BRG_Friction_Filename = "N20_23.txt") annotation (
        Placement(visible = true, transformation(origin = {610, 250}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N24_27(BRG_Friction_Filename = "N24_27.txt") annotation (
        Placement(visible = true, transformation(origin = {1190, 250}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_Angular BB1(BRG_Friction_Filename = "BB1.txt") annotation (
        Placement(visible = true, transformation(origin = {2150, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed4 annotation (
        Placement(visible = true, transformation(origin = {-1870, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed6 annotation (
        Placement(visible = true, transformation(origin = {-1936, 240}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Sources.RealExpression realExpression2(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-1910, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant constant1(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {-1910, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression3(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-1910, 220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression4(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-1680, 220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant constant2(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {-1610, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression5(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-1610, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const3(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {-1020, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression7(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-1020, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression8(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-950, 220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression9(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-810, 220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const5(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {-610, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression10(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-610, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression11(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-540, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const6(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {-540, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const7(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {-700, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression12(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-700, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression13(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-190, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression14(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {20, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression15(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {230, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed7 annotation (
        Placement(visible = true, transformation(origin = {230, 596}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const11(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {470, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression16(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {470, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression17(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {326, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const12(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {330, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression18(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {870, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression19(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {1510, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression20(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {1650, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression21(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {1790, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const16(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {1790, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression22(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {1900, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const17(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {1900, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const18(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {2110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression23(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {2110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed8 annotation (
        Placement(visible = true, transformation(origin = {1940, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal OS1(OilSeal_friction_filename = "OS1.txt") annotation (
        Placement(visible = true, transformation(origin = {2210, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed9 annotation (
        Placement(visible = true, transformation(origin = {2040, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed10 annotation (
        Placement(visible = true, transformation(origin = {2150, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed11 annotation (
        Placement(visible = true, transformation(origin = {2210, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed12 annotation (
        Placement(visible = true, transformation(origin = {-840, 596}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Blocks.Sources.RealExpression realExpression25(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-930, 570}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression26(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {1790, 370}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed13 annotation (
        Placement(visible = true, transformation(origin = {1876, 350}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Blocks.Sources.RealExpression realExpression31(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-950, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression32(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-1510, 540}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D stirring2D(Stirring_Resistance_Filename = "Stirr1.txt") annotation (
        Placement(visible = true, transformation(origin = {-890, 550}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D stirring2D1(Stirring_Resistance_Filename = "Stirr2.txt") annotation (
        Placement(visible = true, transformation(origin = {1830, 350}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring3D stirring3D_C1(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, Stirring_Resistance_Filename = "C1.txt") annotation (
        Placement(visible = true, transformation(origin = {-1640, 340}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring3D stirring3D_C2(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, Stirring_Resistance_Filename = "C2.txt") annotation (
        Placement(visible = true, transformation(origin = {-910, 340}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring3D stirring3D_C3(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, Stirring_Resistance_Filename = "C3.txt") annotation (
        Placement(visible = true, transformation(origin = {1690, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D_Brake stirring2D_B1(Stirring_Resistance_Filename = "B1.txt") annotation (
        Placement(visible = true, transformation(origin = {-1470, 520}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D_Brake stirring2D_B2(Stirring_Resistance_Filename = "B2.txt") annotation (
        Placement(visible = true, transformation(origin = {-50, 520}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D_Brake stirring2D_B3(Stirring_Resistance_Filename = "B3.txt") annotation (
        Placement(visible = true, transformation(origin = {160, 520}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression33(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-1680, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression34(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-90, 540}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression35(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {120, 540}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression36(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {1650, 420}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Routing.DeMultiplex6 tau_clutch_cap1 annotation (
        Placement(visible = true, transformation(origin = {-2310, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression37(y = tau_clutch_cap1.y1[1]) annotation (
        Placement(visible = true, transformation(origin = {-90, 590}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression38(y = tau_clutch_cap1.y2[1]) annotation (
        Placement(visible = true, transformation(origin = {120, 590}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression39(y = tau_clutch_cap1.y3[1]) annotation (
        Placement(visible = true, transformation(origin = {-1510, 590}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression40(y = tau_clutch_cap1.y4[1]) annotation (
        Placement(visible = true, transformation(origin = {1650, 470}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression41(y = tau_clutch_cap1.y5[1]) annotation (
        Placement(visible = true, transformation(origin = {-950, 430}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression42(y = tau_clutch_cap1.y6[1]) annotation (
        Placement(visible = true, transformation(origin = {-1680, 420}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetPlanet Planet_Planet_P1(Gear_Friction_Filename = "PS1s.txt", Gear_K_Filename = "PS1sK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = -26 / 46, tanhCoeff = 100) annotation (
        Placement(visible = true, transformation(origin = {-1420, 200}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetRing Planet_Ring_P1(Gear_Friction_Filename = "PS1r.txt", Gear_K_Filename = "PS1rK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = 98 / 26, tanhCoeff = 100) annotation (
        Placement(visible = true, transformation(origin = {-1140, 320}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetPlanet Planet_Planet_P2(Gear_Friction_Filename = "PS2s.txt", Gear_K_Filename = "PS2sK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = -27 / 44, tanhCoeff = 100) annotation (
        Placement(visible = true, transformation(origin = {-320, 260}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetRing Planet_Ring_P2(Gear_Friction_Filename = "PS2r.txt", Gear_K_Filename = "PS2rK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = 100 / 27, tanhCoeff = 100) annotation (
        Placement(visible = true, transformation(origin = {-600, 380}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetPlanet Planet_Planet_P3(Gear_Friction_Filename = "PS3s.txt", Gear_K_Filename = "PS3sK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = -23 / 37, tanhCoeff = 100) annotation (
        Placement(visible = true, transformation(origin = {740, 260}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetRing Planet_Ring_P3(Gear_Friction_Filename = "PS3r.txt", Gear_K_Filename = "PS3rK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = 83 / 23, tanhCoeff = 100) annotation (
        Placement(visible = true, transformation(origin = {460, 380}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetPlanet Planet_Planet_P4(Gear_Friction_Filename = "PS4s.txt", Gear_K_Filename = "PS4sK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = -26 / 34, tanhCoeff = 100) annotation (
        Placement(visible = true, transformation(origin = {1060, 260}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetRing Planet_Ring_P4(Gear_Friction_Filename = "PS4r.txt", Gear_K_Filename = "PS4rK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = 86 / 26, tanhCoeff = 100) annotation (
        Placement(visible = true, transformation(origin = {1340, 380}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression43(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-590, 330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression44(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {470, 330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression45(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {1330, 330}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression46(y = Nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-1150, 270}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_Brg(nu = 25) annotation (
        Placement(visible = true, transformation(origin = {2250, -290}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_Stirring(nu = 8) annotation (
        Placement(visible = true, transformation(origin = {2250, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_ClutchLoss(nu = 6) annotation (
        Placement(visible = true, transformation(origin = {2250, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_GearLoss(nu = 8) annotation (
        Placement(visible = true, transformation(origin = {2250, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_SealRing(nu = 13) annotation (
        Placement(visible = true, transformation(origin = {2250, -330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum multiSum(nu = 6) annotation (
        Placement(visible = true, transformation(origin = {2310, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.BrgLoadDistribution_TM brgLoadDistribution_TM annotation (
        Placement(visible = true, transformation(origin = {-1723.66, 796.75}, extent = {{36.7778, -82.75}, {-36.7778, 82.75}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor3 annotation (
        Placement(visible = true, transformation(origin = {680, 250}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor4 annotation (
        Placement(visible = true, transformation(origin = {1120, 250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor2 annotation (
        Placement(visible = true, transformation(origin = {-380, 250}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation (
        Placement(visible = true, transformation(origin = {-1360, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain trq2force1(k = 1000 / 44.925) annotation (
        Placement(visible = true, transformation(origin = {-1330, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain trq2force2(k = 1000 / 47.43) annotation (
        Placement(visible = true, transformation(origin = {-410, 200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain trq2force3(k = 1000 / 45.2) annotation (
        Placement(visible = true, transformation(origin = {650, 200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain trq2force4(k = 1000 / 43.395) annotation (
        Placement(visible = true, transformation(origin = {1150, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = 0) annotation (
        Placement(visible = true, transformation(origin = {650, 230}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const1(k = 0) annotation (
        Placement(visible = true, transformation(origin = {1150, 230}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const13(k = 0) annotation (
        Placement(visible = true, transformation(origin = {-410, 230}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const4(k = 0) annotation (
        Placement(visible = true, transformation(origin = {-1330, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Discrete.UnitDelay unitDelay1(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-1368, 160}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
      Modelica.Blocks.Discrete.UnitDelay unitDelay2(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-372, 220}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
      Modelica.Blocks.Discrete.UnitDelay unitDelay3(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {688, 220}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
      Modelica.Blocks.Discrete.UnitDelay unitDelay4(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {1112, 220}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
        Placement(visible = true, transformation(origin = {2010, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed2 annotation (
        Placement(visible = true, transformation(origin = {-2110, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed5 annotation (
        Placement(visible = true, transformation(origin = {-2080, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed14 annotation (
        Placement(visible = true, transformation(origin = {-2050, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed15 annotation (
        Placement(visible = true, transformation(origin = {-2020, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed16 annotation (
        Placement(visible = true, transformation(origin = {-1990, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.HydraulicSystem hydraulicSystem(TPMAP_CL1_Filename = "TPMAP_CL1.txt", TPMAP_CL2_Filename = "TPMAP_CL2.txt", TPMAP_CL3_Filename = "TPMAP_CL3.txt", TPMAP_LC_Filename = "TPMAP_LC.txt") annotation (
        Placement(visible = true, transformation(origin = {-2254, 100}, extent = {{-14, -40}, {14, 60}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.SealRingPrsDistribution sealRingPrsDistribution annotation (
        Placement(visible = true, transformation(origin = {-2194, 100}, extent = {{-14, -40}, {14, 40}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput tau_lockup_cap annotation (
        Placement(visible = true, transformation(origin = {-2360, 130}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 150}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression(y = tau_clutch_cap1.y6[1]) annotation (
        Placement(visible = true, transformation(origin = {-2310, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression1(y = tau_clutch_cap1.y5[1]) annotation (
        Placement(visible = true, transformation(origin = {-2310, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression6(y = tau_clutch_cap1.y4[1]) annotation (
        Placement(visible = true, transformation(origin = {-2310, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression24(y = p_line_Pa) annotation (
        Placement(visible = true, transformation(origin = {-2310, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed17 annotation (
        Placement(visible = true, transformation(origin = {-1800, 416}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed18 annotation (
        Placement(visible = true, transformation(origin = {-1770, 416}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    equation
      connect(gain3.y, torqueToAngleAdaptor1.tau) annotation (
        Line(points = {{-2299, -20}, {-2280, -20}, {-2280, -8}, {-2261, -8}}, color = {0, 0, 127}));
      connect(trq_TM_PNT_TC_Nm, gain3.u) annotation (
        Line(points = {{-2360, -20}, {-2322, -20}}, color = {0, 0, 127}));
      connect(w_TM_PNT_TC_radps, torqueToAngleAdaptor1.w) annotation (
        Line(points = {{-2350, 20}, {-2280, 20}, {-2280, 6}, {-2261, 6}, {-2261, 5}}, color = {0, 0, 127}));
      connect(fixed6.flange, SN1.flange_a) annotation (
        Line(points = {{-1936, 240}, {-1881, 240}}));
      connect(SN5.flange_a, ClutchC2.flange_b) annotation (
        Line(points = {{-781, 240}, {-840, 240}, {-840, 400}, {-900, 400}}));
      connect(ClutchC2.flange_b, inertia_RingGear_P2.flange_a) annotation (
        Line(points = {{-900, 400}, {-700, 400}}));
      connect(N1.flange_b, SN2.flange_a) annotation (
        Line(points = {{-1860, 0}, {-1840, 0}, {-1840, 240}, {-1651, 240}}));
      connect(N1.flange_b, N2.flange_a) annotation (
        Line(points = {{-1860, 0}, {-1580, 0}}));
      connect(N2.flange_b, inertia_SunGear_P1.flange_a) annotation (
        Line(points = {{-1560, 0}, {-1520, 0}, {-1520, 150}, {-1500, 150}}));
      connect(SR9.flange_b, N3.flange_a) annotation (
        Line(points = {{-1120, 0}, {-990, 0}}));
      connect(inertia_Carrier_P1.flange_b, N3.support) annotation (
        Line(points = {{-1200, 240}, {-980, 240}, {-980, 10}}));
      connect(inertia_Carrier_P1.flange_b, SR9.support) annotation (
        Line(points = {{-1200, 240}, {-980, 240}, {-980, 60}, {-1130, 60}, {-1130, 10}}));
      connect(realExpression9.y, SN5.nu_oil_m2ps) annotation (
        Line(points = {{-799, 220}, {-790, 220}, {-790, 234}, {-782, 234}}, color = {0, 255, 0}));
      connect(inertia_Carrier_P1.flange_b, ClutchC2.flange_a) annotation (
        Line(points = {{-1200, 240}, {-980, 240}, {-980, 400}, {-920, 400}}));
      connect(inertia_Carrier_P1.flange_b, SN3.flange_a) annotation (
        Line(points = {{-1200, 240}, {-921, 240}}));
      connect(N3.flange_b, N6.flange_a) annotation (
        Line(points = {{-970, 0}, {-580, 0}}));
      connect(ClutchC2.flange_b, N5.flange_a) annotation (
        Line(points = {{-900, 400}, {-840, 400}, {-840, 60}, {-510, 60}}));
      connect(ClutchC2.flange_b, N6.support) annotation (
        Line(points = {{-900, 400}, {-840, 400}, {-840, 60}, {-570, 60}, {-570, 10}}));
      connect(const7.y, N4.Fr) annotation (
        Line(points = {{-689, 90}, {-662, 90}, {-662, 108}}, color = {0, 255, 0}));
      connect(const7.y, N4.Fth) annotation (
        Line(points = {{-689, 90}, {-680, 90}, {-680, 112}, {-672, 112}}, color = {0, 255, 0}));
      connect(ClutchC2.flange_b, SN3.flange_b) annotation (
        Line(points = {{-900, 400}, {-840, 400}, {-840, 240}, {-900, 240}}));
      connect(SN6.flange_b, inertia_SunGear_P2.flange_b) annotation (
        Line(points = {{-140, 300}, {-120, 300}, {-120, 200}, {-240, 200}}));
      connect(N4.flange_b, inertia_SunGear_P2.flange_b) annotation (
        Line(points = {{-650, 120}, {-120, 120}, {-120, 200}, {-240, 200}}));
      connect(N5.support, inertia_SunGear_P2.flange_b) annotation (
        Line(points = {{-500, 70}, {-500, 120}, {-120, 120}, {-120, 200}, {-240, 200}}));
      connect(SN7.flange_b, inertia_RingGear_P3.flange_a) annotation (
        Line(points = {{70, 300}, {90, 300}, {90, 400}, {360, 400}}));
      connect(SN7.flange_b, SN8.flange_a) annotation (
        Line(points = {{70, 300}, {259, 300}}));
      connect(inertia_SunGear_P2.flange_b, SN7.flange_a) annotation (
        Line(points = {{-240, 200}, {-120, 200}, {-120, 300}, {49, 300}}));
      connect(SN8.flange_b, inertia_Carrier_P3.flange_a) annotation (
        Line(points = {{280, 300}, {520, 300}}));
      connect(N8.support, N7.flange_a) annotation (
        Line(points = {{370, 10}, {370, 60}, {500, 60}}));
      connect(N6.flange_b, N8.flange_a) annotation (
        Line(points = {{-560, 0}, {360, 0}}));
      connect(realExpression16.y, N7.nu_oil_m2ps) annotation (
        Line(points = {{481, 80}, {490, 80}, {490, 66}, {498, 66}}, color = {0, 255, 0}));
      connect(N7.flange_b, inertia_SunGear_P3.flange_b) annotation (
        Line(points = {{520, 60}, {860, 60}, {860, 200}, {820, 200}}));
      connect(N7.flange_b, inertia_SunGear_P4.flange_a) annotation (
        Line(points = {{520, 60}, {860, 60}, {860, 200}, {980, 200}}));
      connect(realExpression18.y, SN9.nu_oil_m2ps) annotation (
        Line(points = {{881, 280}, {890, 280}, {890, 294}, {898, 294}}, color = {0, 255, 0}));
      connect(N8.flange_b, inertia_Carrier_P4.flange_b) annotation (
        Line(points = {{380, 0}, {1480, 0}, {1480, 300}, {1280, 300}}));
      connect(SN10.flange_b, SN11.flange_a) annotation (
        Line(points = {{1560, 300}, {1679, 300}}));
      connect(realExpression19.y, SN10.nu_oil_m2ps) annotation (
        Line(points = {{1521, 280}, {1529.5, 280}, {1529.5, 294}, {1538, 294}}, color = {0, 255, 0}));
      connect(realExpression20.y, SN11.nu_oil_m2ps) annotation (
        Line(points = {{1661, 280}, {1671.5, 280}, {1671.5, 294}, {1678, 294}}, color = {0, 255, 0}));
      connect(N7.flange_a, N5.flange_b) annotation (
        Line(points = {{500, 60}, {-490, 60}}));
      connect(inertia_RingGear_P4.flange_b, SN10.flange_b) annotation (
        Line(points = {{1440, 400}, {1620, 400}, {1620, 300}, {1560, 300}}));
      connect(N1.flange_b, SN1.flange_b) annotation (
        Line(points = {{-1860, 0}, {-1840, 0}, {-1840, 240}, {-1860, 240}}));
      connect(inertia_Carrier_P4.flange_b, SN10.flange_a) annotation (
        Line(points = {{1280, 300}, {1539, 300}}));
      connect(N8.flange_b, N9.flange_a) annotation (
        Line(points = {{380, 0}, {1820, 0}}));
      connect(fixed8.flange, N10.support) annotation (
        Line(points = {{1940, 56}, {1940, 10}}));
      connect(realExpression22.y, N10.nu_oil_m2ps) annotation (
        Line(points = {{1911, 20}, {1920, 20}, {1920, 6}, {1928, 6}}, color = {0, 255, 0}));
      connect(const17.y, N10.Fth) annotation (
        Line(points = {{1911, -30}, {1920, -30}, {1920, -8}, {1928, -8}}, color = {0, 255, 0}));
      connect(const17.y, N10.Fr) annotation (
        Line(points = {{1911, -30}, {1938, -30}, {1938, -12}}, color = {0, 255, 0}));
      connect(realExpression23.y, BB1.nu_oil_m2ps) annotation (
        Line(points = {{2121, 20}, {2130, 20}, {2130, 6}, {2138, 6}}, color = {0, 255, 0}));
      connect(BB1.flange_b, OS1.flange_a) annotation (
        Line(points = {{2160, 0}, {2200, 0}}));
      connect(OS1.flange_b, angleToTorqueAdaptor2.flange) annotation (
        Line(points = {{2220, 0}, {2256, 0}}));
      connect(SR11.flange_b, BB1.flange_a) annotation (
        Line(points = {{2050, 0}, {2140, 0}}));
      connect(SR11.support, fixed9.flange) annotation (
        Line(points = {{2040, 10}, {2040, 56}}));
      connect(BB1.support, fixed10.flange) annotation (
        Line(points = {{2150, 10}, {2150, 56}}));
      connect(OS1.support, fixed11.flange) annotation (
        Line(points = {{2210, 10}, {2210, 56}}));
      connect(inertia_RingGear_P1.flange_b, stirring2D.support) annotation (
        Line(points = {{-1040, 360}, {-1000, 360}, {-1000, 500}, {-940, 500}, {-940, 550}, {-900, 550}}));
      connect(realExpression26.y, stirring2D1.nu_oil_m2ps) annotation (
        Line(points = {{1801, 370}, {1809.5, 370}, {1809.5, 358}, {1818, 358}}, color = {0, 255, 0}));
      connect(stirring2D1.flange_b, fixed13.flange) annotation (
        Line(points = {{1840, 350}, {1876, 350}}));
      connect(ClutchC1.flange_b, SN2.flange_b) annotation (
        Line(points = {{-1630, 400}, {-1570, 400}, {-1570, 240}, {-1630, 240}}));
      connect(ClutchC1.flange_b, N2.support) annotation (
        Line(points = {{-1630, 400}, {-1570, 400}, {-1570, 10}}));
      connect(inertia_Carrier_P1.flange_b, stirring3D_C2.flange_a) annotation (
        Line(points = {{-1200, 240}, {-980, 240}, {-980, 340}, {-920, 340}}));
      connect(stirring3D_C2.flange_b, inertia_RingGear_P2.flange_a) annotation (
        Line(points = {{-900, 340}, {-840, 340}, {-840, 400}, {-700, 400}}));
      connect(inertia_RingGear_P4.flange_b, stirring3D_C3.flange_a) annotation (
        Line(points = {{1440, 400}, {1680, 400}}));
      connect(stirring3D_C3.flange_b, N10.flange_a) annotation (
        Line(points = {{1700, 400}, {1760, 400}, {1760, 60}, {1860, 60}, {1860, 0}, {1930, 0}}));
      connect(realExpression40.y, ClutchC3.tau_clutch_cap) annotation (
        Line(points = {{1661, 470}, {1690, 470}, {1690, 462}}, color = {0, 0, 127}));
      connect(realExpression41.y, ClutchC2.tau_clutch_cap) annotation (
        Line(points = {{-939, 430}, {-910, 430}, {-910, 412}}, color = {0, 0, 127}));
      connect(realExpression42.y, ClutchC1.tau_clutch_cap) annotation (
        Line(points = {{-1669, 420}, {-1640, 420}, {-1640, 412}}, color = {0, 0, 127}));
      connect(tau_clutch_cap, tau_clutch_cap1.u) annotation (
        Line(points = {{-2360, 190}, {-2322, 190}}, color = {0, 0, 127}, thickness = 0.5));
      connect(Planet_Ring_P2.ring, inertia_RingGear_P2.flange_b) annotation (
        Line(points = {{-620, 380}, {-660, 380}, {-660, 400}, {-680, 400}}));
      connect(Planet_Ring_P3.ring, inertia_RingGear_P3.flange_b) annotation (
        Line(points = {{440, 380}, {400, 380}, {400, 400}, {380, 400}}));
      connect(inertia_SunGear_P4.flange_b, Planet_Planet_P4.sun) annotation (
        Line(points = {{1000, 200}, {1020, 200}, {1020, 254}, {1040, 254}}));
      connect(Planet_Ring_P4.ring, inertia_RingGear_P4.flange_a) annotation (
        Line(points = {{1360, 380}, {1400, 380}, {1400, 400}, {1420, 400}}));
      connect(inertia_SunGear_P3.flange_a, Planet_Planet_P3.sun) annotation (
        Line(points = {{800, 200}, {780, 200}, {780, 254}, {760, 254}}));
      connect(inertia_PlanetGear_P3.flange_a, Planet_Ring_P3.pinion) annotation (
        Line(points = {{520, 392}, {480, 392}}));
      connect(Planet_Ring_P3.carrier, inertia_Carrier_P3.flange_a) annotation (
        Line(points = {{480, 380}, {500, 380}, {500, 300}, {520, 300}}));
      connect(Planet_Planet_P2.sun, inertia_SunGear_P2.flange_a) annotation (
        Line(points = {{-300, 254}, {-280, 254}, {-280, 200}, {-260, 200}}));
      connect(Planet_Ring_P2.carrier, inertia_Carrier_P2.flange_a) annotation (
        Line(points = {{-580, 380}, {-560, 380}, {-560, 300}, {-540, 300}}));
      connect(Planet_Ring_P2.pinion, inertia_PlanetGear_P2.flange_a) annotation (
        Line(points = {{-580, 392}, {-540, 392}}));
      connect(inertia_PlanetGear_P4.flange_b, Planet_Ring_P4.pinion) annotation (
        Line(points = {{1280, 392}, {1320, 392}}));
      connect(Planet_Ring_P4.carrier, inertia_Carrier_P4.flange_b) annotation (
        Line(points = {{1320, 380}, {1300, 380}, {1300, 300}, {1280, 300}}));
      connect(realExpression45.y, Planet_Ring_P4.nu_oil_m2ps) annotation (
        Line(points = {{1319, 330}, {1310, 330}, {1310, 368}, {1316, 368}}, color = {0, 255, 0}));
      connect(Planet_Ring_P1.pinion, inertia_PlanetGear_P1.flange_b) annotation (
        Line(points = {{-1160, 332}, {-1200, 332}}));
      connect(Planet_Ring_P1.carrier, inertia_Carrier_P1.flange_b) annotation (
        Line(points = {{-1160, 320}, {-1180, 320}, {-1180, 240}, {-1200, 240}}));
      connect(realExpression46.y, Planet_Ring_P1.nu_oil_m2ps) annotation (
        Line(points = {{-1161, 270}, {-1170.5, 270}, {-1170.5, 308}, {-1164, 308}}, color = {0, 255, 0}));
      connect(integrator2.u, w_TM_PNT_AT_Gear_radps) annotation (
        Line(points = {{2322, 20}, {2360, 20}}, color = {0, 0, 127}));
      connect(gain4.y, trq_TM_PNT_AT_GEAR_Nm) annotation (
        Line(points = {{2321, -20}, {2350, -20}}, color = {0, 0, 127}));
      connect(integrator2.y, angleToTorqueAdaptor2.phi) annotation (
        Line(points = {{2299, 20}, {2280, 20}, {2280, 8}, {2261, 8}}, color = {0, 0, 127}));
      connect(angleToTorqueAdaptor2.tau, gain4.u) annotation (
        Line(points = {{2261, -8}, {2280, -8}, {2280, -20}, {2298, -20}}, color = {0, 0, 127}));
      connect(const18.y, BB1.Fr) annotation (
        Line(points = {{2121, -30}, {2148, -30}, {2148, -12}}, color = {0, 255, 0}));
      connect(realExpression14.y, SN7.nu_oil_m2ps) annotation (
        Line(points = {{31, 280}, {40, 280}, {40, 294}, {48, 294}}, color = {0, 255, 0}));
      connect(inertia_Carrier_P3.flange_a, N7.support) annotation (
        Line(points = {{520, 300}, {320, 300}, {320, 120}, {510, 120}, {510, 70}}));
      connect(realExpression15.y, SN8.nu_oil_m2ps) annotation (
        Line(points = {{241, 280}, {250, 280}, {250, 294}, {258, 294}}, color = {0, 255, 0}));
      connect(const11.y, N7.Fth) annotation (
        Line(points = {{481, 30}, {490, 30}, {490, 52}, {498, 52}}, color = {0, 255, 0}));
      connect(realExpression17.y, N8.nu_oil_m2ps) annotation (
        Line(points = {{337, 20}, {350, 20}, {350, 6}, {358, 6}}, color = {0, 255, 0}));
      connect(const11.y, N7.Fr) annotation (
        Line(points = {{481, 30}, {508, 30}, {508, 48}}, color = {0, 255, 0}));
      connect(const12.y, N8.Fth) annotation (
        Line(points = {{341, -30}, {350, -30}, {350, -8}, {358, -8}}, color = {0, 255, 0}));
      connect(const12.y, N8.Fr) annotation (
        Line(points = {{341, -30}, {368, -30}, {368, -12}}, color = {0, 255, 0}));
      connect(realExpression44.y, Planet_Ring_P3.nu_oil_m2ps) annotation (
        Line(points = {{481, 330}, {490, 330}, {490, 368}, {484, 368}}, color = {0, 255, 0}));
      connect(realExpression44.y, Planet_Planet_P3.nu_oil_m2ps) annotation (
        Line(points = {{481, 330}, {780, 330}, {780, 272}, {764, 272}}, color = {0, 255, 0}));
      connect(realExpression45.y, Planet_Planet_P4.nu_oil_m2ps) annotation (
        Line(points = {{1319, 330}, {1020, 330}, {1020, 272}, {1036, 272}}, color = {0, 255, 0}));
      connect(ClutchC3.flange_a, inertia_RingGear_P4.flange_b) annotation (
        Line(points = {{1680, 450}, {1620, 450}, {1620, 400}, {1440, 400}}));
      connect(realExpression36.y, stirring3D_C3.nu_oil_m2ps) annotation (
        Line(points = {{1661, 420}, {1670, 420}, {1670, 408}, {1678, 408}}, color = {0, 255, 0}));
      connect(const16.y, N9.Fr) annotation (
        Line(points = {{1801, -30}, {1828, -30}, {1828, -12}}, color = {0, 255, 0}));
      connect(N9.Fth, const16.y) annotation (
        Line(points = {{1818, -8}, {1810, -8}, {1810, -30}, {1801, -30}}, color = {0, 255, 0}));
      connect(realExpression21.y, N9.nu_oil_m2ps) annotation (
        Line(points = {{1801, 20}, {1810, 20}, {1810, 6}, {1818, 6}}, color = {0, 255, 0}));
      connect(realExpression43.y, Planet_Ring_P2.nu_oil_m2ps) annotation (
        Line(points = {{-579, 330}, {-570, 330}, {-570, 368}, {-576, 368}}, color = {0, 255, 0}));
      connect(inertia_Carrier_P2.flange_a, N4.support) annotation (
        Line(points = {{-540, 300}, {-740, 300}, {-740, 160}, {-660, 160}, {-660, 130}}));
      connect(realExpression43.y, Planet_Planet_P2.nu_oil_m2ps) annotation (
        Line(points = {{-579, 330}, {-280, 330}, {-280, 272}, {-296, 272}}, color = {0, 255, 0}));
      connect(realExpression13.y, SN6.nu_oil_m2ps) annotation (
        Line(points = {{-179, 280}, {-170, 280}, {-170, 294}, {-162, 294}}, color = {0, 255, 0}));
      connect(realExpression11.y, N5.nu_oil_m2ps) annotation (
        Line(points = {{-529, 80}, {-520, 80}, {-520, 66}, {-512, 66}}, color = {0, 255, 0}));
      connect(const6.y, N5.Fr) annotation (
        Line(points = {{-529, 30}, {-502, 30}, {-502, 48}}, color = {0, 255, 0}));
      connect(N5.Fth, const6.y) annotation (
        Line(points = {{-512, 52}, {-520, 52}, {-520, 30}, {-529, 30}}, color = {0, 255, 0}));
      connect(const5.y, N6.Fr) annotation (
        Line(points = {{-599, -30}, {-572, -30}, {-572, -12}}, color = {0, 255, 0}));
      connect(realExpression10.y, N6.nu_oil_m2ps) annotation (
        Line(points = {{-599, 20}, {-590, 20}, {-590, 6}, {-582, 6}}, color = {0, 255, 0}));
      connect(N6.Fth, const5.y) annotation (
        Line(points = {{-582, -8}, {-590, -8}, {-590, -30}, {-599, -30}}, color = {0, 255, 0}));
      connect(realExpression12.y, N4.nu_oil_m2ps) annotation (
        Line(points = {{-689, 140}, {-680, 140}, {-680, 126}, {-672, 126}}, color = {0, 255, 0}));
      connect(SN5.flange_b, N4.support) annotation (
        Line(points = {{-760, 240}, {-740, 240}, {-740, 160}, {-660, 160}, {-660, 130}}));
      connect(realExpression7.y, N3.nu_oil_m2ps) annotation (
        Line(points = {{-1009, 20}, {-1000, 20}, {-1000, 6}, {-992, 6}}, color = {0, 255, 0}));
      connect(realExpression31.y, stirring3D_C2.nu_oil_m2ps) annotation (
        Line(points = {{-939, 360}, {-930, 360}, {-930, 348}, {-922, 348}}, color = {0, 255, 0}));
      connect(realExpression8.y, SN3.nu_oil_m2ps) annotation (
        Line(points = {{-939, 220}, {-930, 220}, {-930, 234}, {-922, 234}}, color = {0, 255, 0}));
      connect(const3.y, N3.Fr) annotation (
        Line(points = {{-1009, -30}, {-982, -30}, {-982, -12}}, color = {0, 255, 0}));
      connect(N3.Fth, const3.y) annotation (
        Line(points = {{-992, -8}, {-1000, -8}, {-1000, -30}, {-1009, -30}}, color = {0, 255, 0}));
      connect(Planet_Ring_P1.ring, inertia_RingGear_P1.flange_a) annotation (
        Line(points = {{-1120, 320}, {-1080, 320}, {-1080, 360}, {-1060, 360}}));
      connect(Planet_Planet_P1.sun, inertia_SunGear_P1.flange_b) annotation (
        Line(points = {{-1440, 194}, {-1460, 194}, {-1460, 150}, {-1480, 150}}));
      connect(realExpression46.y, Planet_Planet_P1.nu_oil_m2ps) annotation (
        Line(points = {{-1161, 270}, {-1460, 270}, {-1460, 212}, {-1444, 212}}, color = {0, 255, 0}));
      connect(realExpression25.y, stirring2D.nu_oil_m2ps) annotation (
        Line(points = {{-919, 570}, {-910, 570}, {-910, 558}, {-902, 558}}, color = {0, 255, 0}));
      connect(constant2.y, N2.Fr) annotation (
        Line(points = {{-1599, -20}, {-1572, -20}, {-1572, -12}}, color = {0, 255, 0}));
      connect(N2.Fth, constant2.y) annotation (
        Line(points = {{-1582, -8}, {-1590, -8}, {-1590, -20}, {-1599, -20}}, color = {0, 255, 0}));
      connect(realExpression5.y, N2.nu_oil_m2ps) annotation (
        Line(points = {{-1599, 20}, {-1590, 20}, {-1590, 6}, {-1582, 6}}, color = {0, 255, 0}));
      connect(realExpression4.y, SN2.nu_oil_m2ps) annotation (
        Line(points = {{-1669, 220}, {-1660, 220}, {-1660, 234}, {-1652, 234}}, color = {0, 255, 0}));
      connect(realExpression33.y, stirring3D_C1.nu_oil_m2ps) annotation (
        Line(points = {{-1669, 360}, {-1660, 360}, {-1660, 348}, {-1652, 348}}, color = {0, 255, 0}));
      connect(realExpression3.y, SN1.nu_oil_m2ps) annotation (
        Line(points = {{-1899, 220}, {-1890, 220}, {-1890, 234}, {-1882, 234}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN1[2], SN1.Fth) annotation (
        Line(points = {{-1763, 859}, {-1890, 859}, {-1890, 248}, {-1882, 248}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN1[1], SN1.Fr) annotation (
        Line(points = {{-1763, 859}, {-1890, 859}, {-1890, 260}, {-1872, 260}, {-1872, 252}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN2[2], SN2.Fth) annotation (
        Line(points = {{-1763, 845}, {-1880, 845}, {-1880, 612}, {-1700, 612}, {-1700, 248}, {-1652, 248}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN2[1], SN2.Fr) annotation (
        Line(points = {{-1763, 845}, {-1880, 845}, {-1880, 612}, {-1700, 612}, {-1700, 260}, {-1642, 260}, {-1642, 252}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN3[2], SN3.Fth) annotation (
        Line(points = {{-1763, 831}, {-1870, 831}, {-1870, 620}, {-970, 620}, {-970, 248}, {-922, 248}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN3[1], SN3.Fr) annotation (
        Line(points = {{-1763, 831}, {-1870, 831}, {-1870, 620}, {-970, 620}, {-970, 260}, {-912, 260}, {-912, 252}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN5[2], SN5.Fth) annotation (
        Line(points = {{-1763, 817}, {-1860, 817}, {-1860, 630}, {-790, 630}, {-790, 248}, {-782, 248}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN5[1], SN5.Fr) annotation (
        Line(points = {{-1763, 817}, {-1860, 817}, {-1860, 630}, {-790, 630}, {-790, 260}, {-772, 260}, {-772, 252}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN6[2], SN6.Fth) annotation (
        Line(points = {{-1763, 804}, {-1850, 804}, {-1850, 640}, {-170, 640}, {-170, 308}, {-162, 308}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN6[1], SN6.Fr) annotation (
        Line(points = {{-1763, 804}, {-1850, 804}, {-1850, 640}, {-170, 640}, {-170, 320}, {-152, 320}, {-152, 312}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN7[2], SN7.Fth) annotation (
        Line(points = {{-1763, 790}, {-1840, 790}, {-1840, 650}, {40, 650}, {40, 308}, {48, 308}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN7[1], SN7.Fr) annotation (
        Line(points = {{-1763, 790}, {-1840, 790}, {-1840, 650}, {40, 650}, {40, 320}, {58, 320}, {58, 312}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN8[2], SN8.Fth) annotation (
        Line(points = {{-1763, 776}, {-1830, 776}, {-1830, 660}, {250, 660}, {250, 308}, {258, 308}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN8[1], SN8.Fr) annotation (
        Line(points = {{-1763, 776}, {-1830, 776}, {-1830, 660}, {250, 660}, {250, 320}, {268, 320}, {268, 312}}, color = {0, 255, 0}));
      connect(Planet_Planet_P1.PHI_W, Sum_GearLoss.u[1]) annotation (
        Line(points = {{-1398, 183}, {-1398, 185}, {-1390, 185}, {-1390, -170}, {2240, -170}}, color = {170, 0, 0}));
      connect(Planet_Ring_P1.PHI_W, Sum_GearLoss.u[2]) annotation (
        Line(points = {{-1118, 304}, {-1100, 304}, {-1100, -170}, {2240, -170}}, color = {170, 0, 0}));
      connect(Planet_Planet_P2.PHI_W, Sum_GearLoss.u[3]) annotation (
        Line(points = {{-342, 243}, {-350, 243}, {-350, -170}, {2240, -170}}, color = {170, 0, 0}));
      connect(Planet_Ring_P2.PHI_W, Sum_GearLoss.u[4]) annotation (
        Line(points = {{-622, 364}, {-640, 364}, {-640, -170}, {2240, -170}}, color = {170, 0, 0}));
      connect(Planet_Planet_P3.PHI_W, Sum_GearLoss.u[5]) annotation (
        Line(points = {{718, 243}, {710, 243}, {710, -170}, {2240, -170}}, color = {170, 0, 0}));
      connect(Planet_Ring_P3.PHI_W, Sum_GearLoss.u[6]) annotation (
        Line(points = {{438, 364}, {420, 364}, {420, -170}, {2240, -170}}, color = {170, 0, 0}));
      connect(Planet_Planet_P4.PHI_W, Sum_GearLoss.u[7]) annotation (
        Line(points = {{1082, 243}, {1090, 243}, {1090, -170}, {2240, -170}}, color = {170, 0, 0}));
      connect(Planet_Ring_P4.PHI_W, Sum_GearLoss.u[8]) annotation (
        Line(points = {{1362, 364}, {1380, 364}, {1380, -170}, {2240, -170}}, color = {170, 0, 0}));
      connect(ClutchC1.PHI_W, Sum_ClutchLoss.u[1]) annotation (
        Line(points = {{-1629, 390}, {-1550, 390}, {-1550, -250}, {2240, -250}}, color = {170, 0, 0}));
      connect(ClutchC2.PHI_W, Sum_ClutchLoss.u[2]) annotation (
        Line(points = {{-899, 390}, {-890, 390}, {-890, -250}, {2240, -250}}, color = {170, 0, 0}));
      connect(ClutchC3.PHI_W, Sum_ClutchLoss.u[3]) annotation (
        Line(points = {{1701, 440}, {1710, 440}, {1710, -250}, {2240, -250}}, color = {170, 0, 0}));
      connect(stirring3D_C1.PHI_W, Sum_Stirring.u[1]) annotation (
        Line(points = {{-1629, 332}, {-1550, 332}, {-1550, -210}, {2240, -210}}, color = {170, 0, 0}));
      connect(stirring3D_C2.PHI_W, Sum_Stirring.u[2]) annotation (
        Line(points = {{-899, 332}, {-890, 332}, {-890, -210}, {2240, -210}}, color = {170, 0, 0}));
      connect(stirring3D_C3.PHI_W, Sum_Stirring.u[3]) annotation (
        Line(points = {{1701, 392}, {1710, 392}, {1710, -210}, {2240, -210}}, color = {170, 0, 0}));
      connect(stirring2D1.PHI_W, Sum_Stirring.u[4]) annotation (
        Line(points = {{1841, 342}, {1850, 342}, {1850, -210}, {2240, -210}}, color = {170, 0, 0}));
      connect(stirring2D.PHI_W, Sum_Stirring.u[5]) annotation (
        Line(points = {{-879, 542}, {-860, 542}, {-860, -210}, {2240, -210}}, color = {170, 0, 0}));
      connect(SN1.PHI_W, Sum_Brg.u[1]) annotation (
        Line(points = {{-1859, 232}, {-1850, 232}, {-1850, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN2.PHI_W, Sum_Brg.u[2]) annotation (
        Line(points = {{-1629, 232}, {-1550, 232}, {-1550, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN3.PHI_W, Sum_Brg.u[3]) annotation (
        Line(points = {{-899, 232}, {-890, 232}, {-890, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN5.PHI_W, Sum_Brg.u[4]) annotation (
        Line(points = {{-759, 232}, {-750, 232}, {-750, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN6.PHI_W, Sum_Brg.u[5]) annotation (
        Line(points = {{-139, 292}, {-130, 292}, {-130, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN7.PHI_W, Sum_Brg.u[6]) annotation (
        Line(points = {{71, 292}, {80, 292}, {80, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN8.PHI_W, Sum_Brg.u[7]) annotation (
        Line(points = {{281, 292}, {290, 292}, {290, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN9.PHI_W, Sum_Brg.u[8]) annotation (
        Line(points = {{921, 292}, {930, 292}, {930, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN10.PHI_W, Sum_Brg.u[9]) annotation (
        Line(points = {{1561, 292}, {1570, 292}, {1570, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SN11.PHI_W, Sum_Brg.u[10]) annotation (
        Line(points = {{1701, 292}, {1710, 292}, {1710, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N1.PHI_W, Sum_Brg.u[11]) annotation (
        Line(points = {{-1859, 8}, {-1850, 8}, {-1850, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N2.PHI_W, Sum_Brg.u[12]) annotation (
        Line(points = {{-1559, 8}, {-1550, 8}, {-1550, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N3.PHI_W, Sum_Brg.u[13]) annotation (
        Line(points = {{-969, 8}, {-960, 8}, {-960, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N4.PHI_W, Sum_Brg.u[14]) annotation (
        Line(points = {{-649, 128}, {-640, 128}, {-640, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N5.PHI_W, Sum_Brg.u[15]) annotation (
        Line(points = {{-489, 68}, {-480, 68}, {-480, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N6.PHI_W, Sum_Brg.u[16]) annotation (
        Line(points = {{-559, 8}, {-480, 8}, {-480, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N7.PHI_W, Sum_Brg.u[17]) annotation (
        Line(points = {{521, 68}, {560, 68}, {560, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N8.PHI_W, Sum_Brg.u[18]) annotation (
        Line(points = {{381, 8}, {400, 8}, {400, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N9.PHI_W, Sum_Brg.u[19]) annotation (
        Line(points = {{1841, 8}, {1850, 8}, {1850, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N10.PHI_W, Sum_Brg.u[20]) annotation (
        Line(points = {{1951, 8}, {1960, 8}, {1960, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(BB1.PHI_W, Sum_Brg.u[21]) annotation (
        Line(points = {{2161, 8}, {2170, 8}, {2170, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(SR1.PHI_W, Sum_SealRing.u[1]) annotation (
        Line(points = {{-2099, 8}, {-2089.5, 8}, {-2089.5, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR2.PHI_W, Sum_SealRing.u[2]) annotation (
        Line(points = {{-2069, 8}, {-2060, 8}, {-2060, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR3.PHI_W, Sum_SealRing.u[3]) annotation (
        Line(points = {{-2039, 8}, {-2030, 8}, {-2030, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR4.PHI_W, Sum_SealRing.u[4]) annotation (
        Line(points = {{-2009, 8}, {-2000, 8}, {-2000, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR5.PHI_W, Sum_SealRing.u[5]) annotation (
        Line(points = {{-1979, 8}, {-1970, 8}, {-1970, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR6.PHI_W, Sum_SealRing.u[6]) annotation (
        Line(points = {{-1209, 8}, {-1200, 8}, {-1200, 20}, {-1100, 20}, {-1100, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR7.PHI_W, Sum_SealRing.u[7]) annotation (
        Line(points = {{-1179, 8}, {-1170, 8}, {-1170, 20}, {-1100, 20}, {-1100, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR8.PHI_W, Sum_SealRing.u[8]) annotation (
        Line(points = {{-1149, 8}, {-1140, 8}, {-1140, 20}, {-1100, 20}, {-1100, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR9.PHI_W, Sum_SealRing.u[9]) annotation (
        Line(points = {{-1119, 8}, {-1109.5, 8}, {-1109.5, 20}, {-1100, 20}, {-1100, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR10.PHI_W, Sum_SealRing.u[10]) annotation (
        Line(points = {{2021, 8}, {2030, 8}, {2030, 20}, {2070, 20}, {2070, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR11.PHI_W, Sum_SealRing.u[11]) annotation (
        Line(points = {{2051, 8}, {2060.5, 8}, {2060.5, 20}, {2070, 20}, {2070, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR12.PHI_W, Sum_SealRing.u[12]) annotation (
        Line(points = {{-1789, 378}, {-1780, 378}, {-1780, 392}, {-1740, 392}, {-1740, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(SR13.PHI_W, Sum_SealRing.u[13]) annotation (
        Line(points = {{-1759, 378}, {-1750, 378}, {-1750, 392}, {-1740, 392}, {-1740, -330}, {2240, -330}}, color = {170, 0, 0}));
      connect(multiSum.y, Qf_GB_PNT_W) annotation (
        Line(points = {{2322, -130}, {2350, -130}}, color = {0, 0, 127}));
      connect(Sum_GearLoss.y, multiSum.u[1]) annotation (
        Line(points = {{2262, -170}, {2280, -170}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
      connect(Sum_Stirring.y, multiSum.u[2]) annotation (
        Line(points = {{2262, -210}, {2280, -210}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
      connect(Sum_ClutchLoss.y, multiSum.u[3]) annotation (
        Line(points = {{2262, -250}, {2280, -250}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
      connect(Sum_Brg.y, multiSum.u[4]) annotation (
        Line(points = {{2262, -290}, {2280, -290}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
      connect(Sum_SealRing.y, multiSum.u[5]) annotation (
        Line(points = {{2262, -330}, {2280, -330}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
      connect(OS1.PHI_W, multiSum.u[6]) annotation (
        Line(points = {{2221, 8}, {2230, 8}, {2230, -130}, {2300, -130}}, color = {170, 0, 0}));
      connect(Planet_Planet_P1.carrier, torqueSensor1.flange_a) annotation (
        Line(points = {{-1400, 190}, {-1370, 190}}));
      connect(inertia_RingGear_P1.flange_b, inertia_Carrier_P2.flange_b) annotation (
        Line(points = {{-1040, 360}, {-1000, 360}, {-1000, 500}, {-200, 500}, {-200, 300}, {-520, 300}}));
      connect(SN6.flange_a, inertia_Carrier_P2.flange_b) annotation (
        Line(points = {{-161, 300}, {-520, 300}}));
      connect(SN9.flange_a, inertia_Carrier_P3.flange_b) annotation (
        Line(points = {{899, 300}, {540, 300}}));
      connect(ClutchC3.flange_b, inertia_Carrier_P3.flange_b) annotation (
        Line(points = {{1700, 450}, {1760, 450}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
      connect(SN11.flange_b, inertia_Carrier_P3.flange_b) annotation (
        Line(points = {{1700, 300}, {1760, 300}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
      connect(N10.flange_a, inertia_Carrier_P3.flange_b) annotation (
        Line(points = {{1930, 0}, {1860, 0}, {1860, 60}, {1760, 60}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
      connect(N9.support, inertia_Carrier_P3.flange_b) annotation (
        Line(points = {{1830, 10}, {1830, 60}, {1760, 60}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
      connect(stirring2D1.support, inertia_Carrier_P3.flange_b) annotation (
        Line(points = {{1820, 350}, {1760, 350}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
      connect(SN9.flange_b, inertia_Carrier_P4.flange_a) annotation (
        Line(points = {{920, 300}, {1260, 300}}));
      connect(unitDelay1.y, trq2force1.u) annotation (
        Line(points = {{-1368, 151}, {-1368.5, 151}, {-1368.5, 140}, {-1342, 140}}, color = {0, 255, 0}));
      connect(BrakeB1.flange_a, ClutchC1.flange_b) annotation (
        Line(points = {{-1480, 570}, {-1570, 570}, {-1570, 400}, {-1630, 400}}));
      connect(BrakeB1.flange_b, fixed3.flange) annotation (
        Line(points = {{-1460, 570}, {-1400, 570}, {-1400, 596}}));
      connect(stirring2D_B1.flange_b, fixed3.flange) annotation (
        Line(points = {{-1460, 520}, {-1400, 520}, {-1400, 596}}));
      connect(realExpression32.y, stirring2D_B1.nu_oil_m2ps) annotation (
        Line(points = {{-1499, 540}, {-1490, 540}, {-1490, 528}, {-1482, 528}}, color = {0, 255, 0}));
      connect(realExpression39.y, BrakeB1.tau_clutch_cap) annotation (
        Line(points = {{-1499, 590}, {-1470, 590}, {-1470, 582}}, color = {0, 0, 127}));
      connect(BrakeB1.PHI_W, Sum_ClutchLoss.u[4]) annotation (
        Line(points = {{-1459, 560}, {-1450, 560}, {-1450, 492}, {-1550, 492}, {-1550, -250}, {2240, -250}}, color = {170, 0, 0}));
      connect(stirring2D_B1.PHI_W, Sum_Stirring.u[6]) annotation (
        Line(points = {{-1459, 512}, {-1450, 512}, {-1450, 492}, {-1550, 492}, {-1550, -210}, {2240, -210}}, color = {170, 0, 0}));
      connect(BrakeB2.flange_a, inertia_SunGear_P2.flange_b) annotation (
        Line(points = {{-60, 570}, {-120, 570}, {-120, 200}, {-240, 200}}));
      connect(stirring2D_B2.support, inertia_SunGear_P2.flange_b) annotation (
        Line(points = {{-60, 520}, {-120, 520}, {-120, 200}, {-240, 200}}));
      connect(BrakeB2.flange_b, fixed1.flange) annotation (
        Line(points = {{-40, 570}, {20, 570}, {20, 596}}));
      connect(stirring2D_B2.flange_b, fixed1.flange) annotation (
        Line(points = {{-40, 520}, {20, 520}, {20, 596}}));
      connect(realExpression34.y, stirring2D_B2.nu_oil_m2ps) annotation (
        Line(points = {{-79, 540}, {-69.5, 540}, {-69.5, 528}, {-62, 528}}, color = {0, 255, 0}));
      connect(realExpression37.y, BrakeB2.tau_clutch_cap) annotation (
        Line(points = {{-79, 590}, {-50, 590}, {-50, 582}}, color = {0, 0, 127}));
      connect(BrakeB2.PHI_W, Sum_ClutchLoss.u[5]) annotation (
        Line(points = {{-39, 560}, {-30, 560}, {-30, -250}, {2240, -250}}, color = {170, 0, 0}));
      connect(stirring2D_B2.PHI_W, Sum_Stirring.u[7]) annotation (
        Line(points = {{-39, 512}, {-30, 512}, {-30, -210}, {2240, -210}}, color = {170, 0, 0}));
      connect(BrakeB3.flange_a, inertia_RingGear_P3.flange_a) annotation (
        Line(points = {{150, 570}, {90, 570}, {90, 400}, {360, 400}}));
      connect(BrakeB3.flange_b, fixed7.flange) annotation (
        Line(points = {{170, 570}, {230, 570}, {230, 596}}));
      connect(stirring2D_B3.support, inertia_RingGear_P3.flange_a) annotation (
        Line(points = {{150, 520}, {90, 520}, {90, 400}, {360, 400}}));
      connect(stirring2D_B3.flange_b, fixed7.flange) annotation (
        Line(points = {{170, 520}, {230, 520}, {230, 596}}));
      connect(realExpression35.y, stirring2D_B3.nu_oil_m2ps) annotation (
        Line(points = {{131, 540}, {140, 540}, {140, 527}, {148, 527}, {148, 528}}, color = {0, 255, 0}));
      connect(realExpression38.y, BrakeB3.tau_clutch_cap) annotation (
        Line(points = {{131, 590}, {160, 590}, {160, 582}}, color = {0, 0, 127}));
      connect(BrakeB3.PHI_W, Sum_ClutchLoss.u[6]) annotation (
        Line(points = {{171, 560}, {180, 560}, {180, -250}, {2240, -250}}, color = {170, 0, 0}));
      connect(stirring2D_B3.PHI_W, Sum_Stirring.u[8]) annotation (
        Line(points = {{171, 512}, {180, 512}, {180, -210}, {2240, -210}}, color = {170, 0, 0}));
      connect(Planet_Planet_P1.pinion, inertia_PlanetGear_P1.flange_a) annotation (
        Line(points = {{-1400, 208}, {-1260, 208}, {-1260, 332}, {-1220, 332}}));
      connect(const4.y, N12_15.Fth) annotation (
        Line(points = {{-1319, 170}, {-1310, 170}, {-1310, 182}, {-1302, 182}}, color = {0, 255, 0}));
      connect(unitDelay1.u, torqueSensor1.tau) annotation (
        Line(points = {{-1368, 170}, {-1368, 179}}, color = {0, 255, 0}));
      connect(trq2force1.y, N12_15.Fr) annotation (
        Line(points = {{-1319, 140}, {-1292, 140}, {-1292, 178}}, color = {0, 255, 0}));
      connect(ClutchC1.flange_b, inertia_Carrier_P1.flange_a) annotation (
        Line(points = {{-1630, 400}, {-1570, 400}, {-1570, 240}, {-1220, 240}}));
      connect(stirring3D_C1.flange_b, inertia_Carrier_P1.flange_a) annotation (
        Line(points = {{-1630, 340}, {-1570, 340}, {-1570, 240}, {-1220, 240}}));
      connect(stirring2D_B1.support, inertia_Carrier_P1.flange_a) annotation (
        Line(points = {{-1480, 520}, {-1570, 520}, {-1570, 240}, {-1220, 240}}));
      connect(torqueSensor1.flange_b, N12_15.flange_a) annotation (
        Line(points = {{-1350, 190}, {-1300, 190}}));
      connect(N12_15.flange_b, inertia_Carrier_P1.flange_a) annotation (
        Line(points = {{-1280, 190}, {-1240, 190}, {-1240, 240}, {-1220, 240}}));
      connect(Planet_Planet_P1.pinion, N12_15.support) annotation (
        Line(points = {{-1400, 208}, {-1290, 208}, {-1290, 200}}));
      connect(realExpression46.y, N12_15.nu_oil_m2ps) annotation (
        Line(points = {{-1161, 270}, {-1310, 270}, {-1310, 196}, {-1302, 196}}, color = {0, 255, 0}));
      connect(torqueSensor2.flange_a, Planet_Planet_P2.carrier) annotation (
        Line(points = {{-370, 250}, {-340, 250}}));
      connect(N16_19.flange_a, torqueSensor2.flange_b) annotation (
        Line(points = {{-440, 250}, {-390, 250}}));
      connect(N16_19.flange_b, inertia_Carrier_P2.flange_b) annotation (
        Line(points = {{-460, 250}, {-500, 250}, {-500, 300}, {-520, 300}}));
      connect(Planet_Planet_P2.pinion, inertia_PlanetGear_P2.flange_b) annotation (
        Line(points = {{-340, 268}, {-480, 268}, {-480, 392}, {-520, 392}}));
      connect(Planet_Planet_P2.pinion, N16_19.support) annotation (
        Line(points = {{-340, 268}, {-450, 268}, {-450, 260}}));
      connect(const13.y, N16_19.Fth) annotation (
        Line(points = {{-421, 230}, {-430, 230}, {-430, 242}, {-438, 242}}, color = {0, 255, 0}));
      connect(realExpression43.y, N16_19.nu_oil_m2ps) annotation (
        Line(points = {{-579, 330}, {-430, 330}, {-430, 255}, {-438, 255}, {-438, 256}}, color = {0, 255, 0}));
      connect(torqueSensor2.tau, unitDelay2.u) annotation (
        Line(points = {{-372, 239}, {-372, 230}}, color = {0, 255, 0}));
      connect(trq2force2.y, N16_19.Fr) annotation (
        Line(points = {{-421, 200}, {-448, 200}, {-448, 238}}, color = {0, 255, 0}));
      connect(trq2force2.u, unitDelay2.y) annotation (
        Line(points = {{-398, 200}, {-372, 200}, {-372, 211}}, color = {0, 255, 0}));
      connect(torqueSensor3.flange_a, Planet_Planet_P3.carrier) annotation (
        Line(points = {{690, 250}, {720, 250}}));
      connect(N20_23.flange_a, torqueSensor3.flange_b) annotation (
        Line(points = {{620, 250}, {670, 250}}));
      connect(N20_23.flange_b, inertia_Carrier_P3.flange_b) annotation (
        Line(points = {{600, 250}, {560, 250}, {560, 300}, {540, 300}}));
      connect(Planet_Planet_P3.pinion, inertia_PlanetGear_P3.flange_b) annotation (
        Line(points = {{720, 268}, {580, 268}, {580, 392}, {540, 392}}));
      connect(Planet_Planet_P3.pinion, N20_23.support) annotation (
        Line(points = {{720, 268}, {610, 268}, {610, 260}}));
      connect(realExpression44.y, N20_23.nu_oil_m2ps) annotation (
        Line(points = {{481, 330}, {630, 330}, {630, 256}, {622, 256}}, color = {0, 255, 0}));
      connect(const.y, N20_23.Fth) annotation (
        Line(points = {{639, 230}, {630, 230}, {630, 242}, {622, 242}}, color = {0, 255, 0}));
      connect(torqueSensor3.tau, unitDelay3.u) annotation (
        Line(points = {{688, 239}, {688, 230}}, color = {0, 255, 0}));
      connect(trq2force3.y, N20_23.Fr) annotation (
        Line(points = {{639, 200}, {612, 200}, {612, 238}}, color = {0, 255, 0}));
      connect(trq2force3.u, unitDelay3.y) annotation (
        Line(points = {{662, 200}, {688, 200}, {688, 211}}, color = {0, 255, 0}));
      connect(Planet_Planet_P4.carrier, torqueSensor4.flange_a) annotation (
        Line(points = {{1080, 250}, {1110, 250}}));
      connect(torqueSensor4.flange_b, N24_27.flange_a) annotation (
        Line(points = {{1130, 250}, {1180, 250}}));
      connect(N24_27.flange_b, inertia_Carrier_P4.flange_a) annotation (
        Line(points = {{1200, 250}, {1240, 250}, {1240, 300}, {1260, 300}}));
      connect(Planet_Planet_P4.pinion, inertia_PlanetGear_P4.flange_a) annotation (
        Line(points = {{1080, 268}, {1220, 268}, {1220, 392}, {1260, 392}}));
      connect(Planet_Planet_P4.pinion, N24_27.support) annotation (
        Line(points = {{1080, 268}, {1190, 268}, {1190, 260}}));
      connect(const1.y, N24_27.Fth) annotation (
        Line(points = {{1161, 230}, {1170, 230}, {1170, 242}, {1178, 242}}, color = {0, 255, 0}));
      connect(torqueSensor4.tau, unitDelay4.u) annotation (
        Line(points = {{1112, 239}, {1112, 230}}, color = {0, 255, 0}));
      connect(trq2force4.u, unitDelay4.y) annotation (
        Line(points = {{1138, 200}, {1112, 200}, {1112, 211}}, color = {0, 255, 0}));
      connect(trq2force4.y, N24_27.Fr) annotation (
        Line(points = {{1161, 200}, {1188, 200}, {1188, 238}}, color = {0, 255, 0}));
      connect(realExpression45.y, N24_27.nu_oil_m2ps) annotation (
        Line(points = {{1319, 330}, {1170, 330}, {1170, 256}, {1178, 256}}, color = {0, 255, 0}));
      connect(N12_15.PHI_W, Sum_Brg.u[22]) annotation (
        Line(points = {{-1279, 198}, {-1260, 198}, {-1260, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N16_19.PHI_W, Sum_Brg.u[23]) annotation (
        Line(points = {{-461, 258}, {-480, 258}, {-480, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N20_23.PHI_W, Sum_Brg.u[24]) annotation (
        Line(points = {{599, 258}, {580, 258}, {580, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(N24_27.PHI_W, Sum_Brg.u[25]) annotation (
        Line(points = {{1201, 258}, {1220, 258}, {1220, -290}, {2240, -290}}, color = {170, 0, 0}));
      connect(brgLoadDistribution_TM.F_SN11[1], SN11.Fr) annotation (
        Line(points = {{-1763, 735}, {-1800, 735}, {-1800, 690}, {1540, 690}, {1540, 360}, {1670, 360}, {1670, 320}, {1688, 320}, {1688, 312}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN11[2], SN11.Fth) annotation (
        Line(points = {{-1763, 735}, {-1800, 735}, {-1800, 690}, {1540, 690}, {1540, 360}, {1670, 360}, {1670, 309}, {1678, 309}, {1678, 308}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN10[1], SN10.Fr) annotation (
        Line(points = {{-1763, 748}, {-1810, 748}, {-1810, 680}, {1530, 680}, {1530, 320}, {1548, 320}, {1548, 312}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN10[2], SN10.Fth) annotation (
        Line(points = {{-1763, 748}, {-1810, 748}, {-1810, 680}, {1530, 680}, {1530, 308}, {1538, 308}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN9[1], SN9.Fr) annotation (
        Line(points = {{-1763, 762}, {-1820, 762}, {-1820, 670}, {890, 670}, {890, 320}, {908.5, 320}, {908.5, 312}, {908, 312}}, color = {0, 255, 0}));
      connect(brgLoadDistribution_TM.F_SN9[2], SN9.Fth) annotation (
        Line(points = {{-1763, 762}, {-1820, 762}, {-1820, 670}, {890, 670}, {890, 308}, {898, 308}}, color = {0, 255, 0}));
      connect(SR8.flange_b, SR9.flange_a) annotation (
        Line(points = {{-1150, 0}, {-1140, 0}}));
      connect(SR7.flange_b, SR8.flange_a) annotation (
        Line(points = {{-1180, 0}, {-1170, 0}}));
      connect(SR6.flange_b, SR7.flange_a) annotation (
        Line(points = {{-1210, 0}, {-1200, 0}}));
      connect(N2.flange_b, SR6.flange_a) annotation (
        Line(points = {{-1560, 0}, {-1230, 0}}));
      connect(SR9.support, SR8.support) annotation (
        Line(points = {{-1130, 10}, {-1130, 60}, {-1160, 60}, {-1160, 10}}));
      connect(SR8.support, SR7.support) annotation (
        Line(points = {{-1160, 10}, {-1160, 60}, {-1190, 60}, {-1190, 10}}));
      connect(SR7.support, SR6.support) annotation (
        Line(points = {{-1190, 10}, {-1190, 60}, {-1220, 60}, {-1220, 10}}));
      connect(N10.flange_b, SR10.flange_a) annotation (
        Line(points = {{1950, 0}, {2000, 0}}));
      connect(SR10.flange_b, SR11.flange_a) annotation (
        Line(points = {{2020, 0}, {2030, 0}}));
      connect(fixed.flange, SR10.support) annotation (
        Line(points = {{2010, 56}, {2010, 10}}));
      connect(realExpression2.y, N1.nu_oil_m2ps) annotation (
        Line(points = {{-1898, 20}, {-1890, 20}, {-1890, 6}, {-1882, 6}, {-1882, 6}}, color = {0, 255, 0}));
      connect(constant1.y, N1.Fr) annotation (
        Line(points = {{-1898, -20}, {-1872, -20}, {-1872, -12}, {-1872, -12}}, color = {0, 255, 0}));
      connect(N1.Fth, constant1.y) annotation (
        Line(points = {{-1882, -8}, {-1890, -8}, {-1890, -20}, {-1898, -20}, {-1898, -20}}, color = {0, 255, 0}));
      connect(SR5.flange_b, N1.flange_a) annotation (
        Line(points = {{-1980, 0}, {-1880, 0}}));
      connect(fixed4.flange, N1.support) annotation (
        Line(points = {{-1870, 56}, {-1870, 10}}));
      connect(SR4.flange_b, SR5.flange_a) annotation (
        Line(points = {{-2010, 0}, {-2000, 0}}));
      connect(SR3.flange_b, SR4.flange_a) annotation (
        Line(points = {{-2040, 0}, {-2030, 0}}));
      connect(SR2.flange_b, SR3.flange_a) annotation (
        Line(points = {{-2070, 0}, {-2060, 0}}));
      connect(SR1.flange_b, SR2.flange_a) annotation (
        Line(points = {{-2100, 0}, {-2090, 0}}));
      connect(torqueToAngleAdaptor1.flange, SR1.flange_a) annotation (
        Line(points = {{-2256, 0}, {-2120, 0}}));
      connect(SR1.support, fixed2.flange) annotation (
        Line(points = {{-2110, 10}, {-2110, 56}}));
      connect(SR2.support, fixed5.flange) annotation (
        Line(points = {{-2080, 10}, {-2080, 56}}));
      connect(SR3.support, fixed14.flange) annotation (
        Line(points = {{-2050, 10}, {-2050, 56}}));
      connect(SR4.support, fixed15.flange) annotation (
        Line(points = {{-2020, 10}, {-2020, 56}}));
      connect(SR5.support, fixed16.flange) annotation (
        Line(points = {{-1990, 10}, {-1990, 56}}));
      connect(stirring2D.flange_b, fixed12.flange) annotation (
        Line(points = {{-880, 550}, {-840, 550}, {-840, 596}}));
      connect(hydraulicSystem.p_clutch_cap_lup_fil, sealRingPrsDistribution.p_clutch_cap_lup) annotation (
        Line(points = {{-2239, 130}, {-2210, 130}}, color = {0, 0, 127}));
      connect(hydraulicSystem.p_clutch_cap_c1_fil, sealRingPrsDistribution.p_clutch_cap_c1) annotation (
        Line(points = {{-2239, 110}, {-2210, 110}}, color = {0, 0, 127}));
      connect(hydraulicSystem.p_clutch_cap_c2_fil, sealRingPrsDistribution.p_clutch_cap_c2) annotation (
        Line(points = {{-2239, 90}, {-2210, 90}}, color = {0, 0, 127}));
      connect(hydraulicSystem.p_clutch_cap_c3_fil, sealRingPrsDistribution.p_clutch_cap_c3) annotation (
        Line(points = {{-2239, 70}, {-2210, 70}}, color = {0, 0, 127}));
      connect(tau_lockup_cap, hydraulicSystem.tau_clutch_cap_lup) annotation (
        Line(points = {{-2360, 130}, {-2270, 130}}, color = {0, 0, 127}));
      connect(realExpression.y, hydraulicSystem.tau_clutch_cap_c1) annotation (
        Line(points = {{-2298, 110}, {-2270, 110}}, color = {0, 0, 127}));
      connect(realExpression1.y, hydraulicSystem.tau_clutch_cap_c2) annotation (
        Line(points = {{-2298, 90}, {-2270, 90}}, color = {0, 0, 127}));
      connect(realExpression6.y, hydraulicSystem.tau_clutch_cap_c3) annotation (
        Line(points = {{-2298, 70}, {-2272, 70}, {-2272, 70}, {-2270, 70}}, color = {0, 0, 127}));
      connect(realExpression24.y, hydraulicSystem.p_line_Pa) annotation (
        Line(points = {{-2298, 150}, {-2272, 150}, {-2272, 150}, {-2270, 150}}, color = {0, 0, 127}));
      connect(Planet_Planet_P1.SunGearKa, brgLoadDistribution_TM.P1sKa) annotation (
        Line(points = {{-1398, 218}, {-1380, 218}, {-1380, 868}, {-1682, 868}}, color = {255, 85, 0}));
      connect(Planet_Planet_P2.SunGearKa, brgLoadDistribution_TM.P2sKa) annotation (
        Line(points = {{-342, 278}, {-360, 278}, {-360, 826}, {-1682, 826}}, color = {255, 85, 0}));
      connect(Planet_Planet_P3.SunGearKa, brgLoadDistribution_TM.P3sKa) annotation (
        Line(points = {{718, 278}, {710, 278}, {710, 784}, {-1682, 784}}, color = {255, 85, 0}));
      connect(Planet_Planet_P4.SunGearKa, brgLoadDistribution_TM.P4sKa) annotation (
        Line(points = {{1082, 278}, {1090, 278}, {1090, 744}, {-1682, 744}}, color = {255, 85, 0}));
      connect(Planet_Ring_P1.RingGearKa, brgLoadDistribution_TM.P1rKa) annotation (
        Line(points = {{-1118, 336}, {-1100, 336}, {-1100, 868}, {-1660, 868}, {-1660, 850}, {-1682, 850}}, color = {255, 85, 0}));
      connect(Planet_Ring_P2.RingGearKa, brgLoadDistribution_TM.P2rKa) annotation (
        Line(points = {{-622, 396}, {-640, 396}, {-640, 826}, {-1660, 826}, {-1660, 808}, {-1682, 808}}, color = {255, 85, 0}));
      connect(Planet_Ring_P3.RingGearKa, brgLoadDistribution_TM.P3rKa) annotation (
        Line(points = {{438, 396}, {420, 396}, {420, 784}, {-1660, 784}, {-1660, 766}, {-1682, 766}}, color = {255, 85, 0}));
      connect(Planet_Ring_P4.RingGearKa, brgLoadDistribution_TM.P4rKa) annotation (
        Line(points = {{1362, 396}, {1380, 396}, {1380, 744}, {-1660, 744}, {-1660, 726}, {-1682, 726}}, color = {255, 85, 0}));
      connect(N1.flange_b, SR12.flange_a) annotation (
        Line(points = {{-1860, 0}, {-1840, 0}, {-1840, 370}, {-1810, 370}}));
      connect(SR12.flange_b, SR13.flange_a) annotation (
        Line(points = {{-1790, 370}, {-1780, 370}}));
      connect(SR13.flange_b, ClutchC1.flange_a) annotation (
        Line(points = {{-1760, 370}, {-1720, 370}, {-1720, 400}, {-1650, 400}}));
      connect(SR13.flange_b, stirring3D_C1.flange_a) annotation (
        Line(points = {{-1760, 370}, {-1720, 370}, {-1720, 340}, {-1650, 340}}));
      connect(fixed17.flange, SR12.support) annotation (
        Line(points = {{-1800, 416}, {-1800, 380}}));
      connect(fixed18.flange, SR13.support) annotation (
        Line(points = {{-1770, 416}, {-1770, 380}}));
      connect(sealRingPrsDistribution.p_SR_Pa[1], SR1.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2130, -50}, {-2130, -8}, {-2122, -8}, {-2122, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[2], SR1.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2130, -50}, {-2130, -8}, {-2122, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[3], SR2.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2100, -50}, {-2100, -8}, {-2092, -8}, {-2092, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[4], SR2.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2100, -50}, {-2100, -8}, {-2092, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[5], SR3.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2070, -50}, {-2070, -8}, {-2062, -8}, {-2062, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[6], SR3.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2070, -50}, {-2070, -8}, {-2062, -8}, {-2062, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[7], SR4.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2040, -50}, {-2040, -8}, {-2032, -8}, {-2032, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[8], SR4.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2040, -50}, {-2040, -8}, {-2032, -8}, {-2032, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[9], SR5.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2010, -50}, {-2010, -8}, {-2002, -8}, {-2002, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[10], SR5.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2010, -50}, {-2010, -8}, {-2002, -8}, {-2002, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[11], SR6.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1240, -50}, {-1240, -8}, {-1232, -8}, {-1232, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[12], SR6.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1240, -50}, {-1240, -8}, {-1232, -8}, {-1232, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[13], SR7.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1210, -50}, {-1210, -8}, {-1202, -8}, {-1202, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[14], SR7.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1210, -50}, {-1210, -8}, {-1202, -8}, {-1202, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[15], SR8.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1180, -50}, {-1180, -8}, {-1172, -8}, {-1172, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[16], SR8.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1180, -50}, {-1180, -8}, {-1172, -8}, {-1172, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[17], SR9.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1150, -50}, {-1150, -8}, {-1142, -8}, {-1142, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[18], SR9.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1150, -50}, {-1150, -8}, {-1142, -8}, {-1142, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[19], SR10.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {1990, -50}, {1990, -8}, {1998, -8}, {1998, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[20], SR10.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {1990, -50}, {1990, -8}, {1998, -8}, {1998, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[21], SR11.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {2020, -50}, {2020, -8}, {2028, -8}, {2028, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[22], SR11.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {2020, -50}, {2020, -8}, {2028, -8}, {2028, -8}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[23], SR12.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1820, -50}, {-1820, 362}, {-1812, 362}, {-1812, 362}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[24], SR12.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1820, -50}, {-1820, 362}, {-1812, 362}, {-1812, 362}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[25], SR13.p_line_Pa[1]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1790, -50}, {-1790, 362}, {-1782, 362}, {-1782, 362}}, color = {0, 255, 0}));
      connect(sealRingPrsDistribution.p_SR_Pa[26], SR13.p_line_Pa[2]) annotation (
        Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1790, -50}, {-1790, 362}, {-1782, 362}, {-1782, 362}}, color = {0, 255, 0}));
      connect(
        brgLoadDistribution_TM.F_SN11[2], BB1.Fth) annotation (
        Line(points = {{-1762, 734}, {-1798, 734}, {-1798, 692}, {2088, 692}, {2088, -8}, {2138, -8}, {2138, -8}}, color = {0, 255,0}));
      annotation (
        Icon(coordinateSystem(extent = {{-100, -260}, {100, 260}}, initialScale = 0.1), graphics={  Rectangle(origin = {0, 60}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 200}, {100, -320}}), Text(origin = {0, -286}, lineColor = {0, 0, 255}, extent = {{-140, 26}, {140, -26}}, textString = "%name")}),
        Diagram(coordinateSystem(extent = {{-2340, -440}, {2340, 940}}, initialScale = 0.1), graphics={  Rectangle(origin = {520, 310}, lineColor = {170, 170, 255}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-180, 110}, {320, -130}}), Rectangle(origin = {1140, 310}, lineColor = {170, 170, 255}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-180, 110}, {320, -130}}), Rectangle(origin = {-540, 308}, lineColor = {170, 170, 255}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-180, 112}, {320, -128}}), Rectangle(origin = {-1340, 250}, lineColor = {170, 170, 255}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-200, 130}, {320, -130}})}),
        uses(Modelica(version = "3.2.3")),
        version = "");
    end TransmissionGear;

    model AT_DS
      parameter Real Oil_Viscosity_Breakpoint[:];
      Modelica.Blocks.Interfaces.RealInput tau_lockup_cap annotation (
        Placement(visible = true, transformation(origin = {-140, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 200}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput tau_clutch_cap[6] annotation (
        Placement(visible = true, transformation(origin = {-140, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 260}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_TM_PNT_FW_radps annotation (
        Placement(visible = true, transformation(origin = {-140, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_DS_PNT_out_radps annotation (
        Placement(visible = true, transformation(origin = {-140, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_FW_Nm annotation (
        Placement(visible = true, transformation(origin = {130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_DS_PNT_out_Nm annotation (
        Placement(visible = true, transformation(origin = {130, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput ratio_AT annotation (
        Placement(visible = true, transformation(origin = {-140, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
        Placement(visible = true, transformation(origin = {-140, -116}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
        Placement(visible = true, transformation(origin = {-140, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_GB_PNT_W annotation (
        Placement(visible = true, transformation(origin = {130, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_gearbox_input_radps annotation (
        Placement(visible = true, transformation(origin = {130, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 260}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_gearbox_output_radps annotation (
        Placement(visible = true, transformation(origin = {130, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_SD_PNT_W annotation (
        Placement(visible = true, transformation(origin = {130, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.DriveShaft driveShaft(Jds = 0.01, c = 1e4, d = 632.5) annotation (
        Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.FinalGear finalGear(GearRatio = 3.066, Jdf = 0.01, Oil_Viscosity_Breakpoint = {12.4e-6, 20.4e-6, 37.7e-6, 82.0e-6, 223.4e-6}, c = 1e4, d = 1e6) annotation (
        Placement(visible = true, transformation(origin = {52.175, 0.251393}, extent = {{-13.681, -16.8381}, {13.681, 10.5238}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_DF_PNT_W annotation (
        Placement(visible = true, transformation(origin = {130, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.TransmissionGear transmissionGear(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -26}, {10, 26}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_OP_radps annotation (
        Placement(visible = true, transformation(origin = {-130, -230}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -270}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_OP_Nm annotation (
        Placement(visible = true, transformation(origin = {-140, -190}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -220}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.TorqueConverter torqueConverter(CapacityCoefficientTabName = "CapacityCoefficient", J_in = 0.08, J_out = 0.08, LUdamper_d = 1e1, Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, StartDeviceFileName = "TorqueConverter.txt", TorqueRatioTabName = "TorqueRatio") annotation (
        Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -15}, {10, 15}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput t_trans_fluid_K annotation (
        Placement(visible = true, transformation(origin = {-140, -152}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Math.Add add annotation (
        Placement(visible = true, transformation(origin = {100, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable1Dv nu_oil_AT2DF(table = [4.0e-06, 1.24e-05; 4.1e-06, 1.24e-05; 6.0e-06, 2.04e-05; 9.7e-06, 3.77e-05; 1.80e-05, 8.2e-05; 3.94e-05, 2.23e-04; 3.95e-05, 2.23e-04])  annotation (
        Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(finalGear.w_TM_PNT_AT_Gear_radps, w_gearbox_output_radps) annotation (
        Line(points = {{37, 4}, {26, 4}, {26, 80}, {130, 80}}, color = {0, 0, 127}));
      connect(finalGear.trq_TM_PNT_DF_Nm, driveShaft.trq_TM_PNT_DF_Nm) annotation (
        Line(points = {{67, -4}, {78, -4}}, color = {0, 0, 127}));
      connect(driveShaft.w_TM_PNT_DF_radps, finalGear.w_TM_PNT_DF_radps) annotation (
        Line(points = {{79, 4}, {69, 4}}, color = {0, 0, 127}));
      connect(finalGear.Qf_DF_PNT_W, Qf_DF_PNT_W) annotation (
        Line(points = {{67, -10}, {70, -10}, {70, -220}, {130, -220}}, color = {0, 0, 127}));
      connect(finalGear.w_TM_PNT_AT_Gear_radps, transmissionGear.w_TM_PNT_AT_Gear_radps) annotation (
        Line(points = {{37, 4}, {12, 4}}, color = {0, 0, 127}));
      connect(transmissionGear.ratio_AT, ratio_AT) annotation (
        Line(points = {{-12, -12}, {-34, -12}, {-34, -80}, {-140, -80}}, color = {0, 0, 127}));
      connect(transmissionGear.p_line_Pa, p_line_Pa) annotation (
        Line(points = {{-12, -20}, {-28, -20}, {-28, -116}, {-140, -116}}, color = {0, 0, 127}));
      connect(transmissionGear.w_TM_PNT_TC_radps, w_gearbox_input_radps) annotation (
        Line(points = {{-11, 4}, {-20, 4}, {-20, 100}, {130, 100}}, color = {0, 0, 127}));
      connect(nu_oil_m2ps, transmissionGear.Nu_oil_m2ps) annotation (
        Line(points = {{-140, 40}, {-108, 40}, {-108, -60}, {-20, -60}, {-20, -28}, {-12, -28}}, color = {0, 0, 127}));
      connect(tau_clutch_cap, transmissionGear.tau_clutch_cap) annotation (
        Line(points = {{-140, 100}, {-30, 100}, {-30, 18}, {-12, 18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(transmissionGear.w_TM_PNT_TC_radps, torqueConverter.w_TM_PNT_TC_radps) annotation (
        Line(points = {{-11, 4}, {-48, 4}}, color = {0, 0, 127}));
      connect(torqueConverter.trq_TM_PNT_TC_Nm, transmissionGear.trq_TM_PNT_TC_Nm) annotation (
        Line(points = {{-49, -4}, {-30.5, -4}, {-30.5, -3}, {-12, -3}}, color = {0, 0, 127}));
      connect(tau_lockup_cap, torqueConverter.tau_lockup_cap) annotation (
        Line(points = {{-140, 70}, {-60, 70}, {-60, 17}}, color = {0, 0, 127}));
      connect(torqueConverter.Qf_SD_PNT_W, Qf_SD_PNT_W) annotation (
        Line(points = {{-49, -10}, {-40, -10}, {-40, -100}, {130, -100}}, color = {0, 0, 127}));
      connect(w_TM_PNT_FW_radps, torqueConverter.w_TM_PNT_FW_radps) annotation (
        Line(points = {{-140, -2}, {-72, -2}}, color = {0, 0, 127}));
      connect(transmissionGear.trq_TM_PNT_AT_GEAR_Nm, finalGear.trq_TM_PNT_AT_Gear_Nm) annotation (
        Line(points = {{11, -3}, {24, -3}, {24, -4}, {36, -4}}, color = {0, 0, 127}));
      connect(w_DS_PNT_out_radps, driveShaft.w_DS_PNT_out_radps) annotation (
        Line(points = {{-140, -40}, {110, -40}, {110, 4}, {102, 4}, {102, 4}}, color = {0, 0, 127}));
      connect(torqueConverter.w_TM_PNT_OP_radps, w_TM_PNT_OP_radps) annotation (
        Line(points = {{-71, 12}, {-100, 12}, {-100, -230}, {-130, -230}}, color = {0, 0, 127}));
      connect(torqueConverter.trq_TM_PNT_OP_Nm, trq_TM_PNT_OP_Nm) annotation (
        Line(points = {{-72, 6}, {-90, 6}, {-90, -190}, {-140, -190}}, color = {0, 0, 127}));
      connect(trq_TM_PNT_FW_Nm, torqueConverter.trq_TM_PNT_FW_Nm) annotation (
        Line(points = {{130, 60}, {-80, 60}, {-80, -8}, {-71, -8}}, color = {0, 0, 127}));
      connect(torqueConverter.nu_oil_m2ps, nu_oil_m2ps) annotation (
        Line(points = {{-72, -14}, {-80, -14}, {-80, -60}, {-108, -60}, {-108, 40}, {-140, 40}}, color = {0, 0, 127}));
      connect(add.y, Qf_GB_PNT_W) annotation (
        Line(points = {{112, -140}, {122, -140}, {122, -140}, {130, -140}}, color = {0, 0, 127}));
      connect(transmissionGear.Qf_GB_PNT_W, add.u2) annotation (
        Line(points = {{11, -20}, {18, -20}, {18, -146}, {88, -146}}, color = {0, 0, 127}));
      connect(torqueConverter.Qf_GB_PNT_W, add.u1) annotation (
        Line(points = {{-48, -14}, {-46, -14}, {-46, -106}, {80, -106}, {80, -134}, {88, -134}, {88, -134}}, color = {0, 0, 127}));
      connect(tau_lockup_cap, transmissionGear.tau_lockup_cap) annotation (
        Line(points = {{-140, 70}, {-40, 70}, {-40, 10}, {-12, 10}, {-12, 11}}, color = {0, 0, 127}));
      connect(driveShaft.trq_DS_PNT_out_Nm, trq_DS_PNT_out_Nm) annotation (
        Line(points = {{102, -4}, {122, -4}, {122, -4}, {130, -4}}, color = {0, 0, 127}));
      connect(t_trans_fluid_K, finalGear.t_trans_fluid_K) annotation (
        Line(points = {{-140, -152}, {30, -152}, {30, -18}, {36, -18}, {36, -16}}, color = {0, 0, 127}));
      connect(
        nu_oil_m2ps, nu_oil_AT2DF.u[1]) annotation (
        Line(points = {{-140, 40}, {-108, 40}, {-108, -60}, {-12, -60}}, color = {0, 0, 127}));
      connect(
        nu_oil_AT2DF.y[1], finalGear.nu_oil_m2ps) annotation (
        Line(points = {{11, -60}, {24, -60}, {24, -10}, {36, -10}}, color = {0, 0, 127}));
      annotation (
        Diagram(coordinateSystem(extent = {{-120, -280}, {120, 280}})),
        __OpenModelica_commandLineOptions = "",
        Icon(coordinateSystem(extent = {{-100, -300}, {100, 280}}, initialScale = 0.1), graphics={  Rectangle(origin = {0, -10}, extent = {{-100, 290}, {100, -290}}), Text(origin = {0, -334}, lineColor = {0, 0, 255}, extent = {{-140, 26}, {140, -26}}, textString = "%name")}),
        uses(Modelica(version = "3.2.3")),
        version = "");
    end AT_DS;

    model TorqueConverter
      constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
      constant Real BRG_DummyLoad = 1000;
      parameter String StartDeviceFileName;
      parameter String CapacityCoefficientTabName;
      parameter String TorqueRatioTabName;
      parameter Real Oil_Viscosity_Breakpoint[:];
      parameter Modelica.Units.SI.Inertia J_in = 0.01;
      parameter Modelica.Units.SI.Inertia J_out = 0.01;
      parameter Modelica.Units.SI.RotationalSpringConstant Shaft_c = 1e5;
      parameter Modelica.Units.SI.RotationalDampingConstant Shaft_d = 1e3;
      parameter Modelica.Units.SI.RotationalSpringConstant LUdamper_c = 1e3;
      parameter Modelica.Units.SI.RotationalDampingConstant LUdamper_d = 1e3;
      Modelica.Blocks.Math.Division division1 annotation (
        Placement(visible = true, transformation(origin = {10, -66}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
        Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product1 annotation (
        Placement(visible = true, transformation(origin = {50, -6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product2 annotation (
        Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain3(k = -1) annotation (
        Placement(visible = true, transformation(origin = {150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product3 annotation (
        Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput tau_lockup_cap annotation (
        Placement(visible = true, transformation(origin = {-380, 150}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 170}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
      Modelica.Blocks.Math.Add add1(k1 = -1, k2 = +1) annotation (
        Placement(visible = true, transformation(origin = {190, -140}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
      Modelica.Blocks.Sources.Constant const(k = 1e-3) annotation (
        Placement(visible = true, transformation(origin = {90, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Mechanics.Rotational.Components.SpringDamper LUdamper(c = LUdamper_c, d = LUdamper_d, phi_rel(fixed = true, start = 0), w_rel(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {144, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.SpringDamper Shaft(c = Shaft_c, d = Shaft_d, phi_rel(fixed = true, start = 0), w_rel(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {-156, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_in(J = J_in) annotation (
        Placement(visible = true, transformation(origin = {-122, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product5 annotation (
        Placement(visible = true, transformation(origin = {50, -146}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product4 annotation (
        Placement(visible = true, transformation(origin = {190, -100}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Blocks.Math.Abs abs1 annotation (
        Placement(visible = true, transformation(origin = {230, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation (
        Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation (
        Placement(visible = true, transformation(origin = {-70, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor2 annotation (
        Placement(visible = true, transformation(origin = {268, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor2 annotation (
        Placement(visible = true, transformation(origin = {278, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation (
        Placement(visible = true, transformation(origin = {240, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sources.Torque torque2 annotation (
        Placement(visible = true, transformation(origin = {-50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch ClutchLU(tanhCoeff = -350) annotation (
        Placement(visible = true, transformation(origin = {30, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia_out(J = J_out, w(start = 0)) annotation (
        Placement(visible = true, transformation(origin = {114, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_SD_PNT_W annotation (
        Placement(visible = true, transformation(origin = {370, -134}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain2(k = 60 / (2 * Modelica.Constants.pi)) annotation (
        Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor2(use_a = false, use_w = false) annotation (
        Placement(visible = true, transformation(origin = {318, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_TM_PNT_TC_radps annotation (
        Placement(visible = true, transformation(origin = {380, 30}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_TC_Nm annotation (
        Placement(visible = true, transformation(origin = {370, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor1(use_a = false, use_w = false) annotation (
        Placement(visible = true, transformation(origin = {-318, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_FW_Nm annotation (
        Placement(visible = true, transformation(origin = {-370, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_TM_PNT_FW_radps annotation (
        Placement(visible = true, transformation(origin = {-380, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain4(k = -1) annotation (
        Placement(visible = true, transformation(origin = {344, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain5(k = -1) annotation (
        Placement(visible = true, transformation(origin = {-344, -30}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator1(k = 1, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-344, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator2(k = 1, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {344, 30}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Max max1 annotation (
        Placement(visible = true, transformation(origin = {50, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
        Placement(visible = true, transformation(origin = {-202, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal OS2(OilSeal_friction_filename = "OS2.txt") annotation (
        Placement(visible = true, transformation(origin = {-202, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N11(BRG_Friction_Filename = "N11.txt") annotation (
        Placement(visible = true, transformation(origin = {-280, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
        Placement(visible = true, transformation(origin = {-280, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant constant1(k = BRG_DummyLoad) annotation (
        Placement(visible = true, transformation(origin = {-240, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
        Placement(visible = true, transformation(origin = {-380, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression28(y = nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {-240, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor(use_a = false, use_w = true) annotation (
        Placement(visible = true, transformation(origin = {-318, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_OP_radps annotation (
        Placement(visible = true, transformation(origin = {-370, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain(k = -1) annotation (
        Placement(visible = true, transformation(origin = {-344, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_OP_Nm annotation (
        Placement(visible = true, transformation(origin = {-380, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_GB_PNT_W annotation (
        Placement(visible = true, transformation(origin = {370, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add add2(k1 = +1, k2 = +1) annotation (
        Placement(visible = true, transformation(origin = {-150, -180}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
      Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + StartDeviceFileName, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = CapacityCoefficientTabName, tableOnFile = true) annotation (
        Placement(visible = true, transformation(origin = {10, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2Ds combiTable2D(fileName = currDir + "/Tables/" + StartDeviceFileName, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = TorqueRatioTabName, tableOnFile = true) annotation (
        Placement(visible = true, transformation(origin = {150, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression1(y = nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression realExpression2(y = nu_oil_m2ps) annotation (
        Placement(visible = true, transformation(origin = {150, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add add(k1 = +1, k2 = +1) annotation (
        Placement(visible = true, transformation(origin = {330, -134}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
    equation
      connect(const.y, max1.u2) annotation (
        Line(points = {{79, -96}, {70, -96}, {70, -86}, {62, -86}}, color = {0, 0, 127}));
      connect(max1.y, division1.u2) annotation (
        Line(points = {{39, -80}, {30, -80}, {30, -72}, {22, -72}}, color = {0, 0, 127}));
      connect(speedSensor1.w, max1.u1) annotation (
        Line(points = {{-70, -43}, {-70, -112}, {120, -112}, {120, -74}, {62, -74}}, color = {0, 0, 127}));
      connect(gain4.y, trq_TM_PNT_TC_Nm) annotation (
        Line(points = {{351, -30}, {370, -30}}, color = {0, 0, 127}));
      connect(angleToTorqueAdaptor2.tau, gain4.u) annotation (
        Line(points = {{321, -8}, {330, -8}, {330, -30}, {337, -30}}, color = {0, 0, 127}));
      connect(integrator2.y, angleToTorqueAdaptor2.phi) annotation (
        Line(points = {{337, 30}, {330, 30}, {330, 8}, {321, 8}}, color = {0, 0, 127}));
      connect(w_TM_PNT_TC_radps, integrator2.u) annotation (
        Line(points = {{380, 30}, {351, 30}}, color = {0, 0, 127}));
      connect(gain5.y, trq_TM_PNT_FW_Nm) annotation (
        Line(points = {{-351, -30}, {-370, -30}}, color = {0, 0, 127}));
      connect(angleToTorqueAdaptor1.tau, gain5.u) annotation (
        Line(points = {{-321, -8}, {-330, -8}, {-330, -30}, {-337, -30}}, color = {0, 0, 127}));
      connect(integrator1.y, angleToTorqueAdaptor1.phi) annotation (
        Line(points = {{-337, 30}, {-330, 30}, {-330, 8}, {-321, 8}}, color = {0, 0, 127}));
      connect(w_TM_PNT_FW_radps, integrator1.u) annotation (
        Line(points = {{-380, 30}, {-351, 30}}, color = {0, 0, 127}));
      connect(gain2.y, product1.u2) annotation (
        Line(points = {{79, 0}, {69.5, 0}, {69.5, -12}, {62, -12}}, color = {0, 0, 127}));
      connect(speedSensor1.w, gain2.u) annotation (
        Line(points = {{-70, -43}, {-70, -112}, {120, -112}, {120, 0}, {102, 0}}, color = {0, 0, 127}));
      connect(gain2.y, product1.u1) annotation (
        Line(points = {{79, 0}, {62, 0}}, color = {0, 0, 127}));
      connect(torqueSensor2.flange_b, angleToTorqueAdaptor2.flange) annotation (
        Line(points = {{278, 0}, {316, 0}}));
      connect(ClutchLU.flange_b, inertia_out.flange_a) annotation (
        Line(points = {{40, 124}, {104, 124}}));
      connect(inertia_out.flange_b, LUdamper.flange_a) annotation (
        Line(points = {{124, 124}, {134, 124}}));
      connect(torqueSensor1.tau, product5.u2) annotation (
        Line(points = {{-88, -11}, {-88, -152}, {38, -152}}, color = {0, 0, 127}));
      connect(speedSensor2.flange, torqueSensor2.flange_b) annotation (
        Line(points = {{278, -22}, {278, 0}}));
      connect(torque1.flange, torqueSensor2.flange_a) annotation (
        Line(points = {{250, 0}, {258, 0}}));
      connect(torqueSensor2.tau, product4.u2) annotation (
        Line(points = {{260, -11}, {260, -94.5}, {202, -94.5}, {202, -94}}, color = {0, 0, 127}));
      connect(tau_lockup_cap, ClutchLU.tau_clutch_cap) annotation (
        Line(points = {{-380, 150}, {30, 150}, {30, 136}}, color = {0, 0, 127}));
      connect(speedSensor2.w, division1.u1) annotation (
        Line(points = {{278, -43}, {278, -60}, {22, -60}}, color = {0, 0, 127}));
      connect(product3.y, torque1.tau) annotation (
        Line(points = {{221, 0}, {228, 0}}, color = {0, 0, 127}));
      connect(gain3.y, product3.u1) annotation (
        Line(points = {{161, 30}, {179.5, 30}, {179.5, 6}, {198, 6}}, color = {0, 0, 127}));
      connect(speedSensor2.w, product4.u1) annotation (
        Line(points = {{278, -43}, {278, -106}, {202, -106}}, color = {0, 0, 127}));
      connect(speedSensor1.w, product5.u1) annotation (
        Line(points = {{-70, -43}, {-70, -140}, {38, -140}}, color = {0, 0, 127}));
      connect(add1.y, abs1.u) annotation (
        Line(points = {{201, -140}, {218, -140}}, color = {0, 0, 127}));
      connect(product4.y, add1.u1) annotation (
        Line(points = {{179, -100}, {150, -100}, {150, -134}, {178, -134}}, color = {0, 0, 127}));
      connect(product5.y, add1.u2) annotation (
        Line(points = {{61, -146}, {178, -146}}, color = {0, 0, 127}));
      connect(Shaft.flange_b, inertia_in.flange_a) annotation (
        Line(points = {{-146, 0}, {-132, 0}}));
      connect(product1.y, product2.u2) annotation (
        Line(points = {{39, -6}, {30, -6}, {30, 14}, {70, 14}, {70, 24}, {78, 24}}, color = {0, 0, 127}));
      connect(gain1.y, product2.u1) annotation (
        Line(points = {{61, 36}, {78, 36}}, color = {0, 0, 127}));
      connect(gain3.u, product2.y) annotation (
        Line(points = {{138, 30}, {101, 30}}, color = {0, 0, 127}));
      connect(product2.y, torque2.tau) annotation (
        Line(points = {{101, 30}, {120, 30}, {120, 60}, {-30, 60}, {-30, 0}, {-38, 0}}, color = {0, 0, 127}));
      connect(fixed.flange, OS2.support) annotation (
        Line(points = {{-202, 70}, {-202, 80}}));
      connect(fixed1.flange, N11.support) annotation (
        Line(points = {{-280, 70}, {-280, 80}}));
      connect(OS2.flange_b, N11.flange_a) annotation (
        Line(points = {{-212, 90}, {-270, 90}}));
      connect(constant1.y, N11.Fr) annotation (
        Line(points = {{-251, 120}, {-278, 120}, {-278, 102}}, color = {0, 255, 0}));
      connect(N11.Fth, constant1.y) annotation (
        Line(points = {{-268, 98}, {-268, 99}, {-260, 99}, {-260, 120}, {-251, 120}}, color = {0, 255, 0}));
      connect(realExpression28.y, N11.nu_oil_m2ps) annotation (
        Line(points = {{-251, 70}, {-260, 70}, {-260, 84}, {-268, 84}}, color = {0, 255, 0}));
      connect(OS2.flange_a, Shaft.flange_a) annotation (
        Line(points = {{-192, 90}, {-180, 90}, {-180, 0}, {-166, 0}}));
      connect(torqueToAngleAdaptor.flange, N11.flange_b) annotation (
        Line(points = {{-316, 90}, {-290, 90}}));
      connect(gain.y, torqueToAngleAdaptor.tau) annotation (
        Line(points = {{-337, 60}, {-329.5, 60}, {-329.5, 82}, {-321, 82}}, color = {0, 0, 127}));
      connect(torqueToAngleAdaptor.w, w_TM_PNT_OP_radps) annotation (
        Line(points = {{-321, 95}, {-330, 95}, {-330, 120}, {-370, 120}}, color = {0, 0, 127}));
      connect(trq_TM_PNT_OP_Nm, gain.u) annotation (
        Line(points = {{-380, 60}, {-351, 60}}, color = {0, 0, 127}));
      connect(N11.PHI_W, add2.u2) annotation (
        Line(points = {{-291, 82}, {-300, 82}, {-300, -186}, {-162, -186}}, color = {191, 0, 0}));
      connect(add2.y, Qf_GB_PNT_W) annotation (
        Line(points = {{-139, -180}, {370, -180}}, color = {191, 0, 0}));
      connect(combiTable2D1.y, gain1.u) annotation (
        Line(points = {{21, 36}, {38, 36}}, color = {0, 0, 127}));
      connect(combiTable2D1.u1, division1.y) annotation (
        Line(points = {{-2, 42}, {-20, 42}, {-20, -66}, {-1, -66}}, color = {0, 0, 127}));
      connect(combiTable2D.y, product3.u2) annotation (
        Line(points = {{161, -26}, {180, -26}, {180, -6}, {198, -6}}, color = {0, 0, 127}));
      connect(combiTable2D.u1, division1.y) annotation (
        Line(points = {{138, -20}, {-10, -20}, {-10, -66}, {-1, -66}}, color = {0, 0, 127}));
      connect(realExpression1.y, combiTable2D1.u2) annotation (
        Line(points = {{-1, 10}, {-10, 10}, {-10, 30}, {-2, 30}}, color = {0, 255, 0}));
      connect(realExpression2.y, combiTable2D.u2) annotation (
        Line(points = {{139, -50}, {130, -50}, {130, -32}, {138, -32}}, color = {0, 255, 0}));
      connect(angleToTorqueAdaptor1.flange, Shaft.flange_a) annotation (
        Line(points = {{-316, 0}, {-166, 0}}));
      connect(inertia_in.flange_b, torqueSensor1.flange_a) annotation (
        Line(points = {{-112, 0}, {-90, 0}}));
      connect(torqueSensor1.flange_b, torque2.flange) annotation (
        Line(points = {{-70, 0}, {-60, 0}}));
      connect(speedSensor1.flange, torqueSensor1.flange_b) annotation (
        Line(points = {{-70, -22}, {-70, 0}}));
      connect(OS2.PHI_W, add2.u1) annotation (
        Line(points = {{-212, 82}, {-220, 82}, {-220, -174}, {-162, -174}}, color = {191, 0, 0}));
      connect(LUdamper.flange_b, angleToTorqueAdaptor2.flange) annotation (
        Line(points = {{154, 124}, {308, 124}, {308, 0}, {316, 0}}));
      connect(ClutchLU.flange_a, inertia_in.flange_b) annotation (
        Line(points = {{20, 124}, {-100, 124}, {-100, 0}, {-112, 0}}));
      connect(abs1.y, add.u2) annotation (
        Line(points = {{242, -140}, {318, -140}, {318, -140}, {318, -140}}, color = {191, 0, 0}));
      connect(ClutchLU.PHI_W, add.u1) annotation (
        Line(points = {{40, 114}, {60, 114}, {60, 88}, {296, 88}, {296, -128}, {318, -128}, {318, -128}}, color = {191, 0, 0}));
      connect(add.y, Qf_SD_PNT_W) annotation (
        Line(points = {{342, -134}, {370, -134}}, color = {191, 0, 0}));
      annotation (
        Icon(graphics={  Rectangle(origin = {0, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -200}}), Text(origin = {-18, -172}, lineColor = {0, 0, 255}, extent = {{-122, 22}, {158, -28}}, textString = "%name"), Ellipse(origin = {10, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 120}, {29, 10}}, startAngle = 90, endAngle = 270), Ellipse(origin = {-14, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{64, 120}, {-25, 10}}, startAngle = -90, endAngle = 90), Ellipse(origin = {-16, -100}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{66, 90}, {-23, -20}}, startAngle = -90, endAngle = 90), Ellipse(origin = {14, -100}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-64, 90}, {25, -20}}, startAngle = 90, endAngle = 270), Ellipse(extent = {{-42, 96}, {-42, 96}}, endAngle = 360), Ellipse(extent = {{-81, 149}, {81, -149}}, endAngle = 360), Rectangle(origin = {8, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-108, 25}, {-7.6, -25}}), Rectangle(origin = {-8, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{108, 25}, {7.6, -25}}), Text(origin = {28, 176}, extent = {{-10, 10}, {70, -20}}, textString = "LockUp"), Text(origin = {-115, -60}, extent = {{-19, 20}, {19, -20}}, textString = "T"), Text(origin = {-117, 10}, extent = {{-19, 20}, {19, -20}}, textString = "w"), Text(origin = {121, -18}, extent = {{-19, 20}, {19, -20}}, textString = "T"), Text(origin = {119, 78}, extent = {{-19, 20}, {19, -20}}, textString = "w"), Text(origin = {119, -78}, extent = {{-19, 20}, {41, -22}}, textString = "QfSD"), Text(origin = {-117, 146}, extent = {{-19, 20}, {19, -20}}, textString = "w"), Text(origin = {-117, 86}, extent = {{-19, 20}, {19, -20}}, textString = "T"), Text(origin = {-121, -108}, extent = {{-19, 20}, {19, -20}}, textString = "nu"), Text(origin = {119, -120}, extent = {{-19, 20}, {41, -22}}, textString = "QfGB")}, coordinateSystem(extent = {{-100, -150}, {100, 150}}, initialScale = 0.1)),
        Diagram(coordinateSystem(extent = {{-360, -200}, {360, 180}})),
        __OpenModelica_commandLineOptions = "",
        version = "",
        uses(Modelica(version = "3.2.3")));
    end TorqueConverter;

    model Clutch
      Modelica.Blocks.Interfaces.RealInput tau_clutch_cap annotation (
        Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
        Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
        Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
        Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
        Placement(visible = true, transformation(origin = {72, 4.44089e-16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product1 annotation (
        Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.02, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-12, 90}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.Tanh tanh(Coeff = -10) annotation (
        Placement(visible = true, transformation(origin = {-42, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(firstOrder1.y, product1.u1) annotation (
        Line(points = {{-18, 90}, {-24, 90}, {-24, 4}, {-20, 4}, {-20, 4}}, color = {0, 0, 127}));
      connect(tau_clutch_cap, firstOrder1.u) annotation (
        Line(points = {{0, 120}, {0, 120}, {0, 90}, {-4, 90}, {-4, 90}}, color = {0, 0, 127}));
      connect(product1.y, torque1.tau) annotation (
        Line(points = {{-6, 0}, {64, 0}, {64, 0}, {64, 0}}, color = {0, 0, 127}));
      connect(flange_b, relSpeedSensor1.flange_b) annotation (
        Line(points = {{100, 0}, {90, 0}, {90, 16}, {-60, 16}}));
      connect(flange_a, relSpeedSensor1.flange_a) annotation (
        Line(points = {{-100, 0}, {-88, 0}, {-88, 16}, {-72, 16}}));
      connect(torque1.support, flange_a) annotation (
        Line(points = {{72, -6}, {72, -40}, {-88, -40}, {-88, 0}, {-100, 0}}));
      connect(torque1.flange, flange_b) annotation (
        Line(points = {{78, 0}, {100, 0}, {100, 0}, {100, 0}}));
      connect(tanh.y, product1.u2) annotation (
        Line(points = {{-35, -4}, {-20, -4}}, color = {0, 0, 127}));
      connect(tanh.u, relSpeedSensor1.w_rel) annotation (
        Line(points = {{-49, -4}, {-66, -4}, {-66, 10}}, color = {0, 0, 127}));
      annotation (
        Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-100, 14}, {100, -26}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
    end Clutch;

    model OilPump
      parameter String Oil_Pump_Loss_Table_Filename = "OP.txt";
      parameter Real Oil_Viscosity_Breakpoint[:] = {4.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6};
      Modelica.Blocks.Math.Gain gain2(k = 60 / (2 * Modelica.Constants.pi)) annotation (
        Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput PHI_TM_PNT_OP_W annotation (
        Placement(visible = true, transformation(origin = {20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product1 annotation (
        Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
        Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D1(filename = Oil_Pump_Loss_Table_Filename, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {34, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      /* Table Input Angular Velocity unit [rpm]　Oil Pressure unit [kPa] Oil Viscosity unit [mm^2/s]　*/
      Modelica.Blocks.Interfaces.RealInput p_Line_Pa annotation (
        Placement(visible = true, transformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product2 annotation (
        Placement(visible = true, transformation(origin = {30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain1(k = -10) annotation (
        Placement(visible = true, transformation(origin = {-6, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_AT_PNT_radps annotation (
        Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_AT_PNT_Nm annotation (
        Placement(visible = true, transformation(origin = {-110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Tanh tanh1 annotation (
        Placement(visible = true, transformation(origin = {30, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-36, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain3(k = 1 / 1000) annotation (
        Placement(visible = true, transformation(origin = {-74, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(gain3.y, firstOrder1.u) annotation (
        Line(points = {{-62, -40}, {-48, -40}, {-48, -40}, {-48, -40}}, color = {0, 0, 127}));
      connect(p_Line_Pa, gain3.u) annotation (
        Line(points = {{-110, -40}, {-86, -40}, {-86, -40}, {-86, -40}}, color = {0, 0, 127}));
      connect(nu_oil_m2ps, combiTable3D1.u2) annotation (
        Line(points = {{-110, -80}, {-10, -80}, {-10, -48}, {22, -48}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D1.u1) annotation (
        Line(points = {{-25, -40}, {22, -40}}, color = {0, 0, 127}));
      connect(tanh1.y, product2.u1) annotation (
        Line(points = {{42, 58}, {50, 58}, {50, 26}, {42, 26}, {42, 26}}, color = {0, 0, 127}));
      connect(gain1.y, tanh1.u) annotation (
        Line(points = {{6, 58}, {18, 58}, {18, 58}, {18, 58}}, color = {0, 0, 127}));
      connect(w_AT_PNT_radps, gain1.u) annotation (
        Line(points = {{-120, 80}, {-34, 80}, {-34, 58}, {-18, 58}, {-18, 58}}, color = {0, 0, 127}));
      connect(w_AT_PNT_radps, gain2.u) annotation (
        Line(points = {{-120, 80}, {-34, 80}, {-34, -20}, {-12, -20}, {-12, -20}}, color = {0, 0, 127}));
      connect(w_AT_PNT_radps, product1.u1) annotation (
        Line(points = {{-120, 80}, {62, 80}, {62, 26}, {68, 26}, {68, 26}}, color = {0, 0, 127}));
      connect(product2.y, trq_AT_PNT_Nm) annotation (
        Line(points = {{20, 20}, {-102, 20}, {-102, 20}, {-110, 20}}, color = {0, 0, 127}));
      connect(gain2.y, combiTable3D1.u) annotation (
        Line(points = {{13, -20}, {15, -20}, {15, -32}, {19, -32}, {19, -32}, {21, -32}}, color = {0, 0, 127}));
      connect(combiTable3D1.y, product2.u2) annotation (
        Line(points = {{46, -40}, {54, -40}, {54, 14}, {42, 14}, {42, 14}}, color = {0, 0, 127}));
      connect(combiTable3D1.y, product1.u2) annotation (
        Line(points = {{45, -40}, {54, -40}, {54, 14}, {68, 14}}, color = {0, 0, 127}));
      connect(product1.y, PHI_TM_PNT_OP_W) annotation (
        Line(points = {{91, 20}, {100, 20}, {100, -82}, {20, -82}, {20, -110}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(initialScale = 0.1), graphics={  Text(origin = {-2, 136}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(lineThickness = 0.75, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 25}, {100, -25}}), Ellipse(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Line(origin = {-78, 11}, points = {{-15, -2}, {-9, 2}, {-3, 2}, {3, -2}, {9, -2}, {15, 2}}, thickness = 0.15), Line(origin = {78, 10}, points = {{-14, 0}, {14, 0}}, thickness = 0.15), Line(rotation = -12, points = {{0, 50}, {0, -50}}, color = {160, 160, 160}), Line(rotation = 21, points = {{0, 50}, {0, -50}}, color = {220, 220, 220}), Line(rotation = 111, points = {{0, 50}, {0, -50}}, color = {220, 220, 220}), Line(rotation = 156, points = {{0, 50}, {0, -50}}, color = {220, 220, 220}), Line(rotation = 66, points = {{0, 50}, {0, -50}}, color = {220, 220, 220}), Line(rotation = 33, points = {{0, 50}, {0, -50}}, color = {160, 160, 160}), Line(rotation = 78, points = {{0, 50}, {0, -50}}, color = {160, 160, 160}), Line(rotation = 123, points = {{0, 50}, {0, -50}}, color = {160, 160, 160}), Line(points = {{0, 50}, {0, -50}}), Line(rotation = 45, points = {{0, 50}, {0, -50}}), Line(rotation = 135, points = {{0, 50}, {0, -50}}), Line(rotation = 90, points = {{0, 50}, {0, -50}}), Ellipse(fillColor = {144, 144, 144}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Line(origin = {-78, 0}, points = {{-15, -2}, {-9, 2}, {-3, 2}, {3, -2}, {9, -2}, {15, 2}}, thickness = 0.15), Line(origin = {-78, -11}, points = {{-15, -2}, {-9, 2}, {-3, 2}, {3, -2}, {9, -2}, {15, 2}}, thickness = 0.15), Line(origin = {78, 0}, points = {{-14, 0}, {14, 0}}, thickness = 0.15), Line(origin = {78, -10}, points = {{-14, 0}, {14, 0}}, thickness = 0.15), Text(origin = {-123, -58}, extent = {{-31, 6}, {25, -12}}, textString = "Oil_V"), Text(origin = {-123, -16}, extent = {{-37, 6}, {25, -12}}, textString = "Line_P"), Text(origin = {-131, 40}, extent = {{-3, 12}, {25, -12}}, textString = "T"), Text(origin = {-131, 112}, extent = {{-3, 12}, {25, -12}}, textString = "w"), Text(origin = {105, -62}, extent = {{-3, 12}, {49, -12}}, textString = "QfOP")}),
        uses(Modelica(version = "3.2.3")));
    end OilPump;

    model Clutch_AT_Gear
    extends Modelica.Blocks.Icons.Block;
      import SI = Modelica.Units.SI;
      extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a "Flange of left shaft" annotation (
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b "Flange of right shaft" annotation (
        Placement(transformation(extent = {{90, -10}, {110, 10}})));
      Modelica.Blocks.Interfaces.RealInput u(unit = "N.m") "Torque driving the two flanges (a positive value accelerates the flange)" annotation (
        Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-20, 100}, {20, 140}}, rotation = 270)));
      //
      Integer mode(start = Free, fixed = true);
      parameter SI.RotationalSpringConstant c(final min = 0, start = 1.0e5) "Spring constant";
      parameter SI.RotationalDampingConstant d(final min = 0, start = 0) "Damping constant";
      parameter Real hysteresis_rate = 0.95;
      parameter SI.AngularVelocity w_rel_threshold = 0.01;
      //
      /* Relative state between flange_a and flange_b */

      record RelativeState
        SI.Angle phi;
        SI.AngularVelocity w;
        SI.AngularAcceleration a;
      end RelativeState;

      /* State when the clutch is locked */

      record StateWhenLocked
        SI.Angle rel_phi;
        SI.AngularVelocity rel_w;
        SI.Torque tau;
      end StateWhenLocked;

      /* State when the clutch is released */

      record StateWhenReleased
        SI.Torque tau;
      end StateWhenReleased;

      //
      //
      RelativeState relativeState(phi, w(start = 0, stateSelect = stateSelect, nominal = if phi_nominal >= Modelica.Constants.eps then phi_nominal else 1) "Relative angular velocity (= der(phi_rel))", a(start = 0, fixed = false));
      StateWhenLocked stateWhenLocked(rel_phi(start = 0, fixed = true), rel_w(start = 0, fixed = true), tau(start = 0, fixed = true) "Torque during the clutch locked");
      StateWhenReleased stateWhenReleased(tau "Torque during the clutch locked");
      /*(start = 0, fixed = true)*/
      //
      SI.Torque tau_whenlocked(start = 0, fixed = false) "Torque when the clutch locked";
      SI.Torque tau_c "Spring torque";
      SI.Torque tau_d "Damping torque";
      SI.Torque preload;
      SI.Angle phi_preload;
    protected
      parameter Integer Free = 0;
      parameter Integer Sliding = 1;
      parameter Integer Locked = 2;
      parameter StateSelect stateSelect = StateSelect.prefer "Priority to use phi_rel and w_rel as states";
      parameter SI.Angle phi_nominal(displayUnit = "rad", min = 0.0) = 1e-4 "Nominal value of phi_rel (used for scaling)" annotation (
        Dialog(tab = "Advanced"));
    equation
      relativeState.phi = flange_a.phi - flange_b.phi;
      relativeState.w = der(relativeState.phi);
      relativeState.a = der(relativeState.w);
      //
      mode = if u < 1e-4 then Free elseif pre(mode) == Locked and u < abs(pre(stateWhenReleased.tau) * hysteresis_rate) then Sliding
       elseif abs(relativeState.w) < w_rel_threshold then Locked
       elseif pre(mode) == Locked then Locked else Sliding;
      //
      when mode == Locked then
        stateWhenLocked.tau = pre(u) * sign(relativeState.w);
        stateWhenLocked.rel_phi = relativeState.phi;
        stateWhenLocked.rel_w = relativeState.w;
      end when;
      // Memorize the values of state when the clutch is released
      if mode == Locked and u < abs(flange_a.tau) then
        stateWhenReleased.tau = flange_a.tau;
      else
        stateWhenReleased.tau = 0;
      end if;
      preload = stateWhenLocked.tau - stateWhenLocked.rel_w * d;
      //　ロック時のトルク負荷から、結合時の粘性抵抗を引いたトルク
      phi_preload = preload / c;
      //　上のトルクをばねレートで割った初期仮想ねじれ角
      tau_c = c * (relativeState.phi - stateWhenLocked.rel_phi);
      tau_d = d * relativeState.w;
      // モードごとのトルク計算
      if mode == Free or mode == Sliding then
        flange_a.tau = u * sign(relativeState.w);
        flange_b.tau = -u * sign(relativeState.w);
      else
        flange_a.tau = tau_whenlocked;
        flange_b.tau = -tau_whenlocked;
      end if;
      //
      tau_whenlocked = (relativeState.phi - stateWhenLocked.rel_phi + phi_preload) * c + relativeState.w * d;
      lossPower = abs(flange_a.tau * relativeState.w);
    end Clutch_AT_Gear;

    model TransmissionLoss
      constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
      parameter Real Oil_Viscosity_Breakpoint[:] = {4.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6};
      parameter String Loss_TorqueDependent_Filename_rev, Loss_TorqueDependent_Filename_1st, Loss_TorqueDependent_Filename_2nd, Loss_TorqueDependent_Filename_3rd, Loss_TorqueDependent_Filename_4th, Loss_TorqueDependent_Filename_5th, Loss_TorqueDependent_Filename_6th, Loss_TorqueDependent_Filename_7th, Loss_TorqueDependent_Filename_8th, Loss_TorqueDependent_Filename_9th;
      parameter String Loss_Omega_OilPressureDpendent_Filename_rev, Loss_Omega_OilPressureDpendent_Filename_1st, Loss_Omega_OilPressureDpendent_Filename_2nd, Loss_Omega_OilPressureDpendent_Filename_3rd, Loss_Omega_OilPressureDpendent_Filename_4th, Loss_Omega_OilPressureDpendent_Filename_5th, Loss_Omega_OilPressureDpendent_Filename_6th, Loss_Omega_OilPressureDpendent_Filename_7th, Loss_Omega_OilPressureDpendent_Filename_8th, Loss_Omega_OilPressureDpendent_Filename_9th;
      Modelica.Blocks.Interfaces.RealInput trq_inpupt_Nm annotation (
        Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 104}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput GearRatio annotation (
        Placement(visible = true, transformation(origin = {26, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
        Placement(visible = true, transformation(origin = {-120, -210}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -106}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
        Placement(visible = true, transformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -36}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_input_rpm annotation (
        Placement(visible = true, transformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 34}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput LossTorque annotation (
        Placement(visible = true, transformation(origin = {190, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D1(filename = Loss_TorqueDependent_Filename_rev, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, 6}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D2(filename = Loss_TorqueDependent_Filename_1st, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D3(filename = Loss_TorqueDependent_Filename_2nd, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D4(filename = Loss_TorqueDependent_Filename_3rd, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D5(filename = Loss_TorqueDependent_Filename_4th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D6(filename = Loss_TorqueDependent_Filename_5th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -94}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D7(filename = Loss_TorqueDependent_Filename_6th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -114}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D8(filename = Loss_TorqueDependent_Filename_7th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -134}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D9(filename = Loss_TorqueDependent_Filename_8th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -154}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D10(filename = Loss_TorqueDependent_Filename_9th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-52, -174}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D11(filename = Loss_Omega_OilPressureDpendent_Filename_rev, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D12(filename = Loss_Omega_OilPressureDpendent_Filename_1st, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -24}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D13(filename = Loss_Omega_OilPressureDpendent_Filename_2nd, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D14(filename = Loss_Omega_OilPressureDpendent_Filename_3rd, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D15(filename = Loss_Omega_OilPressureDpendent_Filename_4th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D16(filename = Loss_Omega_OilPressureDpendent_Filename_5th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -104}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D17(filename = Loss_Omega_OilPressureDpendent_Filename_6th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -124}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D18(filename = Loss_Omega_OilPressureDpendent_Filename_7th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -144}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D19(filename = Loss_Omega_OilPressureDpendent_Filename_8th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -164}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D20(filename = Loss_Omega_OilPressureDpendent_Filename_9th, z_ax = Oil_Viscosity_Breakpoint) annotation (
        Placement(visible = true, transformation(origin = {-20, -184}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product1 annotation (
        Placement(visible = true, transformation(origin = {50, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add1 annotation (
        Placement(visible = true, transformation(origin = {4, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product2 annotation (
        Placement(visible = true, transformation(origin = {50, -16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add2 annotation (
        Placement(visible = true, transformation(origin = {4, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product3 annotation (
        Placement(visible = true, transformation(origin = {50, -36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add3 annotation (
        Placement(visible = true, transformation(origin = {4, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product4 annotation (
        Placement(visible = true, transformation(origin = {50, -56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add4 annotation (
        Placement(visible = true, transformation(origin = {4, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product5 annotation (
        Placement(visible = true, transformation(origin = {50, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add5 annotation (
        Placement(visible = true, transformation(origin = {4, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product6 annotation (
        Placement(visible = true, transformation(origin = {50, -96}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add6 annotation (
        Placement(visible = true, transformation(origin = {4, -100}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product7 annotation (
        Placement(visible = true, transformation(origin = {50, -116}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add7 annotation (
        Placement(visible = true, transformation(origin = {4, -120}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product8 annotation (
        Placement(visible = true, transformation(origin = {50, -136}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add8 annotation (
        Placement(visible = true, transformation(origin = {4, -140}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add9 annotation (
        Placement(visible = true, transformation(origin = {4, -160}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product9 annotation (
        Placement(visible = true, transformation(origin = {50, -156}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Product product10 annotation (
        Placement(visible = true, transformation(origin = {50, -176}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Add add10 annotation (
        Placement(visible = true, transformation(origin = {4, -180}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder3(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-85, -210}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder4(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-85, -140}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Math.MultiSum multiSum1(nu = 10) annotation (
        Placement(visible = true, transformation(origin = {100, -8}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder5(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {160, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-85, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-85, -70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
        Placement(visible = true, transformation(origin = {132, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Control.GearSelector gearSelector annotation (
        Placement(visible = true, transformation(origin = {26, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(GearRatio, gearSelector.GearRatio) annotation (
        Line(points = {{26, 120}, {26, 120}, {26, 72}, {26, 72}}, color = {0, 0, 127}));
      connect(gearSelector.GearSelectSignal[1], product1.u1) annotation (
        Line(points = {{26, 49}, {26, 8}, {42, 8}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[2], product2.u1) annotation (
        Line(points = {{26, 49}, {26, -12}, {42, -12}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[3], product3.u1) annotation (
        Line(points = {{26, 49}, {26, -32}, {42, -32}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[4], product4.u1) annotation (
        Line(points = {{26, 49}, {26, -52}, {42, -52}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[5], product5.u1) annotation (
        Line(points = {{26, 49}, {26, -72}, {42, -72}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[6], product6.u1) annotation (
        Line(points = {{26, 49}, {26, -92}, {42, -92}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[7], product7.u1) annotation (
        Line(points = {{26, 49}, {26, -112}, {42, -112}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[8], product8.u1) annotation (
        Line(points = {{26, 49}, {26, -132}, {42, -132}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[9], product9.u1) annotation (
        Line(points = {{26, 49}, {26, -152}, {42, -152}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gearSelector.GearSelectSignal[10], product10.u1) annotation (
        Line(points = {{26, 49}, {26, -172}, {42, -172}}, color = {0, 0, 127}, thickness = 0.5));
      connect(gain1.y, firstOrder5.u) annotation (
        Line(points = {{138, -8}, {152, -8}, {152, -8}, {152, -8}}, color = {0, 0, 127}));
      connect(multiSum1.y, gain1.u) annotation (
        Line(points = {{112, -8}, {124, -8}, {124, -8}, {124, -8}}, color = {0, 0, 127}));
      connect(product2.y, multiSum1.u[2]) annotation (
        Line(points = {{56, -16}, {70, -16}, {70, 2}, {90, 2}, {90, -8}}, color = {0, 0, 127}));
      connect(product1.y, multiSum1.u[1]) annotation (
        Line(points = {{56, 4}, {90, 4}, {90, -8}}, color = {0, 0, 127}));
      connect(product3.y, multiSum1.u[3]) annotation (
        Line(points = {{56, -36}, {72, -36}, {72, 0}, {90, 0}, {90, -8}}, color = {0, 0, 127}));
      connect(product4.y, multiSum1.u[4]) annotation (
        Line(points = {{56, -56}, {74, -56}, {74, -2}, {90, -2}, {90, -8}}, color = {0, 0, 127}));
      connect(product5.y, multiSum1.u[5]) annotation (
        Line(points = {{56, -76}, {76, -76}, {76, -4}, {90, -4}, {90, -8}}, color = {0, 0, 127}));
      connect(product6.y, multiSum1.u[6]) annotation (
        Line(points = {{56, -96}, {78, -96}, {78, -6}, {90, -6}, {90, -8}}, color = {0, 0, 127}));
      connect(product7.y, multiSum1.u[7]) annotation (
        Line(points = {{56, -116}, {80, -116}, {80, -8}, {90, -8}}, color = {0, 0, 127}));
      connect(product8.y, multiSum1.u[8]) annotation (
        Line(points = {{56, -136}, {82, -136}, {82, -10}, {90, -10}, {90, -8}}, color = {0, 0, 127}));
      connect(product9.y, multiSum1.u[9]) annotation (
        Line(points = {{56, -156}, {84, -156}, {84, -12}, {90, -12}, {90, -8}}, color = {0, 0, 127}));
      connect(product10.y, multiSum1.u[10]) annotation (
        Line(points = {{56, -176}, {86, -176}, {86, -14}, {90, -14}, {90, -8}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D20.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -180}, {-28, -180}, {-28, -180}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D19.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -160}, {-28, -160}, {-28, -160}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D18.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -140}, {-28, -140}, {-28, -140}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D17.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -118}, {-28, -118}, {-28, -120}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D16.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -98}, {-28, -98}, {-28, -100}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D15.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -78}, {-28, -78}, {-28, -80}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D14.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -58}, {-28, -58}, {-28, -60}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D13.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -38}, {-28, -38}, {-28, -40}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D12.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -20}, {-28, -20}, {-28, -20}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D11.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, 0}, {-28, 0}, {-28, 0}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D10.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -168}, {-60, -168}, {-60, -170}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D9.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -148}, {-60, -148}, {-60, -150}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D8.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -128}, {-60, -128}, {-60, -130}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D7.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -108}, {-60, -108}, {-60, -110}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D6.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -88}, {-60, -88}, {-60, -90}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D5.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -68}, {-60, -68}, {-60, -70}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D4.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -48}, {-60, -48}, {-60, -50}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D3.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -28}, {-60, -28}, {-60, -30}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D2.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, -8}, {-60, -8}, {-60, -10}}, color = {0, 0, 127}));
      connect(firstOrder2.y, combiTable3D1.u) annotation (
        Line(points = {{-80, -70}, {-74, -70}, {-74, 11}, {-59, 11}}, color = {0, 0, 127}));
      connect(w_input_rpm, firstOrder2.u) annotation (
        Line(points = {{-120, -70}, {-92, -70}, {-92, -70}, {-90, -70}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D10.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -174}, {-60, -174}, {-60, -174}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D9.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -154}, {-60, -154}, {-60, -154}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D8.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -134}, {-60, -134}, {-60, -134}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D7.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -114}, {-60, -114}, {-60, -114}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D6.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -94}, {-60, -94}, {-60, -94}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D5.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -74}, {-60, -74}, {-60, -74}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D4.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -54}, {-60, -54}, {-60, -54}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D3.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -34}, {-60, -34}, {-60, -34}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D2.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, -14}, {-60, -14}, {-60, -14}, {-60, -14}}, color = {0, 0, 127}));
      connect(firstOrder1.y, combiTable3D1.u1) annotation (
        Line(points = {{-80, 0}, {-70, 0}, {-70, 6}, {-60, 6}}, color = {0, 0, 127}));
      connect(trq_inpupt_Nm, firstOrder1.u) annotation (
        Line(points = {{-120, 0}, {-92, 0}, {-92, 0}, {-90, 0}}, color = {0, 0, 127}));
      connect(firstOrder5.y, LossTorque) annotation (
        Line(points = {{166, -8}, {182, -8}, {182, -8}, {190, -8}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D16.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -104}, {-28, -104}, {-28, -104}}, color = {0, 0, 127}));
      connect(add10.y, product10.u2) annotation (
        Line(points = {{10, -180}, {42, -180}, {42, -180}, {42, -180}}, color = {0, 0, 127}));
      connect(add9.y, product9.u2) annotation (
        Line(points = {{10, -160}, {42, -160}, {42, -160}, {42, -160}}, color = {0, 0, 127}));
      connect(add8.y, product8.u2) annotation (
        Line(points = {{10, -140}, {42, -140}, {42, -140}, {42, -140}}, color = {0, 0, 127}));
      connect(add7.y, product7.u2) annotation (
        Line(points = {{10, -120}, {42, -120}, {42, -120}, {42, -120}}, color = {0, 0, 127}));
      connect(add6.y, product6.u2) annotation (
        Line(points = {{10, -100}, {42, -100}, {42, -100}, {42, -100}}, color = {0, 0, 127}));
      connect(add5.y, product5.u2) annotation (
        Line(points = {{10, -80}, {42, -80}, {42, -80}, {42, -80}}, color = {0, 0, 127}));
      connect(add4.y, product4.u2) annotation (
        Line(points = {{10, -60}, {42, -60}, {42, -60}, {42, -60}}, color = {0, 0, 127}));
      connect(add3.y, product3.u2) annotation (
        Line(points = {{10, -40}, {42, -40}, {42, -40}, {42, -40}}, color = {0, 0, 127}));
      connect(add2.y, product2.u2) annotation (
        Line(points = {{10, -20}, {42, -20}, {42, -20}, {42, -20}}, color = {0, 0, 127}));
      connect(add1.y, product1.u2) annotation (
        Line(points = {{10, 0}, {42, 0}, {42, 0}, {42, 0}}, color = {0, 0, 127}));
      connect(combiTable3D10.y, add10.u1) annotation (
        Line(points = {{-46, -174}, {-10, -174}, {-10, -176}, {-4, -176}, {-4, -176}}, color = {0, 0, 127}));
      connect(combiTable3D9.y, add9.u1) annotation (
        Line(points = {{-46, -154}, {-10, -154}, {-10, -156}, {-4, -156}, {-4, -156}}, color = {0, 0, 127}));
      connect(combiTable3D8.y, add8.u1) annotation (
        Line(points = {{-46, -134}, {-10, -134}, {-10, -136}, {-4, -136}, {-4, -136}}, color = {0, 0, 127}));
      connect(combiTable3D7.y, add7.u1) annotation (
        Line(points = {{-46, -114}, {-10, -114}, {-10, -116}, {-4, -116}, {-4, -116}}, color = {0, 0, 127}));
      connect(combiTable3D6.y, add6.u1) annotation (
        Line(points = {{-46, -94}, {-10, -94}, {-10, -96}, {-4, -96}, {-4, -96}}, color = {0, 0, 127}));
      connect(combiTable3D5.y, add5.u1) annotation (
        Line(points = {{-46, -74}, {-10, -74}, {-10, -76}, {-4, -76}, {-4, -76}}, color = {0, 0, 127}));
      connect(combiTable3D4.y, add4.u1) annotation (
        Line(points = {{-46, -54}, {-10, -54}, {-10, -56}, {-4, -56}, {-4, -56}}, color = {0, 0, 127}));
      connect(combiTable3D1.y, add1.u1) annotation (
        Line(points = {{-45.4, 6}, {-9.4, 6}, {-9.4, 4}, {-2.4, 4}}, color = {0, 0, 127}));
      connect(combiTable3D3.y, add3.u1) annotation (
        Line(points = {{-46, -34}, {-10, -34}, {-10, -36}, {-4, -36}, {-4, -36}}, color = {0, 0, 127}));
      connect(combiTable3D2.y, add2.u1) annotation (
        Line(points = {{-46, -14}, {-10, -14}, {-10, -16}, {-4, -16}, {-4, -16}}, color = {0, 0, 127}));
      connect(combiTable3D12.y, add2.u2) annotation (
        Line(points = {{-14, -24}, {-4, -24}, {-4, -24}, {-4, -24}}, color = {0, 0, 127}));
      connect(combiTable3D13.y, add3.u2) annotation (
        Line(points = {{-14, -44}, {-14, -44}, {-14, -44}, {-4, -44}, {-4, -44}}, color = {0, 0, 127}));
      connect(combiTable3D14.y, add4.u2) annotation (
        Line(points = {{-14, -64}, {-12, -64}, {-12, -64}, {-4, -64}, {-4, -64}}, color = {0, 0, 127}));
      connect(combiTable3D15.y, add5.u2) annotation (
        Line(points = {{-14, -84}, {-4, -84}, {-4, -84}, {-4, -84}}, color = {0, 0, 127}));
      connect(combiTable3D16.y, add6.u2) annotation (
        Line(points = {{-14, -104}, {-4, -104}, {-4, -104}, {-4, -104}}, color = {0, 0, 127}));
      connect(combiTable3D17.y, add7.u2) annotation (
        Line(points = {{-14, -124}, {-4, -124}, {-4, -124}, {-4, -124}}, color = {0, 0, 127}));
      connect(combiTable3D18.y, add8.u2) annotation (
        Line(points = {{-14, -144}, {-4, -144}, {-4, -144}, {-4, -144}}, color = {0, 0, 127}));
      connect(combiTable3D19.y, add9.u2) annotation (
        Line(points = {{-14, -164}, {-4, -164}, {-4, -164}, {-4, -164}}, color = {0, 0, 127}));
      connect(combiTable3D20.y, add10.u2) annotation (
        Line(points = {{-14, -184}, {-4, -184}, {-4, -184}, {-4, -184}, {-4, -184}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D20.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -184}, {-28, -184}, {-28, -184}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D19.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -164}, {-28, -164}, {-28, -164}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D18.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -144}, {-28, -144}, {-28, -144}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D17.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -124}, {-28, -124}, {-28, -124}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D15.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -84}, {-28, -84}, {-28, -84}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D14.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -64}, {-28, -64}, {-28, -64}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D13.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -44}, {-28, -44}, {-28, -44}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D12.u1) annotation (
        Line(points = {{-80, -210}, {-38, -210}, {-38, -24}, {-28, -24}, {-28, -24}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D20.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -190}, {-28, -190}, {-28, -188}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D19.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -168}, {-28, -168}, {-28, -168}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D18.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -148}, {-28, -148}, {-28, -148}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D17.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -128}, {-28, -128}, {-28, -128}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D16.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -108}, {-28, -108}, {-28, -108}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D15.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -88}, {-28, -88}, {-28, -88}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D14.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -68}, {-28, -68}, {-28, -68}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D13.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -48}, {-28, -48}, {-28, -48}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D12.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -28}, {-28, -28}, {-28, -28}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D10.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -178}, {-60, -178}, {-60, -178}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D9.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -158}, {-60, -158}, {-60, -158}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D8.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -138}, {-60, -138}, {-60, -138}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D7.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -118}, {-60, -118}, {-60, -118}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D6.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -98}, {-60, -98}, {-60, -98}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D5.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -78}, {-60, -78}, {-60, -78}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D4.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -58}, {-60, -58}, {-60, -58}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D3.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -38}, {-60, -38}, {-60, -38}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D2.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -18}, {-60, -18}, {-60, -18}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D11.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -8}, {-28, -8}, {-28, -8}}, color = {0, 0, 127}));
      connect(firstOrder4.y, combiTable3D1.u2) annotation (
        Line(points = {{-80, -140}, {-66, -140}, {-66, 2}, {-60, 2}, {-60, 2}}, color = {0, 0, 127}));
      connect(combiTable3D11.y, add1.u2) annotation (
        Line(points = {{-13.4, -4}, {-2.4, -4}}, color = {0, 0, 127}));
      connect(firstOrder3.y, combiTable3D11.u1) annotation (
        Line(points = {{-79.5, -210}, {-38, -210}, {-38, -4}, {-27, -4}}, color = {0, 0, 127}));
      connect(nu_oil_m2ps, firstOrder4.u) annotation (
        Line(points = {{-120, -140}, {-90, -140}, {-90, -140}, {-90, -140}}, color = {0, 0, 127}));
      connect(p_line_Pa, firstOrder3.u) annotation (
        Line(points = {{-120, -210}, {-106, -210}, {-106, -210}, {-92, -210}, {-92, -210}, {-91, -210}, {-91, -210}, {-90.5, -210}, {-90.5, -210}, {-90, -210}}, color = {0, 0, 127}));
      annotation (
        Diagram(coordinateSystem(extent = {{-200, -320}, {280, 200}})),
        __OpenModelica_commandLineOptions = "",
        Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
    end TransmissionLoss;

    model FinalGear
      parameter Real GearRatio = 3.066;
      parameter Modelica.Units.SI.Inertia Jdf = 0.01;
      parameter Modelica.Units.SI.RotationalSpringConstant c = 1e5;
      parameter Modelica.Units.SI.RotationalDampingConstant d = 1e3;
      parameter Real Oil_Viscosity_Breakpoint[:] = {12.4e-6, 20.4e-6, 37.7e-6, 82.0e-6, 223.4e-6};
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jdf) annotation (
        Placement(visible = true, transformation(origin = {-84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = c, d = d, phi_rel(fixed = true), w_rel(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {172, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
        Placement(visible = true, transformation(origin = {-300, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_AT_Gear_Nm annotation (
        Placement(visible = true, transformation(origin = {-300, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_AT_Gear_radps annotation (
        Placement(visible = true, transformation(origin = {-290, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_DF_Nm annotation (
        Placement(visible = true, transformation(origin = {250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_TM_PNT_DF_radps annotation (
        Placement(visible = true, transformation(origin = {260, 30}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1(use_a = false, use_w = true) annotation (
        Placement(visible = true, transformation(origin = {-242, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor1(use_a = false, use_w = false) annotation (
        Placement(visible = true, transformation(origin = {202, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Qf_DF_PNT_W annotation (
        Placement(visible = true, transformation(origin = {250, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain2(k = -1) annotation (
        Placement(visible = true, transformation(origin = {-266, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator1(k = 1, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {226, 30}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain3(k = -1) annotation (
        Placement(visible = true, transformation(origin = {226, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_DoubleRowAngular D_AGB1(BRG_Friction_Filename = "D_AGB1.txt") annotation (
        Placement(visible = true, transformation(origin = {-168, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_DoubleRowAngular D_AGB2(BRG_Friction_Filename = "D_AGB2.txt") annotation (
        Placement(visible = true, transformation(origin = {-122, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.HypoidGear hypoidGear(GearRatio = GearRatio, Gear_K_Filename = "DF_LoadK.txt", LoadLossFilename = "DF_LoadLoss.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, StirringLossFilename = "DF_StirringLoss.txt") annotation (
        Placement(visible = true, transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_Taper D_TRB2(BRG_Friction_Filename = "D_TRB2.txt") annotation (
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal D_OS2(OilSeal_friction_filename = "D_OS2.txt") annotation (
        Placement(visible = true, transformation(origin = {130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
        Placement(visible = true, transformation(origin = {4, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal D_OS1(OilSeal_friction_filename = "D_OS1.txt") annotation (
        Placement(visible = true, transformation(origin = {36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_Taper D_TRB1(BRG_Friction_Filename = "D_TRB1.txt") annotation (
        Placement(visible = true, transformation(origin = {4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
        Placement(visible = true, transformation(origin = {36, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed2 annotation (
        Placement(visible = true, transformation(origin = {96, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed3 annotation (
        Placement(visible = true, transformation(origin = {130, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum multiSum(nu = 8) annotation (
        Placement(visible = true, transformation(origin = {174, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.BrgLoadDistribution_DF_A1A2 LoadDistribution_A1A2(D = 56.92798, Y1 = 1.24, Y2 = 1.24, a = 36.38, alpha_AGB1 = -13.317, alpha_AGB2 = -13.317, b = 51.87, beta_AGB1 = 2266.3, beta_AGB2 = 2266.3) annotation (
        Placement(visible = true, transformation(origin = {-101, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.BrgLoadDistribution_DF_T1T2 LoadDistribution_T1T2(D = 147.9573, Y1 = 1.10, Y2 = 1.10, alpha_TRB1 = -63.136, alpha_TRB2 = -63.136, beta_TRB1 = 6329.4, beta_TRB2 = 6329.4, c = 85.16, d = 79.225) annotation (
        Placement(visible = true, transformation(origin = {-39, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput t_trans_fluid_K annotation (
        Placement(visible = true, transformation(origin = {-300, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Math.UnitConversions.To_degC to_degC annotation (
        Placement(visible = true, transformation(origin = {-210, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal D_OS3(OilSeal_friction_filename = "D_OS3.txt") annotation (
        Placement(visible = true, transformation(origin = {-214, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed4 annotation (
        Placement(visible = true, transformation(origin = {-214, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed5 annotation (
        Placement(visible = true, transformation(origin = {-122, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Fixed fixed6 annotation (
        Placement(visible = true, transformation(origin = {-168, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
      connect(w_TM_PNT_DF_radps, integrator1.u) annotation (
        Line(points = {{260, 30}, {233, 30}}, color = {0, 0, 127}));
      connect(gain3.y, trq_TM_PNT_DF_Nm) annotation (
        Line(points = {{233, -30}, {250, -30}}, color = {0, 0, 127}));
      connect(gain2.y, torqueToAngleAdaptor1.tau) annotation (
        Line(points = {{-259, -30}, {-252, -30}, {-252, -8}, {-245, -8}}, color = {0, 0, 127}));
      connect(trq_TM_PNT_AT_Gear_Nm, gain2.u) annotation (
        Line(points = {{-300, -30}, {-273, -30}}, color = {0, 0, 127}));
      connect(springDamper1.flange_b, angleToTorqueAdaptor1.flange) annotation (
        Line(points = {{182, 0}, {200, 0}}));
      connect(torqueToAngleAdaptor1.w, w_TM_PNT_AT_Gear_radps) annotation (
        Line(points = {{-245, 5}, {-252, 5}, {-252, 30}, {-290, 30}}, color = {0, 0, 127}));
      connect(integrator1.y, angleToTorqueAdaptor1.phi) annotation (
        Line(points = {{219, 30}, {210, 30}, {210, 8}, {205, 8}}, color = {0, 0, 127}));
      connect(angleToTorqueAdaptor1.tau, gain3.u) annotation (
        Line(points = {{205, -8}, {210, -8}, {210, -30}, {219, -30}}, color = {0, 0, 127}));
      connect(D_TRB2.flange_b, D_OS2.flange_a) annotation (
        Line(points = {{106, 0}, {120, 0}}));
      connect(D_TRB1.support, fixed.flange) annotation (
        Line(points = {{4, -10}, {4, -20}}));
      connect(fixed1.flange, D_OS1.support) annotation (
        Line(points = {{36, -20}, {36, -10}}));
      connect(fixed2.flange, D_TRB2.support) annotation (
        Line(points = {{96, -20}, {96, -10}}));
      connect(fixed3.flange, D_OS2.support) annotation (
        Line(points = {{130, -20}, {130, -10}}));
      connect(D_OS2.flange_b, springDamper1.flange_a) annotation (
        Line(points = {{140, 0}, {162, 0}}));
      connect(D_TRB1.flange_b, D_OS1.flange_a) annotation (
        Line(points = {{14, 0}, {26, 0}}));
      connect(inertia1.flange_b, hypoidGear.pinion) annotation (
        Line(points = {{-74, 0}, {-56, 0}}));
      connect(D_AGB2.flange_b, inertia1.flange_a) annotation (
        Line(points = {{-112, 0}, {-94, 0}}));
      connect(hypoidGear.nu_oil_m2ps, nu_oil_m2ps) annotation (
        Line(points = {{-58, -6}, {-64, -6}, {-64, -70}, {-300, -70}}, color = {0, 255, 0}));
      connect(D_AGB2.nu_oil_m2ps, nu_oil_m2ps) annotation (
        Line(points = {{-134, -6}, {-140, -6}, {-140, -70}, {-300, -70}}, color = {0, 255, 0}));
      connect(D_AGB1.nu_oil_m2ps, nu_oil_m2ps) annotation (
        Line(points = {{-180, -6}, {-186, -6}, {-186, -70}, {-300, -70}}, color = {0, 255, 0}));
      connect(multiSum.y, Qf_DF_PNT_W) annotation (
        Line(points = {{186, -80}, {250, -80}}, color = {191, 0, 0}));
      connect(hypoidGear.PHI_W, multiSum.u[1]) annotation (
        Line(points = {{-35, -8}, {-30, -8}, {-30, -80}, {164, -80}}, color = {191, 0, 0}));
      connect(D_AGB1.PHI_W, multiSum.u[2]) annotation (
        Line(points = {{-157, -8}, {-152, -8}, {-152, -80}, {164, -80}}, color = {191, 0, 0}));
      connect(D_AGB2.PHI_W, multiSum.u[3]) annotation (
        Line(points = {{-111, -8}, {-106, -8}, {-106, -80}, {164, -80}}, color = {191, 0, 0}));
      connect(D_TRB1.PHI_W, multiSum.u[4]) annotation (
        Line(points = {{15, -8}, {20, -8}, {20, -80}, {164, -80}}, color = {191, 0, 0}));
      connect(D_OS1.PHI_W, multiSum.u[5]) annotation (
        Line(points = {{47, -8}, {52, -8}, {52, -80}, {164, -80}}, color = {191, 0, 0}));
      connect(D_TRB2.PHI_W, multiSum.u[6]) annotation (
        Line(points = {{107, -8}, {112, -8}, {112, -80}, {164, -80}}, color = {191, 0, 0}));
      connect(D_OS2.PHI_W, multiSum.u[7]) annotation (
        Line(points = {{141, -8}, {146, -8}, {146, -80}, {164, -80}}, color = {191, 0, 0}));
      connect(D_TRB1.nu_oil_m2ps, nu_oil_m2ps) annotation (
        Line(points = {{-8, -6}, {-14, -6}, {-14, -70}, {-300, -70}}, color = {0, 255, 0}));
      connect(D_TRB2.nu_oil_m2ps, nu_oil_m2ps) annotation (
        Line(points = {{84, -6}, {76, -6}, {76, -70}, {-300, -70}}, color = {0, 255, 0}));
      connect(hypoidGear.ring, D_TRB1.flange_a) annotation (
        Line(points = {{-36, 0}, {-6, 0}}));
      connect(D_OS1.flange_b, D_TRB2.flange_a) annotation (
        Line(points = {{46, 0}, {86, 0}}));
      connect(D_AGB1.flange_b, D_AGB2.flange_a) annotation (
        Line(points = {{-158, 0}, {-134, 0}, {-134, 0}, {-132, 0}}));
      connect(hypoidGear.GearLoad, LoadDistribution_A1A2.GearLoad) annotation (
        Line(points = {{-35, 5}, {-30, 5}, {-30, 30}, {-70, 30}, {-70, 65}, {-83, 65}}, color = {255, 85, 0}, thickness = 0.5));
      connect(LoadDistribution_A1A2.F_AGB1[1], D_AGB1.Fr) annotation (
        Line(points = {{-117.5, 71}, {-186, 71}, {-186, 30}, {-170, 30}, {-170, 12}}, color = {0, 255, 0}));
      connect(LoadDistribution_A1A2.F_AGB1[2], D_AGB1.Fth) annotation (
        Line(points = {{-117.5, 71}, {-186, 71}, {-186, 8}, {-180, 8}}, color = {0, 255, 0}));
      connect(LoadDistribution_A1A2.F_AGB2[1], D_AGB2.Fr) annotation (
        Line(points = {{-117.5, 59}, {-140, 59}, {-140, 30}, {-124, 30}, {-124, 12}}, color = {0, 255, 0}));
      connect(LoadDistribution_A1A2.F_AGB2[2], D_AGB2.Fth) annotation (
        Line(points = {{-117.5, 59}, {-140, 59}, {-140, 8}, {-134, 8}}, color = {0, 255, 0}));
      connect(LoadDistribution_T1T2.F_TRB2[1], D_TRB2.Fr) annotation (
        Line(points = {{-22.5, 59}, {76, 59}, {76, 30}, {94, 30}, {94, 12}}, color = {0, 255, 0}));
      connect(LoadDistribution_T1T2.F_TRB2[2], D_TRB2.Fth) annotation (
        Line(points = {{-22.5, 59}, {76, 59}, {76, 8}, {84, 8}}, color = {0, 255, 0}));
      connect(LoadDistribution_T1T2.F_TRB1[1], D_TRB1.Fr) annotation (
        Line(points = {{-22.5, 71}, {-14, 71}, {-14, 30}, {2, 30}, {2, 12}}, color = {0, 255, 0}));
      connect(LoadDistribution_T1T2.F_TRB1[2], D_TRB1.Fth) annotation (
        Line(points = {{-22.5, 71}, {-14, 71}, {-14, 8}, {-8, 8}}, color = {0, 255, 0}));
      connect(LoadDistribution_T1T2.GearLoad, hypoidGear.GearLoad) annotation (
        Line(points = {{-57, 65}, {-70, 65}, {-70, 30}, {-30, 30}, {-30, 5}, {-35, 5}}, color = {255, 85, 0}, thickness = 0.5));
      connect(t_trans_fluid_K, to_degC.u) annotation (
        Line(points = {{-300, 90}, {-222, 90}}, color = {0, 0, 127}));
      connect(to_degC.y, LoadDistribution_A1A2.Toil) annotation (
        Line(points = {{-198, 90}, {-100, 90}, {-100, 84}, {-100, 84}}, color = {0, 0, 127}));
      connect(to_degC.y, LoadDistribution_T1T2.Toil) annotation (
        Line(points = {{-198, 90}, {-38, 90}, {-38, 84}, {-38, 84}}, color = {0, 0, 127}));
      connect(torqueToAngleAdaptor1.flange, D_OS3.flange_a) annotation (
        Line(points = {{-240, 0}, {-224, 0}, {-224, 0}, {-224, 0}}));
      connect(fixed4.flange, D_OS3.support) annotation (
        Line(points = {{-214, -20}, {-214, -20}, {-214, -10}, {-214, -10}}));
      connect(D_OS3.flange_b, D_AGB1.flange_a) annotation (
        Line(points = {{-204, 0}, {-178, 0}, {-178, 0}, {-178, 0}}));
      connect(D_OS3.PHI_W, multiSum.u[8]) annotation (
        Line(points = {{-202, -8}, {-198, -8}, {-198, -80}, {164, -80}, {164, -80}}, color = {191, 0, 0}));
      connect(D_AGB2.support, fixed5.flange) annotation (
        Line(points = {{-122, -10}, {-122, -10}, {-122, -20}, {-122, -20}}));
      connect(D_AGB1.support, fixed6.flange) annotation (
        Line(points = {{-168, -10}, {-168, -10}, {-168, -20}, {-168, -20}}));
      annotation (
        Icon(coordinateSystem(extent = {{-100, -160}, {100, 100}}, initialScale = 0.1), graphics={  Text(origin = {0, -180}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -160}}), Rectangle(origin = {1, 10}, extent = {{-13, 36}, {13, -50}}), Rectangle(origin = {2, -62}, extent = {{-14, -30}, {12, 22}}), Line(origin = {-32.25, 2.66667}, points = {{19, 0}, {-19, 0}}), Line(origin = {27.75, -63.3333}, points = {{-15, 0}, {15, 0}}), Text(origin = {134, -82}, extent = {{-36, 10}, {20, -10}}, textString = "QfDF"), Text(origin = {130, -24}, extent = {{-40, 20}, {20, -10}}, textString = "T"), Text(origin = {130, 72}, extent = {{-40, 20}, {20, -10}}, textString = "w"), Text(origin = {-110, 62}, extent = {{-40, 20}, {20, -10}}, textString = "w"), Text(origin = {-110, -16}, extent = {{-40, 20}, {20, -10}}, textString = "T"), Text(origin = {-124, -78}, extent = {{-82, 22}, {20, -10}}, textString = "Oil Viscosity"), Text(origin = {-120, -130}, extent = {{-60, 10}, {20, -10}}, textString = "ToutOil")}),
        uses(Modelica(version = "3.2.3")),
        Diagram(coordinateSystem(extent = {{-280, -100}, {240, 100}}, initialScale = 0.1), graphics={  Text(origin = {20, 24}, extent = {{-16, 8}, {16, -8}}, textString = "L側"), Text(origin = {114, 24}, extent = {{-16, 8}, {16, -8}}, textString = "R側")}),
        __OpenModelica_commandLineOptions = "",
        version = "");
    end FinalGear;

    model DriveShaft
      parameter Modelica.Units.SI.Inertia Jds = 0.01;
      parameter Modelica.Units.SI.RotationalSpringConstant c = 1e4;
      parameter Modelica.Units.SI.RotationalDampingConstant d = 1e3;
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jds) annotation (
        Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_DF_Nm annotation (
        Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_DF_radps annotation (
        Placement(visible = true, transformation(origin = {-110, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput trq_DS_PNT_out_Nm annotation (
        Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput w_DS_PNT_out_radps annotation (
        Placement(visible = true, transformation(origin = {120, 30}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = c, d = d, phi_rel(fixed = true, start = 0), w_rel(fixed = true, start = 0)) annotation (
        Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1(use_a = false, use_w = true) annotation (
        Placement(visible = true, transformation(origin = {-62, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor1(use_a = false, use_w = false) annotation (
        Placement(visible = true, transformation(origin = {52, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator1(k = 1, y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {80, 30}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
        Placement(visible = true, transformation(origin = {-84, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain2(k = -1) annotation (
        Placement(visible = true, transformation(origin = {82, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(gain2.y, trq_DS_PNT_out_Nm) annotation (
        Line(points = {{88, -30}, {102, -30}, {102, -30}, {110, -30}}, color = {0, 0, 127}));
      connect(angleToTorqueAdaptor1.tau, gain2.u) annotation (
        Line(points = {{56, -8}, {66, -8}, {66, -30}, {74, -30}, {74, -30}}, color = {0, 0, 127}));
      connect(gain1.y, torqueToAngleAdaptor1.tau) annotation (
        Line(points = {{-78, -30}, {-72, -30}, {-72, -8}, {-66, -8}, {-66, -8}}, color = {0, 0, 127}));
      connect(trq_TM_PNT_DF_Nm, gain1.u) annotation (
        Line(points = {{-120, -30}, {-92, -30}, {-92, -30}, {-92, -30}}, color = {0, 0, 127}));
      connect(angleToTorqueAdaptor1.phi, integrator1.y) annotation (
        Line(points = {{56, 8}, {66, 8}, {66, 30}, {73, 30}}, color = {0, 0, 127}));
      connect(integrator1.u, w_DS_PNT_out_radps) annotation (
        Line(points = {{87, 30}, {120, 30}}, color = {0, 0, 127}));
      connect(springDamper1.flange_b, angleToTorqueAdaptor1.flange) annotation (
        Line(points = {{30, 0}, {50, 0}, {50, 0}, {50, 0}}));
      connect(w_TM_PNT_DF_radps, torqueToAngleAdaptor1.w) annotation (
        Line(points = {{-110, 30}, {-80, 30}, {-80, 4}, {-66, 4}, {-66, 4}}, color = {0, 0, 127}));
      connect(inertia1.flange_a, torqueToAngleAdaptor1.flange) annotation (
        Line(points = {{-40, 0}, {-60, 0}, {-60, 0}, {-60, 0}}));
      connect(springDamper1.flange_a, inertia1.flange_b) annotation (
        Line(points = {{10, 0}, {-20, 0}}));
      annotation (
        Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -127}, lineColor = {0, 0, 255}, extent = {{-120, 17}, {120, -33}}, textString = "%name"), Line(points = {{-100, 0}, {-59, 0}}), Line(points = {{59, 0}, {100, 0}}), Ellipse(origin = {-40, 0}, lineThickness = 0.75, extent = {{-24, 24}, {24, -24}}, startAngle = 90, endAngle = 270), Ellipse(origin = {-40, 0}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-24, 24}, {24, -24}}, endAngle = 360), Ellipse(origin = {40, 0}, lineThickness = 0.75, extent = {{-24, 24}, {24, -24}}, startAngle = -90, endAngle = 90), Ellipse(origin = {40, 0}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-24, 24}, {24, -24}}, endAngle = 360), Line(points = {{-40, 0}, {40, 0}}), Ellipse(origin = {-40, 0}, fillColor = {161, 161, 161}, fillPattern = FillPattern.Solid, extent = {{-6, 6}, {6, -6}}, endAngle = 360), Ellipse(origin = {40, 0}, fillColor = {161, 161, 161}, fillPattern = FillPattern.Solid, extent = {{-6, 6}, {6, -6}}, endAngle = 360), Text(origin = {-127, -1}, extent = {{-27, 23}, {27, -23}}, textString = "T"), Text(origin = {-123, 69}, extent = {{-27, 23}, {27, -23}}, textString = "w"), Text(origin = {121, 79}, extent = {{-27, 23}, {27, -23}}, textString = "w"), Text(origin = {117, -11}, extent = {{-27, 23}, {27, -23}}, textString = "T")}, coordinateSystem(initialScale = 0.1)));
    end DriveShaft;

    package Elements
      model PlanetPlanet

        parameter Real gearRatio;
        parameter String Gear_Friction_Filename;
        parameter String Gear_K_Filename;
        parameter Real tanhCoeff = 100;
        parameter Real Oil_Viscosity_Breakpoint[:];
        Modelica.Mechanics.Rotational.Interfaces.Flange_a sun annotation (
          Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b pinion annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b carrier annotation (
          Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque annotation (
          Placement(visible = true, transformation(origin = {-20, -46}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Components.IdealGear Planet_Planet(ratio = gearRatio, useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
          Placement(visible = true, transformation(origin = {-77, -73}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
          Placement(visible = true, transformation(origin = {-44, -4.44089e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.Calc_GearLoss calc_GearLoss(Gear_Friction_Filename = Gear_Friction_Filename, Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint) annotation (
          Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {70, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product annotation (
          Placement(visible = true, transformation(origin = {40, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput SunGearKa annotation (
          Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Discrete.UnitDelay unitDelay(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {4, -70}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-6, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D_Ka(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab3", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {20, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Utilities.Tanh tanh(Coeff = tanhCoeff) annotation (
          Placement(visible = true, transformation(origin = {20, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product1 annotation (
          Placement(visible = true, transformation(origin = {54, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Discrete.UnitDelay unitDelay1(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {80, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
          Placement(visible = true, transformation(origin = {0, -20}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
      equation
        connect(sun, torqueSensor.flange_a) annotation (
          Line(points = {{-100, 0}, {-52, 0}}));
        connect(torqueSensor.flange_b, Planet_Planet.flange_a) annotation (
          Line(points = {{-36, 0}, {10, 0}}));
        connect(torque.flange, sun) annotation (
          Line(points = {{-28, -46}, {-90, -46}, {-90, 0}, {-100, 0}}));
        connect(calc_GearLoss.nu_oil_m2ps, nu_oil_m2ps) annotation (
          Line(points = {{-32, -76}, {-62, -76}, {-62, 60}, {-120, 60}}, color = {0, 255, 0}));
        connect(product.y, abs11.u) annotation (
          Line(points = {{47, -84}, {63, -84}}, color = {191, 0, 0}));
        connect(abs11.y, PHI_W) annotation (
          Line(points = {{77, -84}, {110, -84}}, color = {191, 0, 0}));
        connect(Planet_Planet.flange_b, pinion) annotation (
          Line(points = {{30, 0}, {100, 0}}));
        connect(calc_GearLoss.Gear_Loss, unitDelay.u) annotation (
          Line(points = {{-8, -70}, {-2, -70}, {-2, -70}, {0, -70}}, color = {0, 255, 0}));
        connect(product.u1, unitDelay.y) annotation (
          Line(points = {{32, -80}, {20, -80}, {20, -70}, {8, -70}, {8, -70}}, color = {0, 255, 0}));
        connect(Planet_Planet.support, carrier) annotation (
          Line(points = {{20, -10}, {20, -10}, {20, -40}, {100, -40}, {100, -40}}));
        connect(combiTable1D_Ka.y[1], product1.u1) annotation (
          Line(points = {{27, 64}, {47, 64}}, color = {0, 255, 0}));
        connect(tanh.y, product1.u2) annotation (
          Line(points = {{27, 46}, {36, 46}, {36, 56}, {47, 56}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable1D_Ka.u[1]) annotation (
          Line(points = {{1, 64}, {13, 64}}, color = {0, 255, 0}));
        connect(tanh.u, abs1.u) annotation (
          Line(points = {{13, 46}, {-30, 46}, {-30, 64}, {-13, 64}}, color = {0, 255, 0}));
        connect(product1.y, unitDelay1.u) annotation (
          Line(points = {{60, 60}, {74, 60}, {74, 60}, {76, 60}}, color = {0, 255, 0}));
        connect(unitDelay1.y, SunGearKa) annotation (
          Line(points = {{84, 60}, {102, 60}, {102, 60}, {110, 60}}, color = {0, 255, 0}));
        connect(torqueSensor.tau, calc_GearLoss.Gear_Torque) annotation (
          Line(points = {{-50, -9}, {-50, -62}, {-32, -62}}, color = {0, 255, 0}));
        connect(abs1.u, torqueSensor.tau) annotation (
          Line(points = {{-14, 64}, {-30, 64}, {-30, -14}, {-50, -14}, {-50, -9}}, color = {0, 255, 0}));
        connect(relSpeedSensor.flange_b, Planet_Planet.support) annotation (
          Line(points = {{0, -28}, {0, -40}, {20, -40}, {20, -10}}));
        connect(Planet_Planet.flange_a, relSpeedSensor.flange_a) annotation (
          Line(points = {{10, 0}, {0, 0}, {0, -12}}));
        connect(relSpeedSensor.w_rel, product.u2) annotation (
          Line(points = {{-9, -20}, {-40, -20}, {-40, -88}, {32, -88}}, color = {0, 255,0}));
        connect(torque.tau, unitDelay.y) annotation (
          Line(points = {{-10, -46}, {20, -46}, {20, -70}, {8, -70}, {8, -70}, {8, -70}}, color = {0, 255,0}));
        connect(speedSensor.flange, sun) annotation (
          Line(points = {{-84, -73}, {-90, -73}, {-90, 0}, {-100, 0}}));
        connect(calc_GearLoss.Gear_w1, relSpeedSensor.w_rel) annotation (
          Line(points = {{-32, -67}, {-40, -67}, {-40, -20}, {-8, -20}}, color = {0, 255,0}));
        connect(speedSensor.w, calc_GearLoss.Gear_w2) annotation (
          Line(points = {{-69, -73}, {-32, -73}}, color = {0, 255, 0}));
        annotation (
          uses(Modelica(version = "3.2.3")),
          Diagram,
          version = "",
          Icon(coordinateSystem(initialScale = 0.1), graphics={  Line(origin = {40.5319, -20.1064}, points = {{-10, 80}, {10, 80}}), Line(origin = {110.107, 10.2128}, points = {{-80, -20}, {-60, -20}}), Rectangle(origin = {-114, -30}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, extent = {{14, -10}, {168, 10}}), Line(origin = {39.8936, -90.0002}, points = {{-10, 40}, {10, 40}}), Rectangle(origin = {1, -34}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-15, -40}, {15, 40}}), Rectangle(origin = {1, -61}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Line(origin = {109.468, 0.404273}, points = {{-80, 20}, {-60, 20}}), Rectangle(origin = {1, -72}, fillColor = {102, 102, 102}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Rectangle(origin = {1, 4}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Rectangle(origin = {127, 40}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-111, -10}, {-27, 10}}), Rectangle(origin = {1, -7}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {1, -24}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 4}}), Rectangle(origin = {1, -44}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 4}}), Rectangle(origin = {1, 46}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-15, -40}, {15, 28}}), Rectangle(origin = {1, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 0}}), Rectangle(origin = {1, 36}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 4}}), Rectangle(origin = {1, 19}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {1, 8}, fillColor = {102, 102, 102}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Rectangle(origin = {1, 57}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {1, 68}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Line(origin = {40.1064, 6.82979}, points = {{0, 13}, {0, -17}}), Line(origin = {54.9998, -37.2554}, points = {{-15, 43}, {15, 43}, {15, -13}, {45, -13}}), Line(origin = {39.8937, -25.2978}, points = {{0, -25}, {0, -43}}), Line(origin = {40, 114.915}, points = {{0, -35}, {0, -55}}), Text(origin = {0, -121}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}));
      end PlanetPlanet;

      model PlanetRing
      //constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter Real gearRatio;
        parameter String Gear_Friction_Filename;
        parameter String Gear_K_Filename;
        parameter Real tanhCoeff = 100;
        parameter Real Oil_Viscosity_Breakpoint[:];
        Modelica.Mechanics.Rotational.Sources.Torque torque annotation (
          Placement(visible = true, transformation(origin = {70, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
          Placement(visible = true, transformation(origin = {6, -6.66134e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Components.IdealGear Planet_Ring(ratio = gearRatio, useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
          Placement(visible = true, transformation(origin = {-20, -28}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b ring annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a pinion annotation (
          Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a carrier annotation (
          Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {86, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product annotation (
          Placement(visible = true, transformation(origin = {66, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.Calc_GearLoss calc_GearLoss(Gear_Friction_Filename = Gear_Friction_Filename, Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint) annotation (
          Placement(visible = true, transformation(origin = {16, -54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput RingGearKa annotation (
          Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Discrete.UnitDelay unitDelay(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {40, -54}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
        Modelica.Blocks.Discrete.UnitDelay unitDelay1(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {82, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D_Ka(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab3", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {34, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {10, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product1 annotation (
          Placement(visible = true, transformation(origin = {62, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Utilities.Tanh tanh(Coeff = tanhCoeff) annotation (
          Placement(visible = true, transformation(origin = {34, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
          Placement(visible = true, transformation(origin = {-34, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain(k = -1)  annotation (
          Placement(visible = true, transformation(origin = {0, -22}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
      equation
        connect(torque.flange, ring) annotation (
          Line(points = {{78, -32}, {89, -32}, {89, 0}, {100, 0}}));
        connect(pinion, Planet_Ring.flange_a) annotation (
          Line(points = {{-100, 60}, {-60, 60}}));
        connect(carrier, Planet_Ring.support) annotation (
          Line(points = {{-100, 0}, {-50, 0}, {-50, 50}}));
        connect(nu_oil_m2ps, calc_GearLoss.nu_oil_m2ps) annotation (
          Line(points = {{-120, -60}, {6, -60}}, color = {0, 255, 0}));
        connect(torqueSensor.flange_a, Planet_Ring.flange_b) annotation (
          Line(points = {{-2, 0}, {-20, 0}, {-20, 60}, {-40, 60}}));
        connect(product.y, abs11.u) annotation (
          Line(points = {{73, -70}, {79, -70}}, color = {191, 0, 0}));
        connect(abs11.y, PHI_W) annotation (
          Line(points = {{93, -70}, {110, -70}}, color = {191, 0, 0}));
        connect(torqueSensor.flange_b, ring) annotation (
          Line(points = {{14, 0}, {100, 0}}));
        connect(calc_GearLoss.Gear_Loss, unitDelay.u) annotation (
          Line(points = {{25, -54}, {35, -54}}, color = {0, 255, 0}));
        connect(tanh.y, product1.u2) annotation (
          Line(points = {{41, 46}, {50, 46}, {50, 56}, {55, 56}}, color = {0, 255, 0}));
        connect(combiTable1D_Ka.y[1], product1.u1) annotation (
          Line(points = {{41, 64}, {55, 64}}, color = {0, 255, 0}));
        connect(product1.y, unitDelay1.u) annotation (
          Line(points = {{69, 60}, {77, 60}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable1D_Ka.u[1]) annotation (
          Line(points = {{17, 64}, {27, 64}}, color = {0, 255, 0}));
        connect(tanh.u, abs1.u) annotation (
          Line(points = {{27, 46}, {-8, 46}, {-8, 64}, {3, 64}}, color = {0, 255, 0}));
        connect(unitDelay1.y, RingGearKa) annotation (
          Line(points = {{86, 60}, {110, 60}}, color = {0, 255, 0}));
        connect(relSpeedSensor.flange_a, Planet_Ring.support) annotation (
          Line(points = {{-42, 0}, {-50, 0}, {-50, 50}, {-50, 50}}));
        connect(relSpeedSensor.flange_b, torqueSensor.flange_a) annotation (
          Line(points = {{-26, 0}, {-2, 0}, {-2, 0}, {-2, 0}}));
        connect(relSpeedSensor.w_rel, calc_GearLoss.Gear_w1) annotation (
          Line(points = {{-34, -8}, {-34, -52}, {6, -52}}, color = {0, 255, 0}));
        connect(speedSensor.flange, Planet_Ring.flange_b) annotation (
          Line(points = {{-20, -20}, {-20, 60}, {-40, 60}}));
        connect(product.u2, relSpeedSensor.w_rel) annotation (
          Line(points = {{58, -74}, {-34, -74}, {-34, -8}, {-34, -8}}, color = {0, 255,0}));
        connect(calc_GearLoss.Gear_w2, speedSensor.w) annotation (
          Line(points = {{6, -56}, {-20, -56}, {-20, -37}}, color = {0, 255, 0}));
        connect(torqueSensor.tau, gain.u) annotation (
          Line(points = {{0, -8}, {0, -8}, {0, -14}, {0, -14}}, color = {0, 0, 127}));
        connect(gain.y, calc_GearLoss.Gear_Torque) annotation (
          Line(points = {{0, -28}, {0, -28}, {0, -48}, {6, -48}, {6, -48}}, color = {0, 255,0}));
        connect(gain.y, abs1.u) annotation (
          Line(points = {{0, -28}, {0, -28}, {0, -36}, {30, -36}, {30, 30}, {-8, 30}, {-8, 64}, {2, 64}, {2, 64}}, color = {0, 255,0}));
        connect(unitDelay.y, product.u1) annotation (
          Line(points = {{44, -54}, {52, -54}, {52, -66}, {58, -66}, {58, -66}}, color = {0, 255,0}));
        connect(unitDelay.y, torque.tau) annotation (
          Line(points = {{44, -54}, {52, -54}, {52, -32}, {60, -32}, {60, -32}}, color = {0, 255,0}));
        annotation (
          uses(Modelica(version = "3.2.3")),
          Icon(graphics={  Rectangle(origin = {-31, 60}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-69, -10}, {45, 10}}), Rectangle(origin = {-1, 72}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-15, -46}, {15, 18}}), Rectangle(origin = {-1, 51}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {-1, 76}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 0}}), Rectangle(origin = {-1, 64}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 4}}), Rectangle(origin = {-1, 83}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {-1, 32}, fillColor = {102, 102, 102}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Rectangle(origin = {55, 0}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-1, -10}, {45, 10}}), Rectangle(origin = {16, 0}, lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{10, -94}, {40, 94}}), Rectangle(origin = {6, 6}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{-32, -105}, {50, -100}}), Rectangle(origin = {6, 199}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{-32, -105}, {50, -100}}), Rectangle(origin = {-1, 44}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -6}, {15, 0}}), Line(origin = {-52.3405, 80.4043}, points = {{-12, 0}, {12, 0}}), Line(origin = {-51.634, 40.1446}, points = {{-12, 0}, {12, 0}}), Line(origin = {-40.6, 110.145}, points = {{-12, -12}, {-12, -30}}), Line(origin = {-66.6381, 98.3191}, points = {{14, -58}, {14, -98}, {-32, -98}}), Text(origin = {0, -121}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
          Diagram,
          version = "");
      end PlanetRing;

      model HypoidGear
        constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        constant Real w_Threshold = 0.1;
        parameter Real GearRatio;
        parameter String Gear_K_Filename;
        parameter String LoadLossFilename;
        parameter String StirringLossFilename;
        parameter Real Oil_Viscosity_Breakpoint[:];
        Modelica.Mechanics.Rotational.Interfaces.Flange_a pinion annotation (
          Placement(visible = true, transformation(extent = {{-150, -10}, {-130, 10}}, rotation = 0), iconTransformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b ring annotation (
          Placement(visible = true, transformation(extent = {{130, -10}, {150, 10}}, rotation = 0), iconTransformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-160, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput GearLoad[3] annotation (
          Placement(visible = true, transformation(origin = {150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = GearRatio) annotation (
          Placement(visible = true, transformation(origin = {40, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
          Placement(visible = true, transformation(origin = {-54, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D(filename = LoadLossFilename, z_ax = Oil_Viscosity_Breakpoint) annotation (
          Placement(visible = true, transformation(origin = {-54, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
          Placement(visible = true, transformation(origin = {-110, -2.22045e-16}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
          Placement(visible = true, transformation(origin = {-126, -20}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
        Modelica.Blocks.Math.Add add1 annotation (
          Placement(visible = true, transformation(origin = {116, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-110, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product1 annotation (
          Placement(visible = true, transformation(origin = {-26, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation (
          Placement(visible = true, transformation(origin = {6, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-86, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {6, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex3 multiplex31 annotation (
          Placement(visible = true, transformation(origin = {40, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D_Fzp(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab3", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, 26}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D_Fyp(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab2", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D_Fxp(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, 74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Discrete.UnitDelay unitDelay(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D stirring2D(Stirring_Resistance_Filename = StirringLossFilename) annotation (
          Placement(visible = true, transformation(origin = {86, -24}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {40, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
          Placement(visible = true, transformation(origin = {108, -24}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      equation
        connect(gain1.u, speedSensor.w) annotation (
          Line(points = {{-117, -40}, {-126, -40}, {-126, -27}}, color = {0, 255, 0}));
        connect(combiTable1Ds1.u, speedSensor.w) annotation (
          Line(points = {{-61, -60}, {-126, -60}, {-126, -27}}, color = {0, 255, 0}));
        connect(combiTable3D.u2, nu_oil_m2ps) annotation (
          Line(points = {{-61, -45}, {-70, -45}, {-70, -70}, {-160, -70}}, color = {0, 255, 0}));
        connect(combiTable1Ds1.y[1], product1.u2) annotation (
          Line(points = {{-47, -60}, {-40, -60}, {-40, -48}, {-33, -48}}, color = {0, 255, 0}));
        connect(product1.y, torque1.tau) annotation (
          Line(points = {{-19, -44}, {-1, -44}}, color = {0, 255, 0}));
        connect(torque1.flange, idealGear.flange_a) annotation (
          Line(points = {{12, -44}, {20, -44}, {20, 0}, {32, 0}}));
        connect(product2.u1, product1.y) annotation (
          Line(points = {{-1, -80}, {-10, -80}, {-10, -44}, {-19, -44}}, color = {0, 255, 0}));
        connect(product2.u2, speedSensor.w) annotation (
          Line(points = {{-1, -88}, {-126, -88}, {-126, -27}}, color = {0, 255, 0}));
        connect(combiTable1D_Fyp.y[1], multiplex31.u2[1]) annotation (
          Line(points = {{-7, 50}, {33, 50}}, color = {0, 255, 0}, thickness = 0.5));
        connect(combiTable1D_Fxp.y[1], multiplex31.u1[1]) annotation (
          Line(points = {{-7, 74}, {20, 74}, {20, 54}, {33, 54}}, color = {0, 255, 0}, thickness = 0.5));
        connect(combiTable1D_Fzp.y[1], multiplex31.u3[1]) annotation (
          Line(points = {{-7, 26}, {20, 26}, {20, 46}, {33, 46}}, color = {0, 255, 0}, thickness = 0.5));
        connect(multiplex31.y, GearLoad) annotation (
          Line(points = {{47, 50}, {150, 50}}, color = {0, 255, 0}, thickness = 0.5));
        connect(speedSensor.flange, pinion) annotation (
          Line(points = {{-126, -14}, {-126, 0}, {-140, 0}}));
        connect(idealGear.flange_b, ring) annotation (
          Line(points = {{48, 0}, {140, 0}}));
        connect(combiTable1D_Fxp.u[1], unitDelay.y) annotation (
          Line(points = {{-21, 74}, {-40, 74}, {-40, 50}, {-83, 50}}, color = {0, 255, 0}));
        connect(combiTable1D_Fyp.u[1], unitDelay.y) annotation (
          Line(points = {{-21, 50}, {-83, 50}}, color = {0, 255, 0}));
        connect(torqueSensor.flange_a, pinion) annotation (
          Line(points = {{-116, 0}, {-140, 0}}));
        connect(torqueSensor.flange_b, idealGear.flange_a) annotation (
          Line(points = {{-104, 0}, {32, 0}}));
        connect(unitDelay.u, torqueSensor.tau) annotation (
          Line(points = {{-97, 50}, {-115, 50}, {-115, 7}}, color = {0, 255, 0}));
        connect(combiTable1D_Fzp.u[1], unitDelay.y) annotation (
          Line(points = {{-21, 26}, {-40, 26}, {-40, 50}, {-83, 50}}, color = {0, 255, 0}));
        connect(gain1.y, abs1.u) annotation (
          Line(points = {{-104, -40}, {-93, -40}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable3D.u1) annotation (
          Line(points = {{-79, -40}, {-61, -40}}, color = {0, 255, 0}));
        connect(unitDelay.y, combiTable3D.u) annotation (
          Line(points = {{-84, 50}, {-70, 50}, {-70, -35}, {-61, -35}}, color = {0, 255, 0}));
        connect(combiTable3D.y, product1.u1) annotation (
          Line(points = {{-48, -40}, {-33, -40}}, color = {0, 0, 127}));
        connect(stirring2D.support, idealGear.flange_b) annotation (
          Line(points = {{80, -24}, {60, -24}, {60, 0}, {48, 0}}));
        connect(product2.y, abs11.u) annotation (
          Line(points = {{13, -84}, {33, -84}}, color = {0, 255, 0}));
        connect(abs11.y, add1.u2) annotation (
          Line(points = {{47, -84}, {109, -84}}, color = {191, 0, 0}));
        connect(stirring2D.PHI_W, add1.u1) annotation (
          Line(points = {{93, -29}, {100, -29}, {100, -76}, {109, -76}}, color = {191, 0, 0}));
        connect(add1.y, PHI_W) annotation (
          Line(points = {{123, -80}, {150, -80}}, color = {0, 0, 127}));
        connect(stirring2D.nu_oil_m2ps, nu_oil_m2ps) annotation (
          Line(points = {{79, -19}, {70, -19}, {70, -70}, {-160, -70}}, color = {0, 255, 0}));
        connect(stirring2D.flange_b, fixed.flange) annotation (
          Line(points = {{92, -24}, {108, -24}}));
        annotation (
          Icon(graphics={  Text(origin = {6, -224}, lineColor = {0, 0, 255}, extent = {{-146, 84}, {154, 124}}, textString = "%name"), Rectangle(origin = {30, 6}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-74, -10}, {-46, 10}}), Ellipse(origin = {16, 4}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, -48}, {2, 72}}, endAngle = 360), Ellipse(origin = {26, 28}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-16, -42}, {24, 48}}, endAngle = 360), Ellipse(origin = {36, 34}, rotation = 270, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{0, -36}, {20, 24}}, endAngle = 360), Ellipse(origin = {30, 38}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, fillPattern = FillPattern.HorizontalCylinder, extent = {{12, -10}, {20, 10}}, endAngle = 360), Rectangle(origin = {30, 38}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{16, -10}, {118, 10}}), Polygon(origin = {-14, -9}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, points = {{-16, 31}, {-16, -15}, {2, -7}, {2, 25}, {-16, 31}}), Rectangle(origin = {-122, 0}, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{22, -10}, {92, 10}})}, coordinateSystem(initialScale = 0.1)),
          Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
          version = "");
      end HypoidGear;

      model OilSeal
        constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter String OilSeal_friction_filename = OilSeal_friction_filename;
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {54, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-28, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(fileName = currDir + "/Tables/" + OilSeal_friction_filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-2, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
          Placement(visible = true, transformation(origin = {-2, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        constant Real w_Threshold = 0.01;
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {46, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-28, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
          Placement(visible = true, transformation(origin = {-70, -80}, extent = {{6, -6}, {-6, 6}}, rotation = 180)));
        Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
          Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(gain1.y, abs1.u) annotation (
          Line(points = {{-47, 4}, {-36, 4}}, color = {0, 255, 0}));
        connect(combiTable1Ds1.y[1], product3.u1) annotation (
          Line(points = {{4, 4}, {38, 4}, {38, 4}, {38, 4}}, color = {0, 255, 0}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{38.8, -3.6}, {33.8, -3.6}, {33.8, -30}, {5, -30}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable1Ds1.u) annotation (
          Line(points = {{-21.4, 4}, {-9.8, 4}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{52.6, 0}, {64.6, 0}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{78, 0}, {100, 0}}));
        connect(flange_a, flange_b) annotation (
          Line(points = {{-100, 0}, {-90, 0}, {-90, 40}, {94, 40}, {94, 0}, {100, 0}}));
        connect(abs11.y, product2.u2) annotation (
          Line(points = {{-22, -70}, {14, -70}, {14, -84}, {47, -84}}, color = {0, 255, 0}));
        connect(combiTable1Ds1.y[1], product2.u1) annotation (
          Line(points = {{4, 4}, {26, 4}, {26, -76}, {47, -76}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{61, -80}, {110, -80}}, color = {191, 0, 0}));
        connect(torque1.support, support) annotation (
          Line(points = {{72, -6}, {72, -6}, {72, -100}, {0, -100}, {0, -100}}));
        connect(relSpeedSensor.w_rel, gain1.u) annotation (
          Line(points = {{-70, -73}, {-70, 4}, {-62, 4}}, color = {0, 255, 0}));
        connect(relSpeedSensor.w_rel, combiTable1Ds2.u) annotation (
          Line(points = {{-70, -73}, {-70, -30}, {-10, -30}}, color = {0, 255, 0}));
        connect(relSpeedSensor.w_rel, abs11.u) annotation (
          Line(points = {{-70, -73}, {-70, -70}, {-36, -70}}, color = {0, 255, 0}));
        connect(relSpeedSensor.flange_b, support) annotation (
          Line(points = {{-64, -80}, {0, -80}, {0, -100}, {0, -100}}));
        connect(relSpeedSensor.flange_a, flange_a) annotation (
          Line(points = {{-76, -80}, {-90, -80}, {-90, 0}, {-100, 0}, {-100, 0}}));
        annotation (
          Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Polygon(origin = {-10, -47}, fillColor = {100, 100, 100}, fillPattern = FillPattern.Solid, points = {{30, 7}, {30, 17}, {30, 17}, {10, 33}, {-10, 17}, {-24, 17}, {-30, 11}, {-30, -27}, {-24, -33}, {20, -33}, {20, -23}, {-20, -23}, {-20, 7}, {30, 7}}), Ellipse(origin = {0, -38}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{10, -10}, {-10, 10}}, endAngle = 360), Polygon(origin = {-10, 47}, fillColor = {100, 100, 100}, fillPattern = FillPattern.Solid, points = {{18, 33}, {-24, 33}, {-30, 27}, {-30, -11}, {-24, -17}, {-10, -17}, {10, -33}, {30, -17}, {30, -7}, {-20, -7}, {-20, 23}, {18, 23}, {18, 33}}), Ellipse(origin = {0, 38}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{10, -10}, {-10, 10}}, endAngle = 360), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
      end OilSeal;

      model SealRing
        constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter String SealRing_friction_filename = SealRing_friction_filename;
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {60, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + SealRing_friction_filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-6, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
          Placement(visible = true, transformation(origin = {-8, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        constant Real w_Threshold = 0.01;
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {46, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput p_line_Pa[2] annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-58, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-34, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
          Placement(visible = true, transformation(origin = {-70, -80}, extent = {{6, -6}, {-6, 6}}, rotation = 180)));
        Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
          Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain2(k = 1 / 1000) annotation (
          Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Utilities.Subtruct subtruct annotation (
          Placement(visible = true, transformation(origin = {-66, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      equation
        connect(combiTable2D1.y, product3.u1) annotation (
          Line(points = {{1, 4}, {38, 4}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{52.6, 0}, {64.6, 0}}, color = {0, 255, 0}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{38.8, -3.6}, {33.8, -3.6}, {33.8, -29.6}, {-1.2, -29.6}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{78, 0}, {100, 0}}));
        connect(flange_a, flange_b) annotation (
          Line(points = {{-100, 0}, {-90, 0}, {-90, 40}, {94, 40}, {94, 0}, {100, 0}}));
        connect(abs11.y, product2.u2) annotation (
          Line(points = {{-28, -70}, {36, -70}, {36, -84}, {52, -84}, {52, -84}}, color = {0, 255, 0}));
        connect(combiTable2D1.y, product2.u1) annotation (
          Line(points = {{1, 4}, {20, 4}, {20, -60}, {46, -60}, {46, -76}, {52, -76}}, color = {0, 255, 0}));
        connect(torque1.support, support) annotation (
          Line(points = {{72, -6}, {72, -6}, {72, -100}, {0, -100}, {0, -100}}));
        connect(relSpeedSensor.w_rel, gain1.u) annotation (
          Line(points = {{-70, -73}, {-70, 8}, {-65, 8}}, color = {0, 255, 0}));
        connect(relSpeedSensor.w_rel, combiTable1Ds2.u) annotation (
          Line(points = {{-70, -73}, {-70, -30}, {-16, -30}}, color = {0, 255, 0}));
        connect(relSpeedSensor.w_rel, abs11.u) annotation (
          Line(points = {{-70, -73}, {-70, -70}, {-42, -70}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{66, -80}, {104, -80}, {104, -80}, {110, -80}}, color = {191, 0, 0}));
        connect(gain2.y, combiTable2D1.u2) annotation (
          Line(points = {{-33, 80}, {-20, 80}, {-20, 0}, {-13, 0}}, color = {0, 255, 0}));
        connect(relSpeedSensor.flange_a, flange_a) annotation (
          Line(points = {{-76, -80}, {-90, -80}, {-90, 0}, {-100, 0}}));
        connect(relSpeedSensor.flange_b, support) annotation (
          Line(points = {{-64, -80}, {0, -80}, {0, -100}, {0, -100}}));
        connect(gain1.y, combiTable2D1.u1) annotation (
          Line(points = {{-52, 8}, {-14, 8}, {-14, 8}, {-14, 8}}, color = {0, 255, 0}));
        connect(p_line_Pa[1], subtruct.u1) annotation (
          Line(points = {{-120, 80}, {-80, 80}, {-80, 84}, {-74, 84}, {-74, 84}}, color = {0, 255, 0}));
        connect(p_line_Pa[2], subtruct.u2) annotation (
          Line(points = {{-120, 80}, {-80, 80}, {-80, 76}, {-74, 76}, {-74, 76}}, color = {0, 255, 0}));
        connect(subtruct.y, gain2.u) annotation (
          Line(points = {{-60, 80}, {-47, 80}}, color = {0, 255, 0}));
        annotation (
          Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Polygon(origin = {0, 48}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{-50, -32}, {50, -32}, {20, 32}, {-20, 32}, {-50, -32}}), Polygon(origin = {0, -48}, rotation = 180, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{-50, -32}, {50, -32}, {20, 32}, {-20, 32}, {-50, -32}}), Text(origin = {-135, 108}, extent = {{-65, 12}, {35, -18}}, textString = "Oil_Pressure"), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
          Diagram,
          __OpenModelica_commandLineOptions = "");
      end SealRing;

      model Stirring2D
        //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
        parameter String Stirring_Resistance_Filename;
        constant Real w_Threshold = 0.01;
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {62, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-20, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + Stirring_Resistance_Filename, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {12, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
          Placement(visible = true, transformation(origin = {10, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {46, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-48, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
          Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
          Placement(visible = true, transformation(origin = {-72, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      equation
        connect(combiTable2D1.y, product3.u1) annotation (
          Line(points = {{19, 4}, {38, 4}}, color = {0, 255, 0}));
        connect(abs1.u, gain1.y) annotation (
          Line(points = {{-27, 8}, {-36, 8}, {-36, 0}, {-41, 0}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable2D1.u1) annotation (
          Line(points = {{-13, 8}, {5, 8}}, color = {0, 255, 0}));
        connect(nu_oil_m2ps, combiTable2D1.u2) annotation (
          Line(points = {{-120, 80}, {0, 80}, {0, 0}, {5, 0}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{52.6, 0}, {64.6, 0}}, color = {0, 255, 0}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{38.8, -3.6}, {33.8, -3.6}, {33.8, -30}, {17, -30}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{78, 0}, {100, 0}}));
        connect(combiTable2D1.y, product2.u1) annotation (
          Line(points = {{19, 4}, {26, 4}, {26, -76}, {55, -76}}, color = {0, 255, 0}));
        connect(abs11.y, product2.u2) annotation (
          Line(points = {{-13, -70}, {16, -70}, {16, -84}, {55, -84}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{68, -80}, {110, -80}}, color = {191, 0, 0}));
        connect(torque1.support, support) annotation (
          Line(points = {{72, -6}, {72, -6}, {72, -16}, {-90, -16}, {-90, 0}, {-100, 0}, {-100, 0}}));
        connect(flange_b, relSpeedSensor.flange_b) annotation (
          Line(points = {{100, 0}, {90, 0}, {90, 30}, {-66, 30}, {-66, 30}}));
        connect(relSpeedSensor.w_rel, gain1.u) annotation (
          Line(points = {{-72, 24}, {-72, 24}, {-72, 0}, {-56, 0}, {-56, 0}}, color = {0, 255, 0}));
        connect(relSpeedSensor.w_rel, combiTable1Ds2.u) annotation (
          Line(points = {{-72, 24}, {-72, 24}, {-72, -30}, {2, -30}, {2, -30}}, color = {0, 255, 0}));
        connect(relSpeedSensor.w_rel, abs11.u) annotation (
          Line(points = {{-72, 24}, {-72, 24}, {-72, -70}, {-28, -70}, {-28, -70}}, color = {0, 255, 0}));
        connect(relSpeedSensor.flange_a, support) annotation (
          Line(points = {{-78, 30}, {-90, 30}, {-90, 0}, {-100, 0}}));
        annotation (
          Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {-40, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Rectangle(origin = {60, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Line(origin = {95, 0}, points = {{-15, 0}, {5, 0}}), Line(origin = {9.56132, 60.3825}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.68952, 20.3504}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.56132, -19.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.56132, -59.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.438684, 90.3825}, points = {{-10, -10}, {10, 10}}), Line(origin = {19.5613, -89.6175}, points = {{-10, -10}, {10, 10}, {10, 10}}), Text(origin = {-135, 118}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}),
          Diagram,
          __OpenModelica_commandLineOptions = "");
      end Stirring2D;

      model Stirring2D_Brake
        //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
        parameter String Stirring_Resistance_Filename;
        constant Real w_Threshold = 0.01;
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {62, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + Stirring_Resistance_Filename, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {12, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
          Placement(visible = true, transformation(origin = {10, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {46, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-20, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
          Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
          Placement(visible = true, transformation(origin = {-72, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      equation
        connect(combiTable2D1.y, product3.u1) annotation (
          Line(points = {{19, 4}, {38, 4}}, color = {0, 255, 0}));
        connect(nu_oil_m2ps, combiTable2D1.u2) annotation (
          Line(points = {{-120, 80}, {0, 80}, {0, 0}, {5, 0}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{52.6, 0}, {64.6, 0}}, color = {0, 255, 0}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{38.8, -3.6}, {33.8, -3.6}, {33.8, -30}, {17, -30}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{78, 0}, {100, 0}}));
        connect(combiTable2D1.y, product2.u1) annotation (
          Line(points = {{19, 4}, {26, 4}, {26, -76}, {55, -76}}, color = {0, 255, 0}));
        connect(abs11.y, product2.u2) annotation (
          Line(points = {{-13, -70}, {16, -70}, {16, -84}, {55, -84}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{68, -80}, {110, -80}}, color = {191, 0, 0}));
        connect(torque1.support, support) annotation (
          Line(points = {{72, -6}, {72, -6}, {72, -16}, {-90, -16}, {-90, 0}, {-100, 0}, {-100, 0}}));
        connect(relSpeedSensor.w_rel, combiTable1Ds2.u) annotation (
          Line(points = {{-72, 23}, {-72, -30}, {2, -30}}, color = {0, 255, 0}));
        connect(relSpeedSensor.w_rel, abs11.u) annotation (
          Line(points = {{-72, 23}, {-72, -70}, {-28, -70}}, color = {0, 255, 0}));
        connect(gain1.y, combiTable2D1.u1) annotation (
          Line(points = {{-13, 8}, {4, 8}}, color = {0, 255, 0}));
        connect(relSpeedSensor.flange_a, support) annotation (
          Line(points = {{-78, 30}, {-90, 30}, {-90, 0}, {-100, 0}, {-100, 0}}));
        connect(relSpeedSensor.flange_b, flange_b) annotation (
          Line(points = {{-66, 30}, {90, 30}, {90, 0}, {100, 0}}));
        connect(gain1.u, relSpeedSensor.w_rel) annotation (
          Line(points = {{-28, 8}, {-72, 8}, {-72, 24}, {-72, 24}}, color = {0, 255, 0}));
        annotation (
          Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {-40, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Rectangle(origin = {60, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Line(origin = {95, 0}, points = {{-15, 0}, {5, 0}}), Line(origin = {9.56132, 60.3825}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.68952, 20.3504}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.56132, -19.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.56132, -59.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.438684, 90.3825}, points = {{-10, -10}, {10, 10}}), Line(origin = {19.5613, -89.6175}, points = {{-10, -10}, {10, 10}, {10, 10}}), Text(origin = {-135, 118}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}),
          Diagram,
          __OpenModelica_commandLineOptions = "");
      end Stirring2D_Brake;

      model Stirring3D
        //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter String Stirring_Resistance_Filename = Stirring_Resistance_Filename;
        parameter Real Oil_Viscosity_Breakpoint[:];
        constant Real w_Threshold = 0.01;
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation (
          Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {66, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-32, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D1(filename = Stirring_Resistance_Filename, z_ax = Oil_Viscosity_Breakpoint) annotation (
          Placement(visible = true, transformation(origin = {2, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
          Placement(visible = true, transformation(origin = {-2, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {52, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
          Placement(visible = true, transformation(origin = {-48, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-2, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-32, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain2(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-58, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(combiTable3D1.y, product3.u1) annotation (
          Line(points = {{8, 4}, {44, 4}, {44, 4}, {44, 4}}, color = {0, 255, 0}));
        connect(combiTable1Ds2.u, relSpeedSensor1.w_rel) annotation (
          Line(points = {{-10, -30}, {-48, -30}, {-48, 34}, {-48, 34}}, color = {0, 255, 0}));
        connect(gain2.y, abs1.u) annotation (
          Line(points = {{-52, 0}, {-40, 0}, {-40, 0}, {-40, 0}}, color = {0, 255, 0}));
        connect(speedSensor1.w, gain2.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, 0}, {-66, 0}}, color = {0, 255, 0}));
        connect(gain1.y, combiTable3D1.u1) annotation (
          Line(points = {{-26, 20}, {-22, 20}, {-22, 4}, {-6, 4}, {-6, 4}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, gain1.u) annotation (
          Line(points = {{-48, 33.4}, {-48, 33.4}, {-48, 19.4}, {-40, 19.4}, {-40, 19.4}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, abs11.u) annotation (
          Line(points = {{-48, 33.4}, {-48, 33.4}, {-48, -70.6}, {-10, -70.6}, {-10, -70.6}}, color = {0, 255, 0}));
        connect(flange_a, relSpeedSensor1.flange_a) annotation (
          Line(points = {{-100, 0}, {-90, 0}, {-90, 40}, {-54, 40}}));
        connect(relSpeedSensor1.flange_b, flange_b) annotation (
          Line(points = {{-42, 40}, {90, 40}, {90, 0}, {100, 0}}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{44.8, -3.6}, {39.8, -3.6}, {39.8, -29.6}, {4.8, -29.6}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{59, 0}, {64.6, 0}}, color = {0, 255, 0}));
        connect(nu_oil_m2ps, combiTable3D1.u2) annotation (
          Line(points = {{-120, 80}, {-18, 80}, {-18, -2}, {-5, -2}, {-5, -1}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable3D1.u) annotation (
          Line(points = {{-25.4, 0}, {-15.4, 0}, {-15.4, 8}, {-5.4, 8}, {-5.4, 8}}, color = {0, 255, 0}));
        connect(torque1.support, flange_a) annotation (
          Line(points = {{72, -6}, {72, -12}, {-90, -12}, {-90, 0}, {-100, 0}}));
        connect(speedSensor1.flange, flange_a) annotation (
          Line(points = {{-84, 0}, {-100, 0}}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{78, 0}, {100, 0}}));
        connect(product2.u2, abs11.y) annotation (
          Line(points = {{58, -84}, {20, -84}, {20, -70}, {4, -70}, {4, -70}}, color = {0, 255, 0}));
        connect(combiTable3D1.y, product2.u1) annotation (
          Line(points = {{8, 4}, {30, 4}, {30, -76}, {58, -76}, {58, -76}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{72, -80}, {104, -80}, {104, -80}, {110, -80}}, color = {191, 0, 0}));
        annotation (
          Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {-50, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Rectangle(origin = {50, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Line(origin = {95, 0}, points = {{-25, 0}, {5, 0}}), Line(origin = {-0.43868, 60.3825}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.31048, 20.3504}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.43868, -19.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.43868, -59.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-10.4387, 90.3825}, points = {{-10, -10}, {10, 10}}), Line(origin = {9.5613, -89.6175}, points = {{-10, -10}, {10, 10}, {10, 10}}), Text(origin = {-135, 118}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Line(origin = {-80, 0}, points = {{-20, 0}, {10, 0}}), Text(origin = {0, -140}, lineColor = {0, 0, 255}, extent = {{-120, 30}, {120, -30}}, textString = "%name")}),
          Diagram,
          __OpenModelica_commandLineOptions = "");
      end Stirring3D;

      model BRG_Angular
        //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter String BRG_Friction_Filename;
        constant Real w_Threshold = 0.01;
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {80, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {60, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
          Placement(visible = true, transformation(origin = {-54, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {60, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs2 annotation (
          Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fr annotation (
          Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D2(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab2", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, -16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fth annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Add add1 annotation (
          Placement(visible = true, transformation(origin = {10, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
          Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-14, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
          Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs3 annotation (
          Placement(visible = true, transformation(origin = {-28, 80}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(add1.y, product3.u1) annotation (
          Line(points = {{16, 4}, {52, 4}, {52, 4}, {52, 4}}, color = {0, 255, 0}));
        connect(abs2.y, combiTable2D2.u2) annotation (
          Line(points = {{-74, 80}, {-38, 80}, {-38, 70}, {-32, 70}, {-32, -20}, {-22, -20}, {-22, -20}}, color = {0, 255, 0}));
        connect(abs3.y, combiTable2D2.u1) annotation (
          Line(points = {{-28, 74}, {-28, -12}, {-21, -12}}, color = {0, 255, 0}));
        connect(Fr, abs3.u) annotation (
          Line(points = {{-20, 120}, {-20, 120}, {-20, 94}, {-28, 94}, {-28, 88}, {-28, 88}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, abs11.u) annotation (
          Line(points = {{-100, -33}, {-100, -28}, {-80, -28}, {-80, -46}, {-22, -46}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, gain1.u) annotation (
          Line(points = {{-100, -33}, {-100, 0}, {-86, 0}}, color = {0, 255, 0}));
        connect(combiTable2D2.y, add1.u2) annotation (
          Line(points = {{-7, -16}, {-2, -16}, {-2, 0}, {2, 0}}, color = {0, 255, 0}));
        connect(nu_oil_m2ps, combiTable2D1.u1) annotation (
          Line(points = {{-120, -60}, {-36, -60}, {-36, 12}, {-21, 12}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable2D1.u2) annotation (
          Line(points = {{-48, 4}, {-21, 4}}, color = {0, 255, 0}));
        connect(combiTable2D1.y, add1.u1) annotation (
          Line(points = {{-7, 8}, {2, 8}}, color = {0, 255, 0}));
        connect(gain1.y, combiTable1Ds2.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, -30}, {-62, -30}, {-62, -30}}, color = {0, 255, 0}));
        connect(gain1.y, abs1.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, 4}, {-62, 4}, {-62, 4}}, color = {0, 255, 0}));
        connect(flange_a, flange_b) annotation (
          Line(points = {{-120, 0}, {-110, 0}, {-110, 40}, {94, 40}, {94, 0}, {100, 0}}));
        connect(torque1.support, support) annotation (
          Line(points = {{80, -6}, {80, -6}, {80, -86}, {0, -86}, {0, -100}, {0, -100}}));
        connect(Fth, abs2.u) annotation (
          Line(points = {{-120, 80}, {-88, 80}, {-88, 80}, {-88, 80}}, color = {0, 255, 0}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{52, -4}, {48, -4}, {48, -30}, {-48, -30}, {-48, -30}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{67, 0}, {73, 0}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{86, 0}, {100, 0}}));
        connect(add1.y, product2.u1) annotation (
          Line(points = {{16, 4}, {32, 4}, {32, -66}, {52, -66}, {52, -66}}, color = {0, 255, 0}));
        connect(abs11.y, product2.u2) annotation (
          Line(points = {{-8, -46}, {20, -46}, {20, -74}, {52, -74}, {52, -74}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{66, -70}, {90, -70}, {90, -80}, {110, -80}, {110, -80}}, color = {191, 0, 0}));
        connect(relSpeedSensor1.flange_b, support) annotation (
          Line(points = {{-94, -40}, {-86, -40}, {-86, -56}, {0, -56}, {0, -100}}));
        connect(relSpeedSensor1.flange_a, flange_a) annotation (
          Line(points = {{-106, -40}, {-110, -40}, {-110, 0}, {-120, 0}}));
        annotation (
          Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Rectangle(origin = {-1, 42}, extent = {{-35, 42}, {35, -28}}), Rectangle(origin = {-1, -42}, extent = {{-35, 28}, {35, -42}}), Rectangle(origin = {-1, 23}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -9}, {35, 11}}), Rectangle(origin = {-1, 75}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -13}, {35, 9}}), Rectangle(origin = {-1, -23}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -11}, {35, 9}}), Rectangle(origin = {-1, -73}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -11}, {35, 11}}), Ellipse(origin = {0, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Ellipse(origin = {0, 48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Text(origin = {25, 138}, extent = {{-25, 12}, {35, -18}}, textString = "Fr"), Text(origin = {-135, 128}, extent = {{-25, 12}, {35, -18}}, textString = "Fth"), Text(origin = {-135, -22}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
      end BRG_Angular;

      model BRG_DoubleRowAngular
        //constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter String BRG_Friction_Filename;
        constant Real w_Threshold = 0.01;
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {80, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {60, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
          Placement(visible = true, transformation(origin = {-54, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {60, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs2 annotation (
          Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fr annotation (
          Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D2(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab2", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, -16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fth annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Add add1 annotation (
          Placement(visible = true, transformation(origin = {10, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
          Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-14, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
          Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs3 annotation (
          Placement(visible = true, transformation(origin = {-28, 80}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(add1.y, product3.u1) annotation (
          Line(points = {{16, 4}, {52, 4}, {52, 4}, {52, 4}}, color = {0, 255, 0}));
        connect(abs2.y, combiTable2D2.u2) annotation (
          Line(points = {{-74, 80}, {-38, 80}, {-38, 70}, {-32, 70}, {-32, -20}, {-22, -20}, {-22, -20}}, color = {0, 255, 0}));
        connect(abs3.y, combiTable2D2.u1) annotation (
          Line(points = {{-28, 74}, {-28, -12}, {-21, -12}}, color = {0, 255, 0}));
        connect(Fr, abs3.u) annotation (
          Line(points = {{-20, 120}, {-20, 120}, {-20, 94}, {-28, 94}, {-28, 88}, {-28, 88}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, abs11.u) annotation (
          Line(points = {{-100, -33}, {-100, -28}, {-80, -28}, {-80, -46}, {-22, -46}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, gain1.u) annotation (
          Line(points = {{-100, -33}, {-100, 0}, {-86, 0}}, color = {0, 255, 0}));
        connect(combiTable2D2.y, add1.u2) annotation (
          Line(points = {{-7, -16}, {-2, -16}, {-2, 0}, {2, 0}}, color = {0, 255, 0}));
        connect(nu_oil_m2ps, combiTable2D1.u1) annotation (
          Line(points = {{-120, -60}, {-36, -60}, {-36, 12}, {-21, 12}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable2D1.u2) annotation (
          Line(points = {{-48, 4}, {-21, 4}}, color = {0, 255, 0}));
        connect(combiTable2D1.y, add1.u1) annotation (
          Line(points = {{-7, 8}, {2, 8}}, color = {0, 255, 0}));
        connect(gain1.y, combiTable1Ds2.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, -30}, {-62, -30}, {-62, -30}}, color = {0, 255, 0}));
        connect(gain1.y, abs1.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, 4}, {-62, 4}, {-62, 4}}, color = {0, 255, 0}));
        connect(flange_a, flange_b) annotation (
          Line(points = {{-120, 0}, {-110, 0}, {-110, 40}, {94, 40}, {94, 0}, {100, 0}}));
        connect(torque1.support, support) annotation (
          Line(points = {{80, -6}, {80, -6}, {80, -86}, {0, -86}, {0, -100}, {0, -100}}));
        connect(Fth, abs2.u) annotation (
          Line(points = {{-120, 80}, {-88, 80}, {-88, 80}, {-88, 80}}, color = {0, 255, 0}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{52, -4}, {48, -4}, {48, -30}, {-48, -30}, {-48, -30}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{67, 0}, {73, 0}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{86, 0}, {100, 0}}));
        connect(add1.y, product2.u1) annotation (
          Line(points = {{16, 4}, {32, 4}, {32, -66}, {52, -66}, {52, -66}}, color = {0, 255, 0}));
        connect(abs11.y, product2.u2) annotation (
          Line(points = {{-8, -46}, {20, -46}, {20, -74}, {52, -74}, {52, -74}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{66, -70}, {90, -70}, {90, -80}, {110, -80}, {110, -80}}, color = {191, 0, 0}));
        connect(relSpeedSensor1.flange_b, support) annotation (
          Line(points = {{-94, -40}, {-86, -40}, {-86, -56}, {0, -56}, {0, -100}}));
        connect(relSpeedSensor1.flange_a, flange_a) annotation (
          Line(points = {{-106, -40}, {-110, -40}, {-110, 0}, {-120, 0}}));
        annotation (
          Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Rectangle(origin = {-25, 42}, extent = {{-35, 42}, {85, -26}}), Rectangle(origin = {-1, -42}, extent = {{-59, 28}, {61, -42}}), Rectangle(origin = {13, 23}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-73, -9}, {47, 11}}), Rectangle(origin = {-25, 75}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -13}, {85, 9}}), Rectangle(origin = {-1, -23}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-59, -11}, {61, 9}}), Rectangle(origin = {25, -73}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-85, -11}, {35, 11}}), Ellipse(origin = {26, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Ellipse(origin = {-26, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Text(origin = {25, 138}, extent = {{-25, 12}, {35, -18}}, textString = "Fr"), Text(origin = {-135, 128}, extent = {{-25, 12}, {35, -18}}, textString = "Fth"), Text(origin = {-135, -22}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name"), Ellipse(origin = {26, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Ellipse(origin = {-26, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 20}, {20, -20}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
      end BRG_DoubleRowAngular;

      model BRG_RadialNeedle
        //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
        parameter String BRG_Friction_Filename;
        constant Real w_Threshold = 0.01;
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {80, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {60, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
          Placement(visible = true, transformation(origin = {-54, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {60, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs2 annotation (
          Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fr annotation (
          Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D2(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab2", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, -16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fth annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Add add1 annotation (
          Placement(visible = true, transformation(origin = {10, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
          Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-14, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
          Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs3 annotation (
          Placement(visible = true, transformation(origin = {-28, 80}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(add1.y, product3.u1) annotation (
          Line(points = {{16, 4}, {52, 4}, {52, 4}, {52, 4}}, color = {0, 255, 0}));
        connect(abs2.y, combiTable2D2.u2) annotation (
          Line(points = {{-74, 80}, {-38, 80}, {-38, 70}, {-32, 70}, {-32, -20}, {-22, -20}, {-22, -20}}, color = {0, 255, 0}));
        connect(abs3.y, combiTable2D2.u1) annotation (
          Line(points = {{-28, 74}, {-28, -12}, {-21, -12}}, color = {0, 255, 0}));
        connect(Fr, abs3.u) annotation (
          Line(points = {{-20, 120}, {-20, 120}, {-20, 94}, {-28, 94}, {-28, 88}, {-28, 88}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, abs11.u) annotation (
          Line(points = {{-100, -33}, {-100, -28}, {-80, -28}, {-80, -46}, {-22, -46}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, gain1.u) annotation (
          Line(points = {{-100, -33}, {-100, 0}, {-86, 0}}, color = {0, 255, 0}));
        connect(combiTable2D2.y, add1.u2) annotation (
          Line(points = {{-7, -16}, {-2, -16}, {-2, 0}, {2, 0}}, color = {0, 255, 0}));
        connect(nu_oil_m2ps, combiTable2D1.u1) annotation (
          Line(points = {{-120, -60}, {-36, -60}, {-36, 12}, {-21, 12}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable2D1.u2) annotation (
          Line(points = {{-48, 4}, {-21, 4}}, color = {0, 255, 0}));
        connect(combiTable2D1.y, add1.u1) annotation (
          Line(points = {{-7, 8}, {2, 8}}, color = {0, 255, 0}));
        connect(gain1.y, combiTable1Ds2.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, -30}, {-62, -30}, {-62, -30}}, color = {0, 255, 0}));
        connect(gain1.y, abs1.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, 4}, {-62, 4}, {-62, 4}}, color = {0, 255, 0}));
        connect(flange_a, flange_b) annotation (
          Line(points = {{-120, 0}, {-110, 0}, {-110, 40}, {94, 40}, {94, 0}, {100, 0}}));
        connect(torque1.support, support) annotation (
          Line(points = {{80, -6}, {80, -6}, {80, -86}, {0, -86}, {0, -100}, {0, -100}}));
        connect(Fth, abs2.u) annotation (
          Line(points = {{-120, 80}, {-88, 80}, {-88, 80}, {-88, 80}}, color = {0, 255, 0}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{52, -4}, {48, -4}, {48, -30}, {-48, -30}, {-48, -30}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{67, 0}, {73, 0}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{86, 0}, {100, 0}}));
        connect(add1.y, product2.u1) annotation (
          Line(points = {{16, 4}, {32, 4}, {32, -66}, {52, -66}, {52, -66}}, color = {0, 255, 0}));
        connect(abs11.y, product2.u2) annotation (
          Line(points = {{-8, -46}, {20, -46}, {20, -74}, {52, -74}, {52, -74}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{66, -70}, {90, -70}, {90, -80}, {110, -80}, {110, -80}}, color = {191, 0, 0}));
        connect(relSpeedSensor1.flange_b, support) annotation (
          Line(points = {{-94, -40}, {-86, -40}, {-86, -56}, {0, -56}, {0, -100}}));
        connect(relSpeedSensor1.flange_a, flange_a) annotation (
          Line(points = {{-106, -40}, {-110, -40}, {-110, 0}, {-120, 0}, {-120, 0}}));
        annotation (
          Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Rectangle(origin = {-1, -26}, lineColor = {80, 80, 80}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-51, 10}, {51, -10}}), Polygon(origin = {1, -38}, fillColor = {220, 220, 220}, fillPattern = FillPattern.Solid, points = {{-71, 12}, {-53, 12}, {-53, 2}, {49, 2}, {49, 12}, {69, 12}, {69, -6}, {63, -12}, {-65, -12}, {-71, -6}, {-71, 12}}), Polygon(origin = {-1, 38}, rotation = 180, fillColor = {220, 220, 220}, fillPattern = FillPattern.Solid, points = {{-71, 12}, {-53, 12}, {-53, 2}, {49, 2}, {49, 12}, {69, 12}, {69, -6}, {63, -12}, {-65, -12}, {-71, -6}, {-71, 12}}), Rectangle(origin = {1, 26}, lineColor = {80, 80, 80}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-51, 10}, {51, -10}}), Text(origin = {25, 138}, extent = {{-25, 12}, {35, -18}}, textString = "Fr"), Text(origin = {-135, 128}, extent = {{-25, 12}, {35, -18}}, textString = "Fth"), Text(origin = {-135, -22}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Line(origin = {0, -74}, points = {{0, 24}, {0, -24}}), Text(origin = {0, -140}, lineColor = {0, 0, 255}, extent = {{-120, 20}, {120, -20}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
      end BRG_RadialNeedle;

      model BRG_Taper
        //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter String BRG_Friction_Filename;
        constant Real w_Threshold = 0.01;
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {80, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {60, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
          Placement(visible = true, transformation(origin = {-54, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {60, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs2 annotation (
          Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fr annotation (
          Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D2(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab2", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, -16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fth annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Add add1 annotation (
          Placement(visible = true, transformation(origin = {10, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
          Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-14, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
          Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs3 annotation (
          Placement(visible = true, transformation(origin = {-28, 80}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(add1.y, product3.u1) annotation (
          Line(points = {{16, 4}, {52, 4}, {52, 4}, {52, 4}}, color = {0, 255, 0}));
        connect(abs2.y, combiTable2D2.u2) annotation (
          Line(points = {{-74, 80}, {-38, 80}, {-38, 70}, {-32, 70}, {-32, -20}, {-22, -20}, {-22, -20}}, color = {0, 255, 0}));
        connect(abs3.y, combiTable2D2.u1) annotation (
          Line(points = {{-28, 74}, {-28, -12}, {-21, -12}}, color = {0, 255, 0}));
        connect(Fr, abs3.u) annotation (
          Line(points = {{-20, 120}, {-20, 120}, {-20, 94}, {-28, 94}, {-28, 88}, {-28, 88}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, abs11.u) annotation (
          Line(points = {{-100, -33}, {-100, -28}, {-80, -28}, {-80, -46}, {-22, -46}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, gain1.u) annotation (
          Line(points = {{-100, -33}, {-100, 0}, {-86, 0}}, color = {0, 255, 0}));
        connect(combiTable2D2.y, add1.u2) annotation (
          Line(points = {{-7, -16}, {-2, -16}, {-2, 0}, {2, 0}}, color = {0, 255, 0}));
        connect(nu_oil_m2ps, combiTable2D1.u1) annotation (
          Line(points = {{-120, -60}, {-36, -60}, {-36, 12}, {-21, 12}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable2D1.u2) annotation (
          Line(points = {{-48, 4}, {-21, 4}}, color = {0, 255, 0}));
        connect(combiTable2D1.y, add1.u1) annotation (
          Line(points = {{-7, 8}, {2, 8}}, color = {0, 255, 0}));
        connect(gain1.y, combiTable1Ds2.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, -30}, {-62, -30}, {-62, -30}}, color = {0, 255, 0}));
        connect(gain1.y, abs1.u) annotation (
          Line(points = {{-72, 0}, {-66, 0}, {-66, 4}, {-62, 4}, {-62, 4}}, color = {0, 255, 0}));
        connect(flange_a, flange_b) annotation (
          Line(points = {{-120, 0}, {-110, 0}, {-110, 40}, {94, 40}, {94, 0}, {100, 0}}));
        connect(torque1.support, support) annotation (
          Line(points = {{80, -6}, {80, -6}, {80, -86}, {0, -86}, {0, -100}, {0, -100}}));
        connect(Fth, abs2.u) annotation (
          Line(points = {{-120, 80}, {-88, 80}, {-88, 80}, {-88, 80}}, color = {0, 255, 0}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{52, -4}, {48, -4}, {48, -30}, {-48, -30}, {-48, -30}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{67, 0}, {73, 0}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{86, 0}, {100, 0}}));
        connect(add1.y, product2.u1) annotation (
          Line(points = {{16, 4}, {32, 4}, {32, -66}, {52, -66}, {52, -66}}, color = {0, 255, 0}));
        connect(abs11.y, product2.u2) annotation (
          Line(points = {{-8, -46}, {20, -46}, {20, -74}, {52, -74}, {52, -74}}, color = {0, 255, 0}));
        connect(product2.y, PHI_W) annotation (
          Line(points = {{66, -70}, {90, -70}, {90, -80}, {110, -80}, {110, -80}}, color = {191, 0, 0}));
        connect(relSpeedSensor1.flange_b, support) annotation (
          Line(points = {{-94, -40}, {-86, -40}, {-86, -56}, {0, -56}, {0, -100}, {0, -100}}));
        connect(relSpeedSensor1.flange_a, flange_a) annotation (
          Line(points = {{-106, -40}, {-110, -40}, {-110, 0}, {-120, 0}}));
        annotation (
          Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Rectangle(origin = {-8, -54}, rotation = -30, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-40, 16}, {40, -12}}), Rectangle(origin = {0, -40}, rotation = -30, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-24, 14}, {24, -14}}), Rectangle(origin = {-6, 50}, rotation = 30, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-40, 16}, {40, -12}}), Rectangle(origin = {1.77636e-15, 40}, rotation = 30, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-24, 14}, {24, -14}}), Text(origin = {45, 138}, extent = {{-25, 12}, {35, -18}}, textString = "Fr"), Text(origin = {-135, 128}, extent = {{-25, 12}, {35, -18}}, textString = "Fth"), Text(origin = {-135, -22}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Text(origin = {-75, -132}, lineColor = {0, 0, 255}, extent = {{-25, 12}, {175, -28}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
      end BRG_Taper;

      model BRG_ThrustNeedle
        //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter String BRG_Friction_Filename;
        constant Real w_Threshold = 0.01;
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {80, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {66, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {-50, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
          Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product3 annotation (
          Placement(visible = true, transformation(origin = {60, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D1(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, 26}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fr annotation (
          Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable2Ds combiTable2D2(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab2", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-14, -2}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Fth annotation (
          Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Add add1 annotation (
          Placement(visible = true, transformation(origin = {10, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
          Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-74, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-54, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs3 annotation (
          Placement(visible = true, transformation(origin = {-28, 80}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(combiTable1Ds2.u, relSpeedSensor1.w_rel) annotation (
          Line(points = {{-58, -30}, {-90, -30}, {-90, 34}, {-90, 34}, {-90, 34}}, color = {0, 255, 0}));
        connect(add1.y, product3.u1) annotation (
          Line(points = {{16, 4}, {52, 4}, {52, 4}, {52, 4}}, color = {0, 255, 0}));
        connect(Fth, combiTable2D2.u2) annotation (
          Line(points = {{-120, 80}, {-38, 80}, {-38, 70}, {-32, 70}, {-32, -6}, {-22, -6}, {-22, -6}}, color = {0, 255, 0}));
        connect(abs3.y, combiTable2D2.u1) annotation (
          Line(points = {{-28, 74}, {-28, 74}, {-28, 2}, {-22, 2}, {-22, 2}}, color = {0, 255, 0}));
        connect(Fr, abs3.u) annotation (
          Line(points = {{-20, 120}, {-20, 120}, {-20, 94}, {-28, 94}, {-28, 88}, {-28, 88}}, color = {0, 255, 0}));
        connect(gain1.y, abs1.u) annotation (
          Line(points = {{-68, 4}, {-58, 4}, {-58, 4}, {-58, 4}}, color = {0, 255, 0}));
        connect(relSpeedSensor1.w_rel, gain1.u) annotation (
          Line(points = {{-90, 34}, {-90, 34}, {-90, 4}, {-82, 4}, {-82, 4}}, color = {0, 255, 0}));
        connect(abs11.u, relSpeedSensor1.w_rel) annotation (
          Line(points = {{-62, -70}, {-90, -70}, {-90, 33}}, color = {0, 255, 0}));
        connect(flange_a, relSpeedSensor1.flange_a) annotation (
          Line(points = {{-110, 0}, {-100, 0}, {-100, 40}, {-96, 40}}));
        connect(flange_b, relSpeedSensor1.flange_b) annotation (
          Line(points = {{100, 0}, {90, 0}, {90, 40}, {-84, 40}}));
        connect(torque1.support, flange_a) annotation (
          Line(points = {{80, -6}, {80, -40}, {-100, -40}, {-100, 0}, {-110, 0}}));
        connect(product3.u2, combiTable1Ds2.y[1]) annotation (
          Line(points = {{52, -4}, {48, -4}, {48, -30}, {-43, -30}}, color = {0, 255, 0}));
        connect(abs1.y, combiTable2D1.u2) annotation (
          Line(points = {{-43, 4}, {-40, 4}, {-40, 22}, {-21, 22}}, color = {0, 255, 0}));
        connect(combiTable2D2.y, add1.u2) annotation (
          Line(points = {{-8, -2}, {-2, -2}, {-2, 0}, {2, 0}, {2, 0}}, color = {0, 255, 0}));
        connect(combiTable2D1.y, add1.u1) annotation (
          Line(points = {{-8, 26}, {-2, 26}, {-2, 8}, {2, 8}, {2, 8}}, color = {0, 255, 0}));
        connect(product3.y, torque1.tau) annotation (
          Line(points = {{67, 0}, {73, 0}}, color = {0, 255, 0}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{86, 0}, {100, 0}}));
        connect(nu_oil_m2ps, combiTable2D1.u1) annotation (
          Line(points = {{-120, -60}, {-36, -60}, {-36, 30}, {-21, 30}}, color = {0, 255, 0}));
        connect(product2.u2, abs11.y) annotation (
          Line(points = {{58, -84}, {20, -84}, {20, -70}, {-48, -70}, {-48, -70}}, color = {0, 255, 0}));
        connect(product2.u1, add1.y) annotation (
          Line(points = {{58, -76}, {30, -76}, {30, 4}, {16, 4}, {16, 4}}, color = {0, 255, 0}));
        connect(PHI_W, product2.y) annotation (
          Line(points = {{110, -80}, {74, -80}, {74, -80}, {72, -80}}, color = {191, 0, 0}));
        annotation (
          Icon(coordinateSystem(initialScale = 0.1), graphics={  Polygon(origin = {-12, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{20, 100}, {-19, 100}, {-25, 94}, {-25, -94}, {-19, -100}, {20, -100}, {20, 100}}), Rectangle(origin = {8, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{25, 80}, {-25, -80}}), Line(origin = {67, 0}, points = {{33, 0}, {-33, 0}}), Text(origin = {25, 138}, extent = {{-25, 12}, {35, -18}}, textString = "Fr"), Text(origin = {-135, 128}, extent = {{-25, 12}, {35, -18}}, textString = "Fth"), Text(origin = {-135, -22}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Line(origin = {-69, 0}, points = {{31, 0}, {-31, 0}}), Text(origin = {-75, -132}, lineColor = {0, 0, 255}, extent = {{-25, 12}, {175, -28}}, textString = "%name")}));
      end BRG_ThrustNeedle;

      model Clutch
        parameter Real tanhCoeff = -350;
        Modelica.Blocks.Interfaces.RealInput tau_clutch_cap annotation (
          Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
          Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
          Placement(visible = true, transformation(origin = {-66, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
          Placement(visible = true, transformation(origin = {72, 4.44089e-16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product1 annotation (
          Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Product product2 annotation (
          Placement(visible = true, transformation(origin = {34, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs11 annotation (
          Placement(visible = true, transformation(origin = {-12, -24}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {-12, 90}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
          Placement(visible = true, transformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs1 annotation (
          Placement(visible = true, transformation(origin = {70, -100}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Utilities.Tanh tanh(Coeff = tanhCoeff) annotation (
          Placement(visible = true, transformation(origin = {-40, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      equation
        connect(product1.y, product2.u1) annotation (
          Line(points = {{-6, 0}, {12, 0}, {12, -16}, {26, -16}, {26, -16}}, color = {0, 255, 0}));
        connect(product1.y, torque1.tau) annotation (
          Line(points = {{-6, 0}, {64, 0}, {64, 0}, {64, 0}}, color = {0, 255, 0}));
        connect(firstOrder2.y, product1.u1) annotation (
          Line(points = {{-18, 90}, {-24, 90}, {-24, 4}, {-20, 4}, {-20, 4}}, color = {0, 255, 0}));
        connect(tau_clutch_cap, firstOrder2.u) annotation (
          Line(points = {{0, 120}, {0, 120}, {0, 90}, {-4, 90}, {-4, 90}}, color = {0, 255, 0}));
        connect(abs11.u, relSpeedSensor1.w_rel) annotation (
          Line(points = {{-20, -24}, {-66, -24}, {-66, 24}, {-66, 24}}, color = {0, 255, 0}));
        connect(product2.u2, abs11.y) annotation (
          Line(points = {{26, -24}, {-6, -24}, {-6, -24}, {-6, -24}}, color = {0, 255, 0}));
        connect(flange_a, relSpeedSensor1.flange_a) annotation (
          Line(points = {{-100, 0}, {-88, 0}, {-88, 30}, {-72, 30}}));
        connect(flange_b, relSpeedSensor1.flange_b) annotation (
          Line(points = {{100, 0}, {90, 0}, {90, 30}, {-60, 30}}));
        connect(torque1.support, flange_a) annotation (
          Line(points = {{72, -6}, {72, -40}, {-88, -40}, {-88, 0}, {-100, 0}}));
        connect(torque1.flange, flange_b) annotation (
          Line(points = {{78, 0}, {100, 0}, {100, 0}, {100, 0}}));
        connect(product2.y, abs1.u) annotation (
          Line(points = {{41, -20}, {46, -20}, {46, -100}, {63, -100}}, color = {0, 255, 0}));
        connect(abs1.y, PHI_W) annotation (
          Line(points = {{76, -100}, {102, -100}, {102, -100}, {110, -100}}, color = {191, 0, 0}));
        connect(tanh.y, product1.u2) annotation (
          Line(points = {{-33, -4}, {-20, -4}}, color = {0, 255, 0}));
        connect(tanh.u, relSpeedSensor1.w_rel) annotation (
          Line(points = {{-47, -4}, {-66, -4}, {-66, 24}}, color = {0, 255, 0}));
        annotation (
          Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-120, 26}, {120, -26}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
          Diagram,
          __OpenModelica_commandLineOptions = "",
          experiment(StartTime = 0, StopTime = 180, Tolerance = 1e-06, Interval = 0.1));
      end Clutch;
    end Elements;

    //    model Actuator_eLoss
    //      Modelica.Blocks.Interfaces.RealInput I_TM_CNT_ACT_A annotation(
    //        Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    //      Modelica.Blocks.Interfaces.RealInput V_BT_PNT_Lo_V annotation(
    //        Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    //      Modelica.Blocks.Interfaces.RealOutput PHI_TM_PNT_Actuator_W annotation(
    //        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //      Modelica.Blocks.Math.Product lossPower annotation(
    //        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation(
    //        Placement(visible = true, transformation(origin = {-58, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    //    equation
    //      connect(firstOrder1.y, lossPower.u1) annotation(
    //        Line(points = {{-52, 40}, {-20, 40}, {-20, 6}, {-12, 6}, {-12, 6}}, color = {0, 0, 127}));
    //      connect(I_TM_CNT_ACT_A, firstOrder1.u) annotation(
    //        Line(points = {{-120, 40}, {-66, 40}, {-66, 40}, {-66, 40}}, color = {0, 0, 127}));
    //      connect(lossPower.y, PHI_TM_PNT_Actuator_W) annotation(
    //        Line(points = {{12, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
    //      connect(V_BT_PNT_Lo_V, lossPower.u2) annotation(
    //        Line(points = {{-120, -40}, {-20, -40}, {-20, -6}, {-12, -6}, {-12, -6}}, color = {0, 0, 127}));
    //      annotation(
    //        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 255}, extent = {{-100, 40}, {100, -40}}, textString = "%name")}));
    //    end Actuator_eLoss;
    //    model EOP_eLoss
    //      Modelica.Blocks.Interfaces.RealInput I_TM_CNT_EOP_A annotation(
    //        Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    //      Modelica.Blocks.Interfaces.RealInput V_BT_PNT_Lo_V annotation(
    //        Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    //      Modelica.Blocks.Interfaces.RealOutput PHI_TM_PNT_EOP_W annotation(
    //        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //      Modelica.Blocks.Math.Product lossPower annotation(
    //        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation(
    //        Placement(visible = true, transformation(origin = {-58, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    //    equation
    //      connect(firstOrder1.y, lossPower.u1) annotation(
    //        Line(points = {{-52, 40}, {-20, 40}, {-20, 6}, {-12, 6}, {-12, 6}}, color = {0, 0, 127}));
    //      connect(I_TM_CNT_EOP_A, firstOrder1.u) annotation(
    //        Line(points = {{-120, 40}, {-66, 40}, {-66, 40}, {-66, 40}}, color = {0, 0, 127}));
    //      connect(lossPower.y, PHI_TM_PNT_EOP_W) annotation(
    //        Line(points = {{12, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
    //      connect(V_BT_PNT_Lo_V, lossPower.u2) annotation(
    //        Line(points = {{-120, -40}, {-20, -40}, {-20, -6}, {-12, -6}, {-12, -6}}, color = {0, 0, 127}));
    //      annotation(
    //        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 255}, extent = {{-100, 40}, {100, -40}}, textString = "%name")}));
    //    end EOP_eLoss;

    package Calc
      model Calc_GearLoss
        parameter String Gear_Friction_Filename;
        parameter Real Oil_Viscosity_Breakpoint[:];
        constant Real w_Threshold = 0.01;
        Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
          Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs_GearTorque(generateEvent = false) annotation (
          Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput Gear_Loss annotation (
          Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain radps2rpm(k = 60 / (2 * Modelica.Constants.pi)) annotation (
          Placement(visible = true, transformation(origin = {-78, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Blocks.Math.Abs abs_Gear_rpm annotation (
          Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Blocks.Math.Product product annotation (
          Placement(visible = true, transformation(origin = {68, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D(filename = Gear_Friction_Filename, z_ax = Oil_Viscosity_Breakpoint) annotation (
          Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Gear_w1 annotation (
          Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Gear_Torque annotation (
          Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
          Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput Gear_w2 annotation (
          Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -26}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      equation
        connect(Gear_Torque, abs_GearTorque.u) annotation (
          Line(points = {{-120, 60}, {-50, 60}}, color = {0, 0, 127}));
        connect(abs_GearTorque.y, combiTable3D.u) annotation (
          Line(points = {{-31, 60}, {-10, 60}, {-10, 28}, {-2, 28}}, color = {0, 0, 127}));
        connect(abs_Gear_rpm.y, combiTable3D.u1) annotation (
          Line(points = {{-31, 20}, {-2, 20}}, color = {0, 0, 127}));
        connect(nu_oil_m2ps, combiTable3D.u2) annotation (
          Line(points = {{-120, -60}, {-10, -60}, {-10, 12}, {-2, 12}}, color = {0, 0, 127}));
        connect(Gear_w1, radps2rpm.u) annotation (
          Line(points = {{-120, 20}, {-88, 20}}, color = {0, 0, 127}));
        connect(abs_Gear_rpm.u, radps2rpm.y) annotation (
          Line(points = {{-50, 20}, {-69, 20}}, color = {0, 0, 127}));
        connect(combiTable1Ds.y[1], product.u2) annotation (
          Line(points = {{-31, -20}, {40, -20}, {40, -5}, {58, -5}}, color = {0, 0, 127}));
        connect(combiTable3D.y, product.u1) annotation (
          Line(points = {{21, 20}, {40, 20}, {40, 5}, {58, 5}}, color = {0, 0, 127}));
        connect(product.y, Gear_Loss) annotation (
          Line(points = {{77, 0}, {110, 0}}, color = {0, 0, 127}));
        connect(Gear_w2, combiTable1Ds.u) annotation (
          Line(points = {{-120, -20}, {-50, -20}, {-50, -20}, {-50, -20}}, color = {0, 0, 127}));
        annotation (
          Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-140, 26}, {140, -26}}, textString = "%name"), Text(origin = {0, 10}, extent = {{-100, 40}, {100, -10}}, textString = "Gear"), Text(origin = {0, -40}, extent = {{-100, 40}, {100, -10}}, textString = "Loss")}, coordinateSystem(initialScale = 0.1)));
      end Calc_GearLoss;

      model BrgLoadDistribution_TM
        //入力:各ギアで発生するスラスト荷重(N)
        Modelica.Blocks.Interfaces.RealInput P1sKa annotation (
          Placement(visible = true, transformation(origin = {-480, 180}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, 310}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput P1rKa annotation (
          Placement(visible = true, transformation(origin = {-480, 150}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, 230}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput P2sKa annotation (
          Placement(visible = true, transformation(origin = {-480, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, 130}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput P2rKa annotation (
          Placement(visible = true, transformation(origin = {-480, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput P3sKa annotation (
          Placement(visible = true, transformation(origin = {-480, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, -52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput P3rKa annotation (
          Placement(visible = true, transformation(origin = {-480, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, -132}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput P4sKa annotation (
          Placement(visible = true, transformation(origin = {-480, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, -230}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput P4rKa annotation (
          Placement(visible = true, transformation(origin = {-480, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, -310}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        //出力:各SNベアリングへの荷重(N)
        //    F_SN1[1] → ラジアル荷重
        //    F_SN1[2] → スラスト荷重
        Modelica.Blocks.Interfaces.RealOutput F_SN1[2] annotation (
          Placement(visible = true, transformation(origin = {470, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 270}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN2[2] annotation (
          Placement(visible = true, transformation(origin = {470, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN3[2] annotation (
          Placement(visible = true, transformation(origin = {470, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN5[2] annotation (
          Placement(visible = true, transformation(origin = {470, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN6[2] annotation (
          Placement(visible = true, transformation(origin = {470, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN7[2] annotation (
          Placement(visible = true, transformation(origin = {470, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN8[2] annotation (
          Placement(visible = true, transformation(origin = {470, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN9[2] annotation (
          Placement(visible = true, transformation(origin = {470, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN10[2] annotation (
          Placement(visible = true, transformation(origin = {470, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput F_SN11[2] annotation (
          Placement(visible = true, transformation(origin = {470, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -270}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Components.Fixed fixed annotation (
          Placement(visible = true, transformation(origin = {-376, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (
          Placement(visible = true, transformation(origin = {306, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap1(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
          Placement(visible = true, transformation(origin = {-320, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap2_3(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
          Placement(visible = true, transformation(origin = {-220, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap5(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
          Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap6(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
          Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap7(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
          Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap8_9_10(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
          Placement(visible = true, transformation(origin = {180, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap11(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
          Placement(visible = true, transformation(origin = {280, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Components.Mass P1Sun(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
          Placement(visible = true, transformation(origin = {-280, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Components.Mass P2Ring_P3Sun_P4Sun(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
          Placement(visible = true, transformation(origin = {-180, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Components.Mass P1Ring(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
          Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Components.Mass P2Sun(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
          Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Components.Mass P3Ring(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
          Placement(visible = true, transformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Components.Mass P4Ring(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
          Placement(visible = true, transformation(origin = {220, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sensors.ForceSensor SN1 annotation (
          Placement(visible = true, transformation(origin = {-350, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sensors.ForceSensor SN2_3 annotation (
          Placement(visible = true, transformation(origin = {-250, -6.66134e-16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sensors.ForceSensor SN5 annotation (
          Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sensors.ForceSensor SN6 annotation (
          Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sensors.ForceSensor SN7 annotation (
          Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sensors.ForceSensor SN8_9_10 annotation (
          Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sensors.ForceSensor SN11 annotation (
          Placement(visible = true, transformation(origin = {250, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sources.Force P1SunKa annotation (
          Placement(visible = true, transformation(origin = {-320, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sources.Force P2RingP3SunP4SunKa annotation (
          Placement(visible = true, transformation(origin = {-220, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sources.Force P1RingP2CarrierKa annotation (
          Placement(visible = true, transformation(origin = {-120, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sources.Force P2SunKa annotation (
          Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sources.Force P3RingKa annotation (
          Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Mechanics.Translational.Sources.Force P4RingKa annotation (
          Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum multiSum(nu = 3) annotation (
          Placement(visible = true, transformation(origin = {-260, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex21 annotation (
          Placement(visible = true, transformation(origin = {410, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex22 annotation (
          Placement(visible = true, transformation(origin = {410, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex23 annotation (
          Placement(visible = true, transformation(origin = {410, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex24 annotation (
          Placement(visible = true, transformation(origin = {410, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex25 annotation (
          Placement(visible = true, transformation(origin = {410, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex26 annotation (
          Placement(visible = true, transformation(origin = {410, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex27 annotation (
          Placement(visible = true, transformation(origin = {410, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex28 annotation (
          Placement(visible = true, transformation(origin = {410, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex29 annotation (
          Placement(visible = true, transformation(origin = {410, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex210 annotation (
          Placement(visible = true, transformation(origin = {410, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Sources.Constant const3(k = 0) annotation (
          Placement(visible = true, transformation(origin = {310, -206}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(SN6.flange_b, elastoGap6.flange_a) annotation (
          Line(points = {{-40, 0}, {-30, 0}}, color = {0, 127, 0}));
        connect(elastoGap6.flange_b, P2Sun.flange_a) annotation (
          Line(points = {{-10, 0}, {10, 0}}, color = {0, 127, 0}));
        connect(P2Sun.flange_b, SN7.flange_a) annotation (
          Line(points = {{30, 0}, {40, 0}}, color = {0, 127, 0}));
        connect(elastoGap7.flange_b, P3Ring.flange_a) annotation (
          Line(points = {{90, 0}, {110, 0}}, color = {0, 127, 0}));
        connect(SN8_9_10.flange_b, elastoGap8_9_10.flange_a) annotation (
          Line(points = {{160, 0}, {170, 0}}, color = {0, 127, 0}));
        connect(SN5.flange_b, elastoGap5.flange_a) annotation (
          Line(points = {{-140, 0}, {-130, 0}}, color = {0, 127, 0}));
        connect(elastoGap5.flange_b, P1Ring.flange_a) annotation (
          Line(points = {{-110, 0}, {-90, 0}}, color = {0, 127, 0}));
        connect(P1Ring.flange_b, SN6.flange_a) annotation (
          Line(points = {{-70, 0}, {-60, 0}}, color = {0, 127, 0}));
        connect(P2Ring_P3Sun_P4Sun.flange_b, SN5.flange_a) annotation (
          Line(points = {{-170, 0}, {-160, 0}}, color = {0, 127, 0}));
        connect(SN2_3.flange_b, elastoGap2_3.flange_a) annotation (
          Line(points = {{-240, 0}, {-230, 0}}, color = {0, 127, 0}));
        connect(P1Sun.flange_b, SN2_3.flange_a) annotation (
          Line(points = {{-270, 0}, {-260, 0}}, color = {0, 127, 0}));
        connect(elastoGap1.flange_b, P1Sun.flange_a) annotation (
          Line(points = {{-310, 0}, {-290, 0}}, color = {0, 127, 0}));
        connect(SN1.flange_b, elastoGap1.flange_a) annotation (
          Line(points = {{-340, 0}, {-330, 0}}, color = {0, 127, 0}));
        connect(fixed.flange, SN1.flange_a) annotation (
          Line(points = {{-376, 0}, {-360, 0}}, color = {0, 127, 0}));
        connect(P4Ring.flange_b, SN11.flange_a) annotation (
          Line(points = {{230, 0}, {240, 0}}, color = {0, 127, 0}));
        connect(SN11.flange_b, elastoGap11.flange_a) annotation (
          Line(points = {{260, 0}, {270, 0}}, color = {0, 127, 0}));
        connect(elastoGap11.flange_b, fixed1.flange) annotation (
          Line(points = {{290, 0}, {306, 0}}, color = {0, 127, 0}));
        connect(P4RingKa.flange, P4Ring.flange_a) annotation (
          Line(points = {{180, 50}, {200, 50}, {200, 0}, {210, 0}}, color = {0, 127, 0}));
        connect(P3RingKa.flange, P3Ring.flange_a) annotation (
          Line(points = {{80, 70}, {100, 70}, {100, 0}, {110, 0}}, color = {0, 127, 0}));
        connect(P2SunKa.flange, P2Sun.flange_a) annotation (
          Line(points = {{-20, 90}, {0, 90}, {0, 0}, {10, 0}}, color = {0, 127, 0}));
        connect(P1RingP2CarrierKa.flange, P1Ring.flange_a) annotation (
          Line(points = {{-110, 110}, {-100, 110}, {-100, 0}, {-90, 0}}, color = {0, 127, 0}));
        connect(P2RingP3SunP4SunKa.flange, P2Ring_P3Sun_P4Sun.flange_a) annotation (
          Line(points = {{-210, 130}, {-200, 130}, {-200, 0}, {-190, 0}}, color = {0, 127, 0}));
        connect(P1SunKa.flange, P1Sun.flange_a) annotation (
          Line(points = {{-310, 150}, {-300, 150}, {-300, 0}, {-290, 0}}, color = {0, 127, 0}));
        connect(P4rKa, P4RingKa.f) annotation (
          Line(points = {{-480, -120}, {-420, -120}, {-420, 50}, {158, 50}}, color = {0, 0, 127}));
        connect(P3rKa, P3RingKa.f) annotation (
          Line(points = {{-480, -30}, {-430, -30}, {-430, 70}, {58, 70}}, color = {0, 0, 127}));
        connect(P1sKa, P1SunKa.f) annotation (
          Line(points = {{-480, 180}, {-420, 180}, {-420, 150}, {-332, 150}}, color = {0, 0, 127}));
        connect(multiSum.y, P2RingP3SunP4SunKa.f) annotation (
          Line(points = {{-248, 130}, {-232, 130}}, color = {0, 0, 127}));
        connect(P1rKa, P1RingP2CarrierKa.f) annotation (
          Line(points = {{-480, 150}, {-430, 150}, {-430, 110}, {-132, 110}}, color = {0, 0, 127}));
        connect(P2sKa, P2SunKa.f) annotation (
          Line(points = {{-480, 90}, {-42, 90}}, color = {0, 0, 127}));
        connect(P2rKa, multiSum.u[1]) annotation (
          Line(points = {{-480, 60}, {-440, 60}, {-440, 130}, {-270, 130}}, color = {0, 0, 127}));
        connect(P3sKa, multiSum.u[2]) annotation (
          Line(points = {{-480, 0}, {-440, 0}, {-440, 130}, {-270, 130}}, color = {0, 0, 127}));
        connect(P4sKa, multiSum.u[3]) annotation (
          Line(points = {{-480, -90}, {-440, -90}, {-440, 130}, {-270, 130}}, color = {0, 0, 127}));
        connect(SN7.f, multiplex26.u1[1]) annotation (
          Line(points = {{42, -11}, {42, -74}, {398, -74}}, color = {0, 0, 127}));
        connect(SN6.f, multiplex25.u1[1]) annotation (
          Line(points = {{-58, -11}, {-58, -60}, {370, -60}, {370, -44}, {398, -44}}, color = {0, 0, 127}));
        connect(SN5.f, multiplex24.u1[1]) annotation (
          Line(points = {{-158, -11}, {-158, -48}, {360, -48}, {360, -14}, {398, -14}}, color = {0, 0, 127}));
        connect(SN1.f, multiplex21.u1[1]) annotation (
          Line(points = {{-358, -11}, {-358, -29.5}, {340, -29.5}, {340, 76}, {398, 76}}, color = {0, 0, 127}));
        connect(multiplex210.y, F_SN11) annotation (
          Line(points = {{421, -200}, {470, -200}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex29.y, F_SN10) annotation (
          Line(points = {{421, -170}, {470, -170}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex28.y, F_SN9) annotation (
          Line(points = {{421, -140}, {470, -140}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex27.y, F_SN8) annotation (
          Line(points = {{421, -110}, {470, -110}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex26.y, F_SN7) annotation (
          Line(points = {{421, -80}, {470, -80}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex25.y, F_SN6) annotation (
          Line(points = {{421, -50}, {470, -50}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex24.y, F_SN5) annotation (
          Line(points = {{421, -20}, {470, -20}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex23.y, F_SN3) annotation (
          Line(points = {{421, 10}, {470, 10}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex22.y, F_SN2) annotation (
          Line(points = {{421, 40}, {470, 40}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex21.y, F_SN1) annotation (
          Line(points = {{421, 70}, {470, 70}}, color = {0, 0, 127}, thickness = 0.5));
        connect(SN7.flange_b, elastoGap7.flange_a) annotation (
          Line(points = {{60, 0}, {70, 0}}, color = {0, 127, 0}));
        connect(P3Ring.flange_b, SN8_9_10.flange_a) annotation (
          Line(points = {{130, 0}, {140, 0}}, color = {0, 127, 0}));
        connect(elastoGap2_3.flange_b, P2Ring_P3Sun_P4Sun.flange_a) annotation (
          Line(points = {{-210, 0}, {-190, 0}}, color = {0, 127, 0}));
        connect(elastoGap8_9_10.flange_b, P4Ring.flange_a) annotation (
          Line(points = {{190, 0}, {210, 0}}, color = {0, 127, 0}));
        connect(SN2_3.f, multiplex23.u1[1]) annotation (
          Line(points = {{-258, -10}, {-258, -40}, {350, -40}, {350, 16}, {398, 16}}, color = {0, 0, 127}));
        connect(SN2_3.f, multiplex22.u1[1]) annotation (
          Line(points = {{-258, -10}, {-258, -40}, {350, -40}, {350, 46}, {398, 46}}, color = {0, 0, 127}));
        connect(SN8_9_10.f, multiplex29.u1[1]) annotation (
          Line(points = {{142, -10}, {142, -84}, {350, -84}, {350, -164}, {398, -164}}, color = {0, 0, 127}));
        connect(const3.y, multiplex210.u2[1]) annotation (
          Line(points = {{321, -206}, {398, -206}}, color = {0, 0, 127}));
        connect(const3.y, multiplex29.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, -176}, {398, -176}}, color = {0, 0, 127}));
        connect(const3.y, multiplex28.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, -146}, {398, -146}}, color = {0, 0, 127}));
        connect(const3.y, multiplex27.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, -116}, {398, -116}}, color = {0, 0, 127}));
        connect(const3.y, multiplex25.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, -56}, {398, -56}}, color = {0, 0, 127}));
        connect(const3.y, multiplex26.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, -86}, {398, -86}}, color = {0, 0, 127}));
        connect(const3.y, multiplex24.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, -26}, {398, -26}}, color = {0, 0, 127}));
        connect(const3.y, multiplex23.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, 4}, {398, 4}}, color = {0, 0, 127}));
        connect(const3.y, multiplex22.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, 34}, {398, 34}}, color = {0, 0, 127}));
        connect(const3.y, multiplex21.u2[1]) annotation (
          Line(points = {{321, -206}, {380, -206}, {380, 64}, {398, 64}}, color = {0, 0, 127}));
        connect(SN8_9_10.f, multiplex28.u1[1]) annotation (
          Line(points = {{142, -10}, {142, -84}, {350, -84}, {350, -134}, {398, -134}}, color = {0, 0, 127}));
        connect(SN8_9_10.f, multiplex27.u1[1]) annotation (
          Line(points = {{142, -10}, {142, -84}, {350, -84}, {350, -104}, {398, -104}}, color = {0, 0, 127}));
        connect(SN11.f, multiplex210.u1[1]) annotation (
          Line(points = {{242, -10}, {242, -94}, {340, -94}, {340, -194}, {398, -194}}, color = {0, 0, 127}));
        annotation (
          Diagram(coordinateSystem(extent = {{-460, -240}, {460, 240}})),
          Icon(coordinateSystem(extent = {{-160, -360}, {160, 360}}, initialScale = 0.1), graphics={  Rectangle(origin = {40, 0}, extent = {{-200, 360}, {120, -360}}), Text(origin = {-26, 5}, extent = {{28, 85}, {186, 5}}, textString = "SN1"), Text(origin = {24, 387}, extent = {{-164, -47}, {-44, -187}}, textString = "P1K"), Text(origin = {22, 203}, extent = {{-162, -43}, {-42, -183}}, textString = "P2K"), Text(origin = {24, 27}, extent = {{-164, -47}, {-44, -187}}, textString = "P3K"), Text(origin = {24, -153}, extent = {{-164, -47}, {-44, -187}}, textString = "P4K"), Text(origin = {-26, -95}, extent = {{28, 85}, {186, 5}}, textString = "SN11"), Text(origin = {-10, -57}, extent = {{12, 85}, {170, 25}}, textString = "～"), Text(origin = {2, -374}, lineColor = {0, 0, 255}, extent = {{-282, 14}, {278, -46}}, textString = "%name")}),
          version = "");
      end BrgLoadDistribution_TM;

      model BrgLoadDistribution_DF_A1A2
        //入力1:HYP歯面荷重(N)
        //     GearLoad[1] → Fxp
        //     GearLoad[2] → Fyp
        //     GearLoad[3] → Fzp
        Modelica.Blocks.Interfaces.RealInput GearLoad[3] annotation (
          Placement(visible = true, transformation(origin = {120, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
        //入力2:油温(degC)
        Modelica.Blocks.Interfaces.RealInput Toil annotation (
          Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        //出力1:AGB1への荷重(N)
        //     F_AGB1[1] → ラジアル荷重
        //     F_AGB1[2] → スラスト荷重
        Modelica.Blocks.Interfaces.RealOutput F_AGB1[2] annotation (
          Placement(visible = true, transformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
        //出力2:AGB2への荷重(N)
        //     F_AGB2[1] → ラジアル荷重
        //     F_AGB2[2] → スラスト荷重
        Modelica.Blocks.Interfaces.RealOutput F_AGB2[2] annotation (
          Placement(visible = true, transformation(origin = {-110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
        //入力パラメータ
        parameter Real a, b;
        parameter Real D;
        parameter Real alpha_AGB1, alpha_AGB2;
        parameter Real beta_AGB1, beta_AGB2;
        parameter Real Y1, Y2;
        //ローカル変数
        Real Fxp, Fyp, Fzp;
        Real Fr_AGB1, Fr_AGB2;
        Real Fth_AGB1, Fth_AGB2;
        Real Fth_out;
        Real Fpre_AGB1, Fpre_AGB2;
        Real Cond1, Cond2;
      equation
        // 入力
        Fxp = GearLoad[1];
        Fyp = GearLoad[2];
        Fzp = GearLoad[3];
        // ギヤで発生するラジアル荷重計算
        Fr_AGB1 = sqrt((b / a * Fzp) ^ 2 + (b / a * Fyp - D / (2 * a) * Fxp) ^ 2);
        Fr_AGB2 = sqrt(((a + b) / a * Fzp) ^ 2 + ((a + b) / a * Fyp - D / (2 * a) * Fxp) ^ 2);
        // ギヤで発生するスラスト荷重計算（誘起スラストなし、ARG2 → ARG1 が正）
        Fth_out = Fxp;
        // BRGの受け持ちスラスト荷重計算（誘起スラスト考慮）
        Fpre_AGB1 = alpha_AGB1 * Toil + beta_AGB1;
        Fpre_AGB2 = alpha_AGB2 * Toil + beta_AGB2;
        Cond1 = (1 + tanh(0.5 * (Fr_AGB2 / Y2 - Fr_AGB1 / Y1) - Fth_out)) / 2;
        Cond2 = 1 - Cond1;
        Fth_AGB1 = Cond1 * (0.5 * Fr_AGB2 / Y2 - Fth_out + Fpre_AGB1) + Cond2 * (0.5 * Fr_AGB1 / Y1 + Fpre_AGB1);
        Fth_AGB2 = Cond1 * (0.5 * Fr_AGB2 / Y2 + Fpre_AGB2) + Cond2 * (0.5 * Fr_AGB1 / Y1 + Fth_out + Fpre_AGB2);
        // BRG1へ出力
        F_AGB1[1] = Fr_AGB1;
        F_AGB1[2] = Fth_AGB1;
        // BRG2へ出力
        F_AGB2[1] = Fr_AGB2;
        F_AGB2[2] = Fth_AGB2;
        annotation (
          Icon(graphics={  Rectangle(origin = {-88, 90}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 10}, {188, -190}}), Polygon(points = {{-10, 40}, {-10, -40}, {10, -20}, {10, 20}, {-10, 40}}), Polygon(origin = {40, -30}, points = {{-50, -10}, {50, -10}, {30, 10}, {-30, 10}, {-50, -10}}), Rectangle(origin = {-24, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {-2, -18}}), Rectangle(origin = {-72, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {-2, -18}}), Polygon(origin = {-32, -27}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, points = {{-2, 5}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 5}, {-2, 5}}), Polygon(origin = {-80, -27}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, points = {{-2, 5}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 5}, {-2, 5}}), Polygon(origin = {-54, -31}, rotation = 270, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-2, 11}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 11}, {-2, 11}}), Text(origin = {-23, 9}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-23, -17}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-71, 9}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-71, -17}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Line(origin = {38.01, 9.95}, points = {{-130, -10}, {-30, -10}}, pattern = LinePattern.DashDot), Rectangle(origin = {38, 26}, rotation = 270, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {0, -18}}), Text(origin = {35, 29}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Rectangle(origin = {38, -70}, rotation = 270, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-16, 22}, {-2, -18}}), Line(origin = {58.33, 29.95}, points = {{-18, 30}, {-18, -110}}, pattern = LinePattern.DashDot), Text(origin = {63, 29}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {35, -65}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {63, -65}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Polygon(origin = {4, -39}, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Polygon(origin = {0, -15}, rotation = 200, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Polygon(origin = {-8, -27}, rotation = 270, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Text(origin = {0, -124}, lineColor = {0, 0, 255}, extent = {{-180, 24}, {180, -16}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
      end BrgLoadDistribution_DF_A1A2;

      model BrgLoadDistribution_DF_T1T2
        //入力1:HYP歯面荷重(N)
        //     GearLoad[1] → Fxp
        //     GearLoad[2] → Fyp
        //     GearLoad[3] → Fzp
        Modelica.Blocks.Interfaces.RealInput GearLoad[3] annotation (
          Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        //入力2:油温(degC)
        Modelica.Blocks.Interfaces.RealInput Toil annotation (
          Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        //出力1:TRB1への荷重(N)
        //     F_TRB1[1] → ラジアル荷重
        //     F_TRB1[2] → スラスト荷重
        Modelica.Blocks.Interfaces.RealOutput F_TRB1[2] annotation (
          Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        //出力2:TRB2への荷重(N)
        //     F_TRB2[1] → ラジアル荷重
        //     F_TRB2[2] → スラスト荷重
        Modelica.Blocks.Interfaces.RealOutput F_TRB2[2] annotation (
          Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        //入力パラメータ
        parameter Real c, d;
        parameter Real D;
        parameter Real alpha_TRB1, alpha_TRB2;
        parameter Real beta_TRB1, beta_TRB2;
        parameter Real Y1, Y2;
        //ローカル変数
        Real Fxp, Fyp, Fzp;
        Real Fr_TRB1, Fr_TRB2;
        Real Fth_TRB1, Fth_TRB2;
        Real Fth_out;
        Real Fpre_TRB1, Fpre_TRB2;
        Real Cond1, Cond2;
      equation
        // 入力
        Fxp = GearLoad[1];
        Fyp = GearLoad[2];
        Fzp = GearLoad[3];
        // ギヤで発生するラジアル荷重計算
        Fr_TRB1 = sqrt((c / (c + d) * Fzp) ^ 2 + (c / (c + d) * Fxp + D / 2 / (c + d) * Fyp) ^ 2);
        Fr_TRB2 = sqrt((d / (c + d) * Fzp) ^ 2 + (d / (c + d) * Fxp - D / 2 / (c + d) * Fyp) ^ 2);
        // ギヤで発生するスラスト荷重計算（誘起スラストなし、TRB2 → TRB1 が正）
        Fth_out = Fyp;
        // BRGの受け持ちスラスト荷重計算（誘起スラスト考慮）
        Fpre_TRB1 = alpha_TRB1 * Toil + beta_TRB1;
        Fpre_TRB2 = alpha_TRB2 * Toil + beta_TRB2;
        Cond1 = (1 + tanh(0.5 * (Fr_TRB1 / Y1 - Fr_TRB2 / Y2) - Fth_out)) / 2;
        Cond2 = 1 - Cond1;
        Fth_TRB1 = Cond1 * (0.5 * Fr_TRB1 / Y1 + Fpre_TRB1) + Cond2 * (0.5 * Fr_TRB2 / Y2 + Fth_out + Fpre_TRB1);
        Fth_TRB2 = Cond1 * (0.5 * Fr_TRB1 / Y1 - Fth_out + Fpre_TRB2) + Cond2 * (0.5 * Fr_TRB2 / Y2 + Fpre_TRB2);
        // BRG1へ出力
        F_TRB1[1] = Fr_TRB1;
        F_TRB1[2] = Fth_TRB1;
        // BRG2へ出力
        F_TRB2[1] = Fr_TRB2;
        F_TRB2[2] = Fth_TRB2;
        annotation (
          Icon(graphics={  Rectangle(origin = {-88, 90}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 10}, {188, -190}}), Polygon(points = {{-10, 40}, {-10, -40}, {10, -20}, {10, 20}, {-10, 40}}), Polygon(origin = {40, -30}, points = {{-50, -10}, {50, -10}, {30, 10}, {-30, 10}, {-50, -10}}), Rectangle(origin = {-22, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {-2, -18}}), Rectangle(origin = {-72, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {-2, -18}}), Text(origin = {-21, 9}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-21, -17}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-71, 9}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-71, -17}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Line(origin = {38.01, 9.95}, points = {{-130, -10}, {-30, -10}}, pattern = LinePattern.DashDot), Rectangle(origin = {38, 26}, rotation = 270, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {0, -18}}), Text(origin = {35, 29}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Rectangle(origin = {38, -70}, rotation = 270, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-16, 22}, {-2, -18}}), Line(origin = {58.33, 29.95}, points = {{-18, 30}, {-18, -110}}, pattern = LinePattern.DashDot), Text(origin = {63, 29}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {35, -65}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {63, -65}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Polygon(origin = {-12, -27}, rotation = 270, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Polygon(origin = {70, -61}, rotation = 90, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, points = {{-2, 5}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 5}, {-2, 5}}), Polygon(origin = {70, 33}, rotation = 90, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, points = {{-2, 5}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 5}, {-2, 5}}), Polygon(origin = {74, -11}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-2, 15}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 15}, {-2, 15}}), Polygon(origin = {2, -41}, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Polygon(origin = {-2, -17}, rotation = 200, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Text(origin = {0, -124}, lineColor = {0, 0, 255}, extent = {{-180, 24}, {180, -16}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
          Diagram,
          version = "",
          uses);
      end BrgLoadDistribution_DF_T1T2;

      model HydraulicSystem
        //constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        parameter String TPMAP_LC_Filename;
        parameter String TPMAP_CL1_Filename;
        parameter String TPMAP_CL2_Filename;
        parameter String TPMAP_CL3_Filename;
        Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
          Placement(visible = true, transformation(origin = {-140, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 500}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput tau_clutch_cap_lup annotation (
          Placement(visible = true, transformation(origin = {-140, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput tau_clutch_cap_c1 annotation (
          Placement(visible = true, transformation(origin = {-140, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput tau_clutch_cap_c2 annotation (
          Placement(visible = true, transformation(origin = {-140, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput tau_clutch_cap_c3 annotation (
          Placement(visible = true, transformation(origin = {-140, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, -300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {10, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D(fileName = currDir + "/Tables/" + TPMAP_LC_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D1(fileName = currDir + "/Tables/" + TPMAP_CL1_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D2(fileName = currDir + "/Tables/" + TPMAP_CL2_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Tables.CombiTable1Dv combiTable1D3(fileName = currDir + "/Tables/" + TPMAP_CL3_Filename, tableName = "tab1", tableOnFile = true) annotation (
          Placement(visible = true, transformation(origin = {-70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder3(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder4(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
          Placement(visible = true, transformation(origin = {10, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Min min annotation (
          Placement(visible = true, transformation(origin = {70, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Min min1 annotation (
          Placement(visible = true, transformation(origin = {70, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Min min2 annotation (
          Placement(visible = true, transformation(origin = {70, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Min min3 annotation (
          Placement(visible = true, transformation(origin = {70, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput p_line_Pa_fil annotation (
          Placement(visible = true, transformation(origin = {130, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, 502}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput p_clutch_cap_lup_fil annotation (
          Placement(visible = true, transformation(origin = {130, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput p_clutch_cap_c1_fil annotation (
          Placement(visible = true, transformation(origin = {130, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput p_clutch_cap_c2_fil annotation (
          Placement(visible = true, transformation(origin = {130, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput p_clutch_cap_c3_fil annotation (
          Placement(visible = true, transformation(origin = {130, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, -300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain kPa2Pa_lup(k = 1000) annotation (
          Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain kPa2Pa_c1(k = 1000) annotation (
          Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain kPa2Pa_c2(k = 1000) annotation (
          Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain kPa2Pa_c3(k = 1000) annotation (
          Placement(visible = true, transformation(origin = {-30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(tau_clutch_cap_lup, combiTable1D.u[1]) annotation (
          Line(points = {{-140, 50}, {-82, 50}}, color = {0, 0, 127}));
        connect(tau_clutch_cap_c1, combiTable1D1.u[1]) annotation (
          Line(points = {{-140, 0}, {-82, 0}}, color = {0, 0, 127}));
        connect(tau_clutch_cap_c2, combiTable1D2.u[1]) annotation (
          Line(points = {{-140, -50}, {-82, -50}}, color = {0, 0, 127}));
        connect(tau_clutch_cap_c3, combiTable1D3.u[1]) annotation (
          Line(points = {{-140, -100}, {-82, -100}}, color = {0, 0, 127}));
        connect(p_line_Pa, firstOrder.u) annotation (
          Line(points = {{-140, 100}, {-2, 100}}, color = {0, 0, 127}));
        connect(firstOrder1.y, min.u1) annotation (
          Line(points = {{21, 50}, {58, 50}}, color = {0, 0, 127}));
        connect(firstOrder2.y, min1.u1) annotation (
          Line(points = {{21, 0}, {58, 0}}, color = {0, 0, 127}));
        connect(firstOrder3.y, min2.u1) annotation (
          Line(points = {{21, -50}, {58, -50}}, color = {0, 0, 127}));
        connect(firstOrder4.y, min3.u1) annotation (
          Line(points = {{21, -100}, {58, -100}}, color = {0, 0, 127}));
        connect(firstOrder.y, min.u2) annotation (
          Line(points = {{21, 100}, {40, 100}, {40, 38}, {58, 38}}, color = {0, 0, 127}));
        connect(firstOrder.y, min1.u2) annotation (
          Line(points = {{21, 100}, {40, 100}, {40, -12}, {58, -12}}, color = {0, 0, 127}));
        connect(firstOrder.y, min2.u2) annotation (
          Line(points = {{21, 100}, {40, 100}, {40, -62}, {58, -62}}, color = {0, 0, 127}));
        connect(firstOrder.y, min3.u2) annotation (
          Line(points = {{21, 100}, {40, 100}, {40, -112}, {58, -112}}, color = {0, 0, 127}));
        connect(firstOrder.y, p_line_Pa_fil) annotation (
          Line(points = {{21, 100}, {130, 100}}, color = {0, 0, 127}));
        connect(min.y, p_clutch_cap_lup_fil) annotation (
          Line(points = {{81, 44}, {130, 44}}, color = {0, 0, 127}));
        connect(min1.y, p_clutch_cap_c1_fil) annotation (
          Line(points = {{81, -6}, {130, -6}}, color = {0, 0, 127}));
        connect(min2.y, p_clutch_cap_c2_fil) annotation (
          Line(points = {{81, -56}, {130, -56}}, color = {0, 0, 127}));
        connect(min3.y, p_clutch_cap_c3_fil) annotation (
          Line(points = {{81, -106}, {130, -106}}, color = {0, 0, 127}));
        connect(combiTable1D.y[1], kPa2Pa_lup.u) annotation (
          Line(points = {{-58, 50}, {-44, 50}, {-44, 50}, {-42, 50}}, color = {0, 0, 127}));
        connect(combiTable1D1.y[1], kPa2Pa_c1.u) annotation (
          Line(points = {{-58, 0}, {-44, 0}, {-44, 0}, {-42, 0}}, color = {0, 0, 127}));
        connect(combiTable1D2.y[1], kPa2Pa_c2.u) annotation (
          Line(points = {{-58, -50}, {-42, -50}, {-42, -50}, {-42, -50}}, color = {0, 0, 127}));
        connect(combiTable1D3.y[1], kPa2Pa_c3.u) annotation (
          Line(points = {{-58, -100}, {-42, -100}, {-42, -100}, {-42, -100}}, color = {0, 0, 127}));
        connect(firstOrder1.u, kPa2Pa_lup.y) annotation (
          Line(points = {{-2, 50}, {-20, 50}, {-20, 50}, {-18, 50}}, color = {0, 0, 127}));
        connect(firstOrder2.u, kPa2Pa_c1.y) annotation (
          Line(points = {{-2, 0}, {-18, 0}, {-18, 0}, {-18, 0}}, color = {0, 0, 127}));
        connect(firstOrder3.u, kPa2Pa_c2.y) annotation (
          Line(points = {{-2, -50}, {-18, -50}, {-18, -50}, {-18, -50}}, color = {0, 0, 127}));
        connect(firstOrder4.u, kPa2Pa_c3.y) annotation (
          Line(points = {{-2, -100}, {-18, -100}, {-18, -100}, {-18, -100}}, color = {0, 0, 127}));
        annotation (
          Diagram(coordinateSystem(extent = {{-120, -140}, {120, 140}})),
          version = "",
          Icon(coordinateSystem(extent = {{-140, -400}, {140, 600}}), graphics={  Text(origin = {4, -408}, lineColor = {0, 0, 255}, extent = {{-282, 14}, {278, -46}}, textString = "%name"), Text(origin = {142, 635}, extent = {{-142, -35}, {-2, -215}}, textString = "LinePrs"), Rectangle(origin = {-40, 532}, extent = {{-100, 68}, {180, -932}}), Text(origin = {100, 435}, extent = {{-100, -55}, {40, -215}}, textString = "PLup"), Text(origin = {100, 235}, extent = {{-100, -55}, {40, -215}}, textString = "PCL1"), Text(origin = {100, 35}, extent = {{-100, -55}, {40, -215}}, textString = "PCL2"), Text(origin = {100, -165}, extent = {{-100, -55}, {40, -215}}, textString = "PCL3")}));
      end HydraulicSystem;

      model SealRingPrsDistribution
        parameter Real P_lubrication = 500 "unit:kPa";
        Modelica.Blocks.Interfaces.RealInput p_clutch_cap_lup annotation (
          Placement(visible = true, transformation(origin = {-180, 174}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput p_clutch_cap_c1 annotation (
          Placement(visible = true, transformation(origin = {-180, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput p_clutch_cap_c2 annotation (
          Placement(visible = true, transformation(origin = {-180, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput p_clutch_cap_c3 annotation (
          Placement(visible = true, transformation(origin = {-180, -106}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, -300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput p_SR_Pa[26] annotation (
          Placement(visible = true, transformation(origin = {170, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex5 SR1(n1 = 2, n2 = 2, n3 = 2, n4 = 2, n5 = 2) annotation (
          Placement(visible = true, transformation(origin = {89, 73}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex4 SR2(n1 = 2, n2 = 2, n3 = 2, n4 = 2) annotation (
          Placement(visible = true, transformation(origin = {89, 25}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 SR3(n1 = 2, n2 = 2) annotation (
          Placement(visible = true, transformation(origin = {89, -79}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 SR4(n1 = 2, n2 = 2) annotation (
          Placement(visible = true, transformation(origin = {89, -135}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex4 multiplex41(n1 = 10, n2 = 8, n3 = 4, n4 = 4) annotation (
          Placement(visible = true, transformation(origin = {140, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Sources.Constant lubrication_kPa(k = P_lubrication) annotation (
          Placement(visible = true, transformation(origin = {-130, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain kPa2Pa(k = 1000) annotation (
          Placement(visible = true, transformation(origin = {-90, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Sources.Constant case(k = 0) annotation (
          Placement(visible = true, transformation(origin = {-30, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex1 annotation (
          Placement(visible = true, transformation(origin = {30, 168}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex2 annotation (
          Placement(visible = true, transformation(origin = {30, 142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex3 annotation (
          Placement(visible = true, transformation(origin = {30, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex4 annotation (
          Placement(visible = true, transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex5 annotation (
          Placement(visible = true, transformation(origin = {30, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex6 annotation (
          Placement(visible = true, transformation(origin = {30, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex7 annotation (
          Placement(visible = true, transformation(origin = {30, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex8 annotation (
          Placement(visible = true, transformation(origin = {30, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex9 annotation (
          Placement(visible = true, transformation(origin = {30, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex10 annotation (
          Placement(visible = true, transformation(origin = {30, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex11 annotation (
          Placement(visible = true, transformation(origin = {30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex12 annotation (
          Placement(visible = true, transformation(origin = {30, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Routing.Multiplex2 multiplex13 annotation (
          Placement(visible = true, transformation(origin = {30, -156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(SR1.y, multiplex41.u1) annotation (
          Line(points = {{99, 73}, {120, 73}, {120, 10}, {128, 10}, {128, 11}}, color = {0, 0, 127}, thickness = 0.5));
        connect(SR2.y, multiplex41.u2) annotation (
          Line(points = {{99, 25}, {109.5, 25}, {109.5, 5}, {128, 5}}, color = {0, 0, 127}, thickness = 0.5));
        connect(SR3.y, multiplex41.u3) annotation (
          Line(points = {{99, -79}, {110, -79}, {110, -1}, {128, -1}}, color = {0, 0, 127}, thickness = 0.5));
        connect(SR4.y, multiplex41.u4) annotation (
          Line(points = {{99, -135}, {120, -135}, {120, -8}, {128, -8}, {128, -7}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex41.y, p_SR_Pa) annotation (
          Line(points = {{151, 2}, {170, 2}}, color = {0, 0, 127}, thickness = 0.5));
        connect(lubrication_kPa.y, kPa2Pa.u) annotation (
          Line(points = {{-119, 122}, {-102, 122}}, color = {0, 0, 127}));
        connect(multiplex1.u1[1], p_clutch_cap_lup) annotation (
          Line(points = {{18, 174}, {-180, 174}}, color = {0, 0, 127}));
        connect(multiplex1.u2[1], case.y) annotation (
          Line(points = {{-18, -180}, {0, -180}, {0, 162}, {18, 162}, {18, 162}}, color = {150, 150, 150}));
        connect(multiplex2.u1[1], case.y) annotation (
          Line(points = {{18, 148}, {0, 148}, {0, -180}, {-18, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex2.u2[1], p_clutch_cap_lup) annotation (
          Line(points = {{18, 136}, {-20, 136}, {-20, 174}, {-180, 174}, {-180, 174}}, color = {0, 0, 127}));
        connect(multiplex3.u1[1], kPa2Pa.y) annotation (
          Line(points = {{18, 122}, {-80, 122}, {-80, 122}, {-78, 122}}, color = {0, 0, 127}));
        connect(multiplex3.u2[1], case.y) annotation (
          Line(points = {{18, 110}, {0, 110}, {0, -180}, {-18, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex4.u1[1], p_clutch_cap_c2) annotation (
          Line(points = {{18, 96}, {-60, 96}, {-60, -40}, {-180, -40}}, color = {0, 0, 127}));
        connect(multiplex4.u2[1], kPa2Pa.y) annotation (
          Line(points = {{18, 84}, {-40, 84}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
        connect(multiplex5.u1[1], case.y) annotation (
          Line(points = {{18, 70}, {0, 70}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex5.u2[1], p_clutch_cap_c2) annotation (
          Line(points = {{18, 58}, {-60, 58}, {-60, -40}, {-180, -40}}, color = {0, 0, 127}));
        connect(multiplex6.u1[1], kPa2Pa.y) annotation (
          Line(points = {{18, 40}, {-40, 40}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
        connect(multiplex6.u2[1], case.y) annotation (
          Line(points = {{18, 28}, {0, 28}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex7.u1[1], p_clutch_cap_c2) annotation (
          Line(points = {{18, 14}, {-60, 14}, {-60, -40}, {-180, -40}}, color = {0, 0, 127}));
        connect(multiplex7.u2[1], kPa2Pa.y) annotation (
          Line(points = {{18, 2}, {-40, 2}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
        connect(multiplex8.u1[1], kPa2Pa.y) annotation (
          Line(points = {{18, -12}, {-40, -12}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
        connect(multiplex8.u2[1], p_clutch_cap_c2) annotation (
          Line(points = {{18, -24}, {-60, -24}, {-60, -40}, {-180, -40}}, color = {0, 0, 127}));
        connect(multiplex9.u1[1], case.y) annotation (
          Line(points = {{18, -38}, {0, -38}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex9.u2[1], kPa2Pa.y) annotation (
          Line(points = {{18, -50}, {-40, -50}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
        connect(multiplex10.u1[1], p_clutch_cap_c3) annotation (
          Line(points = {{18, -68}, {-80, -68}, {-80, -106}, {-180, -106}}, color = {0, 0, 127}));
        connect(multiplex10.u2[1], case.y) annotation (
          Line(points = {{18, -80}, {0, -80}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex11.u1[1], case.y) annotation (
          Line(points = {{18, -94}, {0, -94}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex11.u2[1], p_clutch_cap_c3) annotation (
          Line(points = {{18, -106}, {-180, -106}}, color = {0, 0, 127}));
        connect(multiplex12.u1[1], p_clutch_cap_c1) annotation (
          Line(points = {{18, -124}, {-100, -124}, {-100, 26}, {-180, 26}}, color = {0, 0, 127}));
        connect(multiplex12.u2[1], case.y) annotation (
          Line(points = {{18, -136}, {0, -136}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex13.u1[1], case.y) annotation (
          Line(points = {{18, -150}, {0, -150}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
        connect(multiplex13.u2[1], p_clutch_cap_c1) annotation (
          Line(points = {{18, -162}, {-100, -162}, {-100, 26}, {-180, 26}}, color = {0, 0, 127}));
        connect(multiplex12.y, SR4.u1) annotation (
          Line(points = {{41, -130}, {78, -130}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex13.y, SR4.u2) annotation (
          Line(points = {{42, -156}, {60, -156}, {60, -140}, {78, -140}, {78, -140}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex1.y, SR1.u1) annotation (
          Line(points = {{42, 168}, {72, 168}, {72, 82}, {78, 82}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex2.y, SR1.u2) annotation (
          Line(points = {{42, 142}, {66, 142}, {66, 77.5}, {78, 77.5}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex3.y, SR1.u3) annotation (
          Line(points = {{42, 116}, {60, 116}, {60, 73}, {78, 73}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex4.y, SR1.u4) annotation (
          Line(points = {{42, 90}, {54, 90}, {54, 68.5}, {78, 68.5}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex5.y, SR1.u5) annotation (
          Line(points = {{42, 64}, {78, 64}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex6.y, SR2.u1) annotation (
          Line(points = {{42, 34}, {76, 34}, {76, 34}, {78, 34}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex7.y, SR2.u2) annotation (
          Line(points = {{42, 8}, {54, 8}, {54, 28}, {78, 28}, {78, 28}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex8.y, SR2.u3) annotation (
          Line(points = {{42, -18}, {60, -18}, {60, 22}, {78, 22}, {78, 22}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex9.y, SR2.u4) annotation (
          Line(points = {{42, -44}, {66, -44}, {66, 18}, {78, 18}, {78, 16}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex10.y, SR3.u1) annotation (
          Line(points = {{42, -74}, {78, -74}, {78, -74}, {78, -74}}, color = {0, 0, 127}, thickness = 0.5));
        connect(multiplex11.y, SR3.u2) annotation (
          Line(points = {{42, -100}, {60, -100}, {60, -84}, {78, -84}, {78, -84}}, color = {0, 0, 127}, thickness = 0.5));
        annotation (
          Diagram(coordinateSystem(extent = {{-160, -200}, {160, 200}})),
          version = "",
          Icon(coordinateSystem(extent = {{-140, -400}, {140, 400}}, initialScale = 0.1), graphics={  Rectangle(origin = {3, -3}, extent = {{-143, 403}, {137, -397}}), Text(origin = {2, -416}, lineColor = {0, 0, 255}, extent = {{-282, 14}, {278, -46}}, textString = "%name"), Text(origin = {-40, 235}, extent = {{-100, -55}, {40, -215}}, textString = "PCL1"), Text(origin = {-40, 435}, extent = {{-100, -55}, {40, -215}}, textString = "PLup"), Text(origin = {-40, 35}, extent = {{-100, -55}, {40, -215}}, textString = "PCL2"), Text(origin = {-40, -165}, extent = {{-100, -55}, {40, -215}}, textString = "PCL3"), Text(origin = {100, 135}, extent = {{-100, -55}, {40, -215}}, textString = "PSR")}));
      end SealRingPrsDistribution;
    end Calc;
  end Mechanics;

  package Electrics
    model Actuator_eLoss
      Modelica.Blocks.Interfaces.RealInput I_actuator_A annotation (
        Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput V_BT_PNT_Lo_V annotation (
        Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput PHI_TM_PNT_Actuator_W annotation (
        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product lossPower annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-58, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(firstOrder1.y, lossPower.u1) annotation (
        Line(points = {{-52, 40}, {-20, 40}, {-20, 6}, {-12, 6}, {-12, 6}}, color = {0, 0, 127}));
      connect(I_actuator_A, firstOrder1.u) annotation (
        Line(points = {{-120, 40}, {-66, 40}, {-66, 40}, {-66, 40}}, color = {0, 0, 127}));
      connect(lossPower.y, PHI_TM_PNT_Actuator_W) annotation (
        Line(points = {{12, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
      connect(V_BT_PNT_Lo_V, lossPower.u2) annotation (
        Line(points = {{-120, -40}, {-20, -40}, {-20, -6}, {-12, -6}, {-12, -6}}, color = {0, 0, 127}));
      annotation (
        Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 255}, extent = {{-100, 40}, {100, -40}}, textString = "%name")}));
    end Actuator_eLoss;

    model EOP_eLoss
      Modelica.Blocks.Interfaces.RealInput I_EOP_A annotation (
        Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput V_BT_PNT_Lo_V annotation (
        Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput PHI_TM_PNT_EOP_W annotation (
        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Product lossPower annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
        Placement(visible = true, transformation(origin = {-58, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(firstOrder1.y, lossPower.u1) annotation (
        Line(points = {{-52, 40}, {-20, 40}, {-20, 6}, {-12, 6}, {-12, 6}}, color = {0, 0, 127}));
      connect(I_EOP_A, firstOrder1.u) annotation (
        Line(points = {{-120, 40}, {-66, 40}, {-66, 40}, {-66, 40}}, color = {0, 0, 127}));
      connect(lossPower.y, PHI_TM_PNT_EOP_W) annotation (
        Line(points = {{12, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
      connect(V_BT_PNT_Lo_V, lossPower.u2) annotation (
        Line(points = {{-120, -40}, {-20, -40}, {-20, -6}, {-12, -6}, {-12, -6}}, color = {0, 0, 127}));
      annotation (
        Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 255}, extent = {{-100, 40}, {100, -40}}, textString = "%name")}));
    end EOP_eLoss;
  end Electrics;

  package Thermal
    model HeatCapacitor
      Modelica.Blocks.Interfaces.RealOutput K annotation (
        Placement(visible = true, transformation(origin = {-20, 110}, extent = {{10, -10}, {-10, 10}}, rotation = -90), iconTransformation(origin = {-20, 110}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealInput Q annotation (
        Placement(visible = true, transformation(origin = {20, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {20, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 100, T(fixed = true)) annotation (
        Placement(visible = true, transformation(origin = {0, -8}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation (
        Placement(visible = true, transformation(origin = {20, 52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1 annotation (
        Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    equation
      connect(temperatureSensor1.T, K) annotation (
        Line(points = {{-20, 60}, {-20, 60}, {-20, 110}, {-20, 110}}, color = {0, 0, 127}));
      connect(temperatureSensor1.port, heatCapacitor1.port) annotation (
        Line(points = {{-20, 40}, {-20, 40}, {-20, 20}, {0, 20}, {0, 2}, {0, 2}}, color = {191, 0, 0}));
      connect(prescribedHeatFlow1.port, heatCapacitor1.port) annotation (
        Line(points = {{20, 42}, {20, 42}, {20, 20}, {0, 20}, {0, 2}, {0, 2}}, color = {191, 0, 0}));
      connect(prescribedHeatFlow1.Q_flow, Q) annotation (
        Line(points = {{20, 62}, {20, 62}, {20, 110}, {20, 110}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(initialScale = 0.1), graphics={  Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(origin = {2, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-46, 46}, {46, -46}}, endAngle = 360), Line(origin = {0, 72}, points = {{0, 26}, {0, -26}})}),
        uses(Modelica(version = "3.2.3")));
    end HeatCapacitor;

    model ThermalModelAll "ThermalModelAll"
      constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
      /* CP: 65001
       SimulationX Version: 3.9.3.54687 x64*/
      Blocks.Interfaces.TIn TinENtoCH "Temperatue Signal Input" annotation (
        Placement(transformation(extent = {{-20, 0}, {20, 40}}), iconTransformation(extent = {{-145, -170}, {-105, -130}})));
      Blocks.Interfaces.TIn TinENtoSD "Temperatue Signal Input" annotation (
        Placement(transformation(extent = {{-55, -145}, {-15, -105}}), iconTransformation(extent = {{-145, -120}, {-105, -80}})));
      Blocks.Interfaces.TIn TinTStoOC "Temperatue Signal Input" annotation (
        Placement(transformation(extent = {{-130, -280}, {-90, -240}}), iconTransformation(extent = {{-145, -420}, {-105, -380}})));
      Blocks.Interfaces.TIn TinAirtoCH "Temperatue Signal Input" annotation (
        Placement(transformation(origin = {175, 20}, extent = {{20, -20}, {-20, 20}}), iconTransformation(origin = {-125, -50}, extent = {{20, -20}, {-20, 20}}, rotation = 180)));
      Blocks.Interfaces.CSigIn VIdot1OilCooler "Control Signal Input" annotation (
        Placement(transformation(extent = {{-150, -305}, {-110, -265}}), iconTransformation(extent = {{-145, -370}, {-105, -330}})));
      Blocks.Interfaces.CSigIn VIdot2OilCooler "Control Signal Input" annotation (
        Placement(transformation(extent = {{-150, -335}, {-110, -295}}), iconTransformation(extent = {{-145, -320}, {-105, -280}})));
      Blocks.Interfaces.ESigIn QfGear "External Signal Input" annotation (
        Placement(transformation(origin = {285, -130}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{-145, 130}, {-105, 170}})));
      Blocks.Interfaces.ESigIn QfOil "External Signal Input" annotation (
        Placement(transformation(origin = {180, -295}, extent = {{20, -20}, {-20, 20}}), iconTransformation(origin = {-125, 100}, extent = {{20, -20}, {-20, 20}}, rotation = -180)));
      Blocks.Interfaces.ESigIn QfStartDevice "External Signal Input" annotation (
        Placement(transformation(origin = {102, -125}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{-145, 180}, {-105, 220}})));
      Blocks.Interfaces.CSigIn vCaseHousing "Control Signal Input" annotation (
        Placement(transformation(origin = {165, 70}, extent = {{20, -20}, {-20, 20}}), iconTransformation(origin = {-125, 0}, extent = {{20, -20}, {-20, 20}}, rotation = -180)));
      Blocks.Interfaces.QfOut QfOutCHtoEN "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(origin = {20, 50}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{-105, -220}, {-145, -180}})));
      Blocks.Interfaces.QfOut QfOutSDtoEN "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(origin = {-15, -145}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, 380}, {141.7, 420}})));
      Blocks.Interfaces.QfOut QfOutOCtoTS "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(extent = {{-5, -280}, {35, -240}}), iconTransformation(origin = {121.7, 350}, extent = {{20, -20}, {-20, 20}}, rotation = 180)));
      Blocks.Interfaces.ESigOut nuOil "External Signal Output" annotation (
        Placement(transformation(extent = {{170, -355}, {210, -315}}), iconTransformation(origin = {-125, 300}, extent = {{-20, -20}, {20, 20}}, rotation = -180)));
      Blocks.Interfaces.ESigOut rhoOil "External Signal Output" annotation (
        Placement(transformation(extent = {{190, -290}, {230, -250}}), iconTransformation(origin = {-125, 350}, extent = {{-20, -20}, {20, 20}}, rotation = -180)));
      Blocks.Interfaces.ESigOut ToutOil "External Signal Output" annotation (
        Placement(transformation(extent = {{190, -260}, {230, -220}}), iconTransformation(origin = {121.7, 250}, extent = {{-20, -20}, {20, 20}})));
      Blocks.Interfaces.QfOut QfOutCHtoAir "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(extent = {{230, 25}, {270, 65}}), iconTransformation(origin = {121.7, -150}, extent = {{20, -20}, {-20, 20}}, rotation = 180)));
      Blocks.Interfaces.TOut ToutOiltoOC "Temperature Signal Output" annotation (
        Placement(transformation(extent = {{50, -340}, {90, -300}}), iconTransformation(origin = {121.7, 200}, extent = {{-20, -20}, {20, 20}})));
      Blocks.Interfaces.QfOut QfOutOCtoOil "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(extent = {{30, -370}, {70, -330}}), iconTransformation(origin = {121.7, -200}, extent = {{-20, -20}, {20, 20}})));
      Blocks.Interfaces.TOut ToutSDtoOil "Temperature Signal Output" annotation (
        Placement(transformation(origin = {-45, -185}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, 130}, {141.7, 170}})));
      Blocks.Interfaces.QfOut QfOutOiltoSD "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(origin = {-25, -215}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, -270}, {141.7, -230}})));
      Blocks.Interfaces.TOut ToutSDtoCH "Temperature Signal Output" annotation (
        Placement(transformation(origin = {-45, -40}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, 80}, {141.7, 120}})));
      Blocks.Interfaces.QfOut QfOutCHtoSD "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(origin = {-25, -70}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, -320}, {141.7, -280}})));
      Blocks.Interfaces.TOut ToutOiltoCH "Temperature Signal Output" annotation (
        Placement(transformation(extent = {{145, -90}, {185, -50}}), iconTransformation(extent = {{101.7, 30}, {141.7, 70}})));
      Blocks.Interfaces.QfOut QfoutCHtoOil "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(extent = {{165, -60}, {205, -20}}), iconTransformation(extent = {{101.7, -370}, {141.7, -330}})));
      Blocks.Interfaces.QfOut QfOiltoGear "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(extent = {{295, -190}, {335, -150}}), iconTransformation(extent = {{101.7, -420}, {141.7, -380}})));
      Blocks.Interfaces.TOut ToutGeartoOil "Temperature Signal Output" annotation (
        Placement(transformation(extent = {{275, -215}, {315, -175}}), iconTransformation(extent = {{101.7, -20}, {141.7, 20}})));
      Blocks.Interfaces.TOut ToutGeartoCH "Temperature Signal Output" annotation (
        Placement(transformation(extent = {{275, -100}, {315, -60}}), iconTransformation(extent = {{101.7, -70}, {141.7, -30}})));
      Blocks.Interfaces.QfOut QfOutCHtoGear "Heat Flow Rate Signal Output" annotation (
        Placement(transformation(extent = {{295, -70}, {335, -30}}), iconTransformation(extent = {{101.7, -470}, {141.7, -430}})));
      ThermalComponents.StartDevice startDevice(C = c1, T0 = T0, R = R1) annotation (
        Placement(transformation(extent = {{40, -140}, {60, -120}})));
      ThermalComponents.CaseHousing caseHousing(C = c2, T0 = T1, R1 = R2, R2 = R3, R3 = R4, R4 = R5, table = table1) annotation (
        Placement(transformation(extent = {{75, 15}, {135, 35}})));
      ThermalComponents.Gear gear(C = c3, T0 = T2) annotation (
        Placement(transformation(extent = {{220, -140}, {240, -120}})));
      ThermalComponents.OilCooler oilCooler annotation (
        Placement(transformation(extent = {{-60, -300}, {-40, -280}})));
      /*(fileName = fileName1, tableName = tableName1)*/
      ThermalComponents.Oil oil(T0 = T3, C = c4, R1 = R6, R2 = R7, Nutable = Nutable1, RhoTable = RhoTable1) annotation (
        Placement(transformation(extent = {{75, -300}, {135, -280}})));
      Modelica.Blocks.Math.Gain gain1(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{50, 40}, {30, 60}})));
      Modelica.Blocks.Math.Gain gain2(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{20, -155}, {0, -135}})));
      Modelica.Blocks.Math.Gain gain3(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{-30, -270}, {-10, -250}})));
      Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{150, -345}, {170, -325}})));
      Modelica.Blocks.Math.Gain gain5(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{170, -250}, {190, -230}})));
      Modelica.Blocks.Math.Gain gain6(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{170, -280}, {190, -260}})));
      Modelica.Blocks.Math.Gain gain7(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{195, 35}, {215, 55}})));
      Modelica.Blocks.Math.Gain gain8(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{25, -330}, {45, -310}})));
      Modelica.Blocks.Math.Gain gain9(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{5, -360}, {25, -340}})));
      Modelica.Blocks.Math.Gain gain10(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{5, -195}, {-15, -175}})));
      Modelica.Blocks.Math.Gain gain11(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{25, -225}, {5, -205}})));
      Modelica.Blocks.Math.Gain gain12(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{5, -50}, {-15, -30}})));
      Modelica.Blocks.Math.Gain gain13(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{25, -80}, {5, -60}})));
      Modelica.Blocks.Math.Gain gain14(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{145, -50}, {165, -30}})));
      Modelica.Blocks.Math.Gain gain15(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{125, -80}, {145, -60}})));
      Modelica.Blocks.Math.Gain gain16(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{250, -205}, {270, -185}})));
      Modelica.Blocks.Math.Gain gain17(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{275, -180}, {295, -160}})));
      Modelica.Blocks.Math.Gain gain18(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{275, -60}, {295, -40}})));
      Modelica.Blocks.Math.Gain gain19(k(displayUnit = "1") = kDammy) annotation (
        Placement(transformation(extent = {{250, -90}, {270, -70}})));
      parameter Modelica.Units.SI.HeatCapacity c1 = 5000 "Heat capacity(startDeviceHeatCapacity) (startDevice)";
      parameter PhysicalElements.ThermodynamicTemperature T0(displayUnit = "degC") = 298.14999999999998 "Initial Temperature(startDeviceHeatCapacity) (startDevice)";
      parameter Modelica.Units.SI.ThermalResistance R1 = 100 "Thermal resistance to/from Engine(RtoEngine) (startDevice)";
      parameter PhysicalElements.ThermodynamicTemperature T1(displayUnit = "degC") = 298.14999999999998 "Initial Temperature(caseHousingHeatCapacity) (caseHousing)";
      parameter Modelica.Units.SI.ThermalResistance R2 = 0.1 "Thermal resistance to/from Engine(RtoEngine) (caseHousing)";
      parameter Modelica.Units.SI.ThermalResistance R3 = 100 "Thermal resistance to/from StartingDevice(RtoStartingDevice) (caseHousing)";
      parameter Modelica.Units.SI.ThermalResistance R4 = 100 "Thermal resistance to/from Gear(RtoGear) (caseHousing)";
      parameter Modelica.Units.SI.ThermalResistance R5 = 0.006 "Thermal resistance to/from Oil(RtoOil) (caseHousing)";
      parameter Real table1[:, :] = {{0, 0.022}, {10, 0.021}, {20, 0.021}, {30, 0.02}, {40, 0.019}, {50, 0.018}, {60, 0.017}, {70, 0.016}, {80, 0.015}, {90, 0.014}, {100, 0.013}, {110, 0.012}, {120, 0.012}, {130, 0.011}, {140, 0.011}, {150, 0.01}, {160, 0.01}} "Table(e.g., table={velocity,thermalResistance}) (thermalRVsVehicleVTable) (caseHousing)";
      parameter Modelica.Units.SI.HeatCapacity c3 = 15000 "Heat capacity(gearHeatCapacity) (gear)";
      parameter PhysicalElements.ThermodynamicTemperature T2(displayUnit = "degC") = 298.14999999999998 "Initial Temperature(gearHeatCapacity) (gear)";
      parameter String fileName1 = currDir + "/Tables/thResistanceOilColler1.txt" "FileName(QfToWaterTable) (oilCooler)";
      parameter String tableName1 = "thResistanceOilColler1" "TableName(QfToWaterTable) (oilCooler)";
      parameter PhysicalElements.ThermodynamicTemperature T3(displayUnit = "degC") = 298.14999999999998 "Initial Temperature (oil)";
      parameter Modelica.Units.SI.HeatCapacity c4 = 10000 "Heat capacity(oilHeatCapacity) (oil)";
      parameter Modelica.Units.SI.ThermalResistance R6 = 0.0007 "Thermal resistance to/from StartingDevice(RtoStartingDevice) (oil)";
      parameter Modelica.Units.SI.ThermalResistance R7 = 0.05 "Thermal resistance to/from Gear(RtoGear) (oil)";
      parameter Real Nutable1[:, :] = {{-30, 70}, {0, 70}, {20, 70}, {40, 40}, {60, 23}, {80, 13}, {100, 7.5}, {120, 7.5}} "Table(e.g., {Temperature,Kinematic Viscosity}) (nuTable) (oil)";
      parameter Real RhoTable1[:, :] = {{-30, 70}, {0, 70}, {20, 70}, {40, 40}, {60, 23}, {80, 13}, {100, 7.5}, {120, 7.5}} "Table (e.g., table=[0,2]) (rhoTable) (oil)";
      parameter Real kDammy = 1 "Parameter";
      parameter Modelica.Units.SI.HeatCapacity c2 = 30000 "Heat capacity(caseHousingHeatCapacity) (caseHousing)";
    equation
      connect(QfOil, oil.Qf5) annotation (
        Line(points = {{180, -295}, {175, -295}, {140, -295}, {135, -295}}, color = {191, 0, 0}, thickness = 0.0625));
      connect(gain6.y, rhoOil) annotation (
        Line(points = {{191, -270}, {196, -270}, {205, -270}, {210, -270}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain11.y, QfOutOiltoSD) annotation (
        Line(points = {{4, -215}, {-1, -215}, {-20, -215}, {-25, -215}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain10.y, ToutSDtoOil) annotation (
        Line(points = {{-16, -185}, {-21, -185}, {-40, -185}, {-45, -185}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(QfOutSDtoEN, gain2.y) annotation (
        Line(points = {{-15, -145}, {-10, -145}, {-6, -145}, {-1, -145}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain13.y, QfOutCHtoSD) annotation (
        Line(points = {{4, -70}, {-1, -70}, {-20, -70}, {-25, -70}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain12.y, ToutSDtoCH) annotation (
        Line(points = {{-16, -40}, {-21, -40}, {-40, -40}, {-45, -40}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(QfGear, gear.Qf3) annotation (
        Line(points = {{285, -130}, {280, -130}, {245, -130}, {240, -130}}, color = {191, 0, 0}, thickness = 0.0625));
      connect(vCaseHousing, caseHousing.v1) annotation (
        Line(points = {{165, 70}, {160, 70}, {125, 70}, {125, 40}, {125, 35}}, color = {0, 127, 0}, thickness = 0.0625));
      connect(caseHousing.T5, TinAirtoCH) annotation (
        Line(points = {{135, 20}, {140, 20}, {170, 20}, {175, 20}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(QfStartDevice, startDevice.Qf4) annotation (
        Line(points = {{102, -125}, {97, -125}, {65, -125}, {60, -125}}, color = {191, 0, 0}, thickness = 0.0625));
      connect(gain1.y, QfOutCHtoEN) annotation (
        Line(points = {{29, 50}, {24, 50}, {25, 50}, {20, 50}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain19.y, ToutGeartoCH) annotation (
        Line(points = {{271, -80}, {276, -80}, {290, -80}, {295, -80}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain18.y, QfOutCHtoGear) annotation (
        Line(points = {{296, -50}, {301, -50}, {310, -50}, {315, -50}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain18.u, caseHousing.Qf3) annotation (
        Line(points = {{273, -50}, {235, -50}, {235, 5}, {130, 5}, {130, 15}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain19.u, gear.T1) annotation (
        Line(points = {{248, -80}, {225, -80}, {225, -120}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain16.y, ToutGeartoOil) annotation (
        Line(points = {{271, -195}, {276, -195}, {290, -195}, {295, -195}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain17.y, QfOiltoGear) annotation (
        Line(points = {{296, -170}, {301, -170}, {310, -170}, {315, -170}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain17.u, oil.Qf2) annotation (
        Line(points = {{273, -170}, {235, -170}, {235, -220}, {130, -220}, {130, -280}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain16.u, gear.T2) annotation (
        Line(points = {{248, -195}, {225, -195}, {225, -140}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(ToutOiltoCH, gain15.y) annotation (
        Line(points = {{165, -70}, {160, -70}, {151, -70}, {146, -70}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain14.y, QfoutCHtoOil) annotation (
        Line(points = {{166, -40}, {171, -40}, {180, -40}, {185, -40}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain14.u, caseHousing.Qf4) annotation (
        Line(points = {{143, -40}, {110, -40}, {110, 15}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain15.u, oil.T3) annotation (
        Line(points = {{123, -70}, {100, -70}, {100, -280}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain13.u, caseHousing.Qf2) annotation (
        Line(points = {{27, -70}, {55, -70}, {55, 0}, {90, 0}, {90, 15}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain12.u, startDevice.T2) annotation (
        Line(points = {{7, -40}, {45, -40}, {45, -120}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain11.u, oil.Qf1) annotation (
        Line(points = {{27, -215}, {27, -215}, {55, -215}, {55, -270}, {90, -270}, {90, -275}, {90, -280}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain10.u, startDevice.T3) annotation (
        Line(points = {{7, -185}, {12, -185}, {45, -185}, {45, -145}, {45, -140}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain9.y, QfOutOCtoOil) annotation (
        Line(points = {{26, -350}, {31, -350}, {45, -350}, {50, -350}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain8.y, ToutOiltoOC) annotation (
        Line(points = {{46, -320}, {51, -320}, {65, -320}, {70, -320}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain9.u, oilCooler.Qf1) annotation (
        Line(points = {{3, -350}, {-2, -350}, {-10, -350}, {-10, -295}, {-40, -295}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain8.u, oil.T4) annotation (
        Line(points = {{23, -320}, {5, -320}, {5, -285}, {70, -285}, {75, -285}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain7.y, QfOutCHtoAir) annotation (
        Line(points = {{216, 45}, {221, 45}, {245, 45}, {250, 45}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain7.u, caseHousing.Qf5) annotation (
        Line(points = {{193, 45}, {188, 45}, {140, 45}, {140, 30}, {135, 30}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(ToutOil, gain5.y) annotation (
        Line(points = {{210, -240}, {205, -240}, {196, -240}, {191, -240}}, color = {191, 0, 0}, thickness = 0.0625));
      connect(gain6.u, oil.rho) annotation (
        Line(points = {{168, -270}, {163, -270}, {150, -270}, {150, -290}, {135, -290}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain5.u, oil.T5) annotation (
        Line(points = {{168, -240}, {163, -240}, {140, -240}, {140, -285}, {135, -285}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(caseHousing.T2, startDevice.T2) annotation (
        Line(points = {{80, 15}, {80, 10}, {80, 5}, {45, 5}, {45, -120}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(caseHousing.Qf2, startDevice.Qf2) annotation (
        Line(points = {{90, 15}, {90, 10}, {90, 0}, {55, 0}, {55, -120}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(caseHousing.T4, oil.T3) annotation (
        Line(points = {{100, 15}, {100, 10}, {100, -275}, {100, -280}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(caseHousing.Qf4, oil.Qf3) annotation (
        Line(points = {{110, 15}, {110, 10}, {110, -275}, {110, -280}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(caseHousing.T3, gear.T1) annotation (
        Line(points = {{120, 15}, {120, 10}, {120, 0}, {225, 0}, {225, -120}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(caseHousing.Qf3, gear.Qf1) annotation (
        Line(points = {{130, 15}, {130, 10}, {130, 5}, {235, 5}, {235, -120}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(caseHousing.T1, TinENtoCH) annotation (
        Line(points = {{75, 20}, {70, 20}, {5, 20}, {0, 20}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(caseHousing.Qf1, gain1.u) annotation (
        Line(points = {{75, 30}, {70, 30}, {65, 30}, {65, 50}, {52, 50}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gear.T2, oil.T2) annotation (
        Line(points = {{225, -140}, {225, -145}, {225, -215}, {120, -215}, {120, -280}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(gear.Qf2, oil.Qf2) annotation (
        Line(points = {{235, -140}, {235, -145}, {235, -220}, {130, -220}, {130, -280}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(startDevice.T3, oil.T1) annotation (
        Line(points = {{45, -140}, {45, -145}, {45, -275}, {80, -275}, {80, -280}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(startDevice.Qf3, oil.Qf1) annotation (
        Line(points = {{55, -140}, {55, -145}, {55, -270}, {90, -270}, {90, -280}}, color = {0, 0, 127}, thickness = 0.0625),
        AutoRoute = false);
      connect(startDevice.T1, TinENtoSD) annotation (
        Line(points = {{40, -125}, {35, -125}, {-30, -125}, {-35, -125}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain2.u, startDevice.Qf1) annotation (
        Line(points = {{22, -145}, {27, -145}, {35, -145}, {35, -135}, {40, -135}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(oil.T4, oilCooler.T1) annotation (
        Line(points = {{75, -285}, {70, -285}, {-35, -285}, {-40, -285}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(oil.Qf4, oilCooler.Qf1) annotation (
        Line(points = {{75, -295}, {70, -295}, {-35, -295}, {-40, -295}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(TinTStoOC, oilCooler.T2) annotation (
        Line(points = {{-110, -260}, {-105, -260}, {-55, -260}, {-55, -275}, {-55, -280}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(oilCooler.Vldot1, VIdot1OilCooler) annotation (
        Line(points = {{-60, -285}, {-65, -285}, {-125, -285}, {-130, -285}}, color = {0, 127, 0}, thickness = 0.0625));
      connect(oilCooler.Vldot2, VIdot2OilCooler) annotation (
        Line(points = {{-60, -295}, {-65, -295}, {-80, -295}, {-80, -315}, {-130, -315}}, color = {0, 127, 0}, thickness = 0.0625),
        AutoRoute = false);
      connect(gain3.u, oilCooler.Qf2) annotation (
        Line(points = {{-32, -260}, {-37, -260}, {-45, -260}, {-45, -275}, {-45, -280}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain4.u, oil.nu) annotation (
        Line(points = {{148, -335}, {143, -335}, {130, -335}, {130, -305}, {130, -300}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain4.y, nuOil) annotation (
        Line(points = {{171, -335}, {176, -335}, {185, -335}, {190, -335}}, color = {0, 0, 127}, thickness = 0.0625));
      connect(gain3.y, QfOutOCtoTS) annotation (
        Line(points = {{-9, -260}, {-4, -260}, {10, -260}, {15, -260}}, color = {0, 0, 127}, thickness = 0.0625));
      annotation (
        Icon(coordinateSystem(extent = {{-125, -500}, {125, 500}}), graphics={  Rectangle(fillPattern = FillPattern.None, extent = {{-125, 500}, {125, -500}}, origin = {3, -3}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-447, 55}, {447, -55}}, origin = {-11, 13}, rotation = 90)}),
        experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"),
        Diagram(coordinateSystem(extent = {{-160, -400}, {360, 100}})));
    end ThermalModelAll;

    package ThermalComponents "Thermal Components"
      /* CP: 65001
         SimulationX Version: 3.9.4.55045 x64*/

      model StartDevice "Thermal Model of Starting Device"
        Blocks.Interfaces.ESigIn Qf4 "External Signal Input" annotation (
          Placement(transformation(extent = {{110, 35}, {90, 55}}), iconTransformation(extent = {{110, 40}, {90, 60}})));
        Blocks.Interfaces.TIn T1 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{-145, 5}, {-125, 25}}), iconTransformation(extent = {{-110, 40}, {-90, 60}})));
        Blocks.Interfaces.QfOut Qf1 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{-125, -10}, {-145, 10}}), iconTransformation(extent = {{-90, -60}, {-110, -40}})));
        Blocks.Interfaces.QfIn Qf2 "Heat Flow Rate Input" annotation (
          Placement(transformation(extent = {{105, -5.1}, {85, 14.9}}), iconTransformation(origin = {50, 100}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
        Blocks.Interfaces.QfIn Qf3 "Heat Flow Rate Input" annotation (
          Placement(transformation(extent = {{105, -50}, {85, -30}}), iconTransformation(origin = {50, -100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
        Blocks.Interfaces.TOut T3 "Temperature Output" annotation (
          Placement(transformation(extent = {{85, -35}, {105, -15}}), iconTransformation(origin = {-50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Blocks.Interfaces.TOut T2 "Temperature Output" annotation (
          Placement(transformation(extent = {{85, 10}, {105, 30}}), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoEngine(R = R) annotation (
          Placement(transformation(origin = {-25, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow QfFrStartingDevice annotation (
          Placement(transformation(extent = {{25, 35}, {5, 55}})));
        Adaptors.ThTout thTout1 annotation (
          Placement(transformation(extent = {{20, 0}, {10, 20}})));
        Adaptors.ThTout thTout2 annotation (
          Placement(transformation(extent = {{20, -45}, {10, -25}})));
        Adaptors.ThQfOut thQfOut2 annotation (
          Placement(transformation(extent = {{-55, 0}, {-45, 20}})));
        PhysicalElements.HeatCapacitorInitT startDeviceHeatCapacity(C = C, T(displayUnit = "K", fixed = true, start = T0)) annotation (
          Placement(transformation(extent = {{-15, 55}, {5, 75}})));
        Modelica.Blocks.Math.Gain gain2(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{45, 10}, {65, 30}})));
        Modelica.Blocks.Math.Gain gain3(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{45, -35}, {65, -15}})));
        Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{-85, -10}, {-105, 10}})));
        parameter Modelica.Units.SI.HeatCapacity C = 5000 "Heat capacity(startDeviceHeatCapacity)";
        parameter PhysicalElements.ThermodynamicTemperature T0 = 298.145 "Initial Temperature(startDeviceHeatCapacity)";
        parameter Modelica.Units.SI.ThermalResistance R = 100 "Thermal resistance to/from Engine(RtoEngine)";
        parameter Real kDummy = 1 "Dummy(Do not change)";
      equation
        connect(thTout1.T, gain2.u) annotation (
          Line(points = {{20, 15}, {25, 15}, {38, 15}, {38, 20}, {43, 20}}));
        connect(T2, gain2.y) annotation (
          Line(points = {{95, 20}, {90, 20}, {71, 20}, {66, 20}}));
        connect(thTout2.T, gain3.u) annotation (
          Line(points = {{20, -30}, {25, -30}, {38, -30}, {38, -25}, {43, -25}}));
        connect(T3, gain3.y) annotation (
          Line(points = {{95, -25}, {90, -25}, {71, -25}, {66, -25}}));
        connect(thQfOut2.Q_flow, gain4.u) annotation (
          Line(points = {{-55, 5}, {-60, 5}, {-78, 5}, {-78, 0}, {-83, 0}}));
        connect(Qf1, gain4.y) annotation (
          Line(points = {{-135, 0}, {-130, 0}, {-111, 0}, {-106, 0}}));
        connect(T1, thQfOut2.T) annotation (
          Line(points = {{-135, 15}, {-130, 15}, {-60, 15}, {-55, 15}}, thickness = 0));
        connect(Qf2, thTout1.Q_flow) annotation (
          Line(points = {{95, 5}, {90, 5}, {25, 5}, {20, 5}}, thickness = 0));
        connect(Qf3, thTout2.Q_flow) annotation (
          Line(points = {{95, -40}, {90, -40}, {25, -40}, {20, -40}}, thickness = 0));
        connect(startDeviceHeatCapacity.port, thTout2.port_a) annotation (
          Line(points = {{-5, 55.3}, {-5, 50.3}, {-5, -35}, {5.3, -35}, {10.3, -35}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(startDeviceHeatCapacity.port, thTout1.port_a) annotation (
          Line(points = {{-5, 55.3}, {-5, 50.3}, {-5, 10}, {5.3, 10}, {10.3, 10}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(thQfOut2.port_a, RtoEngine.port_b) annotation (
          Line(points = {{-45.3, 10}, {-40.3, 10}, {-40, 10}, {-35, 10}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(startDeviceHeatCapacity.port, RtoEngine.port_a) annotation (
          Line(points = {{-5, 55.3}, {-5, 50.3}, {-5, 10}, {-10, 10}, {-15, 10}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(Qf4, QfFrStartingDevice.Q_flow) annotation (
          Line(points = {{100, 45}, {95, 45}, {30, 45}, {25, 45}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(startDeviceHeatCapacity.port, QfFrStartingDevice.port) annotation (
          Line(points = {{-5, 55.3}, {-5, 50.3}, {-5, 45}, {0, 45}, {5, 45}}, color = {191, 0, 0}, thickness = 0.0625));
        annotation (
          Icon(graphics={  Rectangle(fillPattern = FillPattern.None, extent = {{-100, 100}, {100, -100}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-100, 19}, {100, -19}}, origin = {0, 1})}),
          Documentation(info = "<HTML><HEAD>
<META charset=\"utf-8\">
<STYLE type=\"text/css\">
a {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;}
body, blockquote, table, p, li, dl, ul, ol {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; color: black;}
h3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11pt; font-weight: bold;}
h4 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold;}
h5 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold;}
h6 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold; font-style:italic}
pre {font-family: Courier, monospace; font-size: 9pt;}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19180\"></HEAD> 
<BODY>
<P><BR></P>
<P><BR></P></BODY></HTML>
    "),   experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
      end StartDevice;

      model Gear "Thermal Model of Gear"
        /* CP: 65001
          SimulationX Version: 3.9.3.54687 x64*/
        Blocks.Interfaces.QfIn Qf1 "Heat Flow Rate Input" annotation (
          Placement(transformation(extent = {{-130, 5}, {-110, 25}}), iconTransformation(origin = {50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Blocks.Interfaces.QfIn Qf2 "Heat Flow Rate Input" annotation (
          Placement(transformation(extent = {{-130, -40}, {-110, -20}}), iconTransformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        Blocks.Interfaces.ESigIn Qf3 "External Signal Input" annotation (
          Placement(transformation(extent = {{85.09999999999999, -35}, {65.09999999999999, -15}}), iconTransformation(extent = {{110, -10}, {90, 10}})));
        Blocks.Interfaces.TOut T1 "Temperature Output" annotation (
          Placement(transformation(extent = {{-109.9, 20.1}, {-129.9, 40.1}}), iconTransformation(origin = {-50, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
        Blocks.Interfaces.TOut T2 "Temperature Output" annotation (
          Placement(transformation(extent = {{-110, -25}, {-130, -5}}), iconTransformation(origin = {-50, -100}, extent = {{10, -10}, {-10, 10}}, rotation = -270)));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow QfFrGearSets annotation (
          Placement(transformation(extent = {{0, -35}, {-20, -15}})));
        Adaptors.ThTout thTout4 "Thermal Temperature Out" annotation (
          Placement(transformation(origin = {-50, 20}, extent = {{-5, -10}, {5, 10}})));
        Adaptors.ThTout thTout5 "Thermal Temperature Out" annotation (
          Placement(transformation(origin = {-50, -25}, extent = {{-5, -10}, {5, 10}})));
        PhysicalElements.HeatCapacitorInitT gearHeatCapacity(C = C, T(start = T0, fixed = true)) "Lumped thermal element storing heat" annotation (
          Placement(transformation(extent = {{-40, 25}, {-20, 45}})));
        Modelica.Blocks.Math.Gain gain3(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{-80, 20}, {-100, 40}})));
        Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{-75, -25}, {-95, -5}})));
        parameter Modelica.Units.SI.HeatCapacity C = 15000 "Heat capacity(gearHeatCapacity)";
        parameter PhysicalElements.ThermodynamicTemperature T0 = 298.14999999999998 "Initial Temperature(gearHeatCapacity)";
        parameter Real kDummy = 1 "Dummy(Do not change)";
      equation
        connect(thTout4.T, gain3.u) annotation (
          Line(points = {{-55, 25}, {-60, 25}, {-73, 25}, {-73, 30}, {-78, 30}}));
        connect(T1, gain3.y) annotation (
          Line(points = {{-120, 30}, {-115, 30}, {-106, 30}, {-101, 30}}));
        connect(thTout5.T, gain4.u) annotation (
          Line(points = {{-55, -20}, {-60, -20}, {-68, -20}, {-68, -15}, {-73, -15}}));
        connect(T2, gain4.y) annotation (
          Line(points = {{-120, -15}, {-115, -15}, {-101, -15}, {-96, -15}}));
        connect(Qf1, thTout4.Q_flow) annotation (
          Line(points = {{-120, 15}, {-115, 15}, {-60, 15}, {-55, 15}}, thickness = 0));
        connect(Qf2, thTout5.Q_flow) annotation (
          Line(points = {{-120, -30}, {-115, -30}, {-60, -30}, {-55, -30}}, thickness = 0));
        connect(gearHeatCapacity.port, thTout4.port_a) annotation (
          Line(points = {{-30, 25.3}, {-30, 20.3}, {-30, 20}, {-40.3, 20}, {-45.3, 20}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(gearHeatCapacity.port, thTout5.port_a) annotation (
          Line(points = {{-30, 25.3}, {-30, 20.3}, {-30, -25}, {-40.3, -25}, {-45.3, -25}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(Qf3, QfFrGearSets.Q_flow) annotation (
          Line(points = {{75, -25}, {70, -25}, {5, -25}, {0, -25}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(gearHeatCapacity.port, QfFrGearSets.port) annotation (
          Line(points = {{-30, 25.3}, {-30, 20.3}, {-30, -25}, {-25, -25}, {-20, -25}}, color = {191, 0, 0}, thickness = 0.0625));
        annotation (
          Icon(graphics={  Rectangle(fillPattern = FillPattern.None, extent = {{-100, 100}, {100, -100}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-102, 10}, {100, -30}}, origin = {0, 10})}),
          experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
      end Gear;

      model CaseHousing "Thermal model of Case Housing of TM"
        /* CP: 65001
           SimulationX Version: 3.9.3.54687 x64*/
        Blocks.Interfaces.TIn T1 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{-125, 5}, {-105, 25}}), iconTransformation(extent = {{-310, -60}, {-290, -40}})));
        Blocks.Interfaces.TIn T2 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{-125, -70}, {-105, -50}}), iconTransformation(origin = {-250, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        Blocks.Interfaces.QfOut Qf1 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{-105, -15}, {-125, 5}}), iconTransformation(extent = {{-290, 40}, {-310, 60}})));
        Blocks.Interfaces.QfOut Qf2 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{-105, -90}, {-125, -70}}), iconTransformation(origin = {-150, -100}, extent = {{10, -10}, {-10, 10}}, rotation = -270)));
        Blocks.Interfaces.TIn T5 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{135, 5}, {115, 25}}), iconTransformation(extent = {{310, -60}, {290, -40}})));
        Blocks.Interfaces.TIn T3 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{135, -70}, {115, -50}}), iconTransformation(origin = {150, -100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
        Blocks.Interfaces.TIn T4 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{135, -115}, {115, -95}}), iconTransformation(origin = {-50, -100}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
        Blocks.Interfaces.QfOut Qf5 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{115, -15}, {135, 5}}), iconTransformation(extent = {{290, 40}, {310, 60}})));
        Blocks.Interfaces.QfOut Qf3 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{115, -90}, {135, -70}}), iconTransformation(origin = {250, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Blocks.Interfaces.QfOut Qf4 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{115, -135}, {135, -115}}), iconTransformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Blocks.Interfaces.CSigIn v1 "Control Signal Input" annotation (
          Placement(transformation(extent = {{130, 70}, {110, 90}}), iconTransformation(origin = {200, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoEngine(R = R1) "Lumped thermal element transporting heat without storing it" annotation (
          Placement(transformation(origin = {-25, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
        Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoStartingDevice(R = R2) annotation (
          Placement(transformation(origin = {-25, -65}, extent = {{10, -10}, {-10, 10}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoOil(R = R4) annotation (
          Placement(transformation(origin = {30, -110}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
        Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoGear(R = R3) annotation (
          Placement(transformation(origin = {30, -65}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
        Modelica.Thermal.HeatTransfer.Components.ConvectiveResistor thermalRVsVehicleV annotation (
          Placement(transformation(extent = {{40, 0}, {20, 20}})));
        Modelica.Blocks.Tables.CombiTable1Dv thermalRVsVehicleVTable(table = table) annotation (
          Placement(transformation(origin = {30, 45}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
        Adaptors.ThQfOut thQfOut7 annotation (
          Placement(transformation(extent = {{-55, -75}, {-45, -55}})));
        Adaptors.ThQfOut thQfOut8 annotation (
          Placement(transformation(extent = {{-55, 0}, {-45, 20}})));
        Adaptors.ThQfOut thQfOut9 annotation (
          Placement(transformation(extent = {{65, 0}, {55, 20}})));
        Adaptors.ThQfOut thQfOut10 annotation (
          Placement(transformation(extent = {{65, -75}, {55, -55}})));
        Adaptors.ThQfOut thQfOut20 annotation (
          Placement(transformation(extent = {{65, -120}, {55, -100}})));
        PhysicalElements.HeatCapacitorInitT caseHousingHeatCapacity(C = C, T(displayUnit = "K", fixed = true, start = T0)) annotation (
          Placement(transformation(extent = {{-10, 30}, {10, 50}})));
        Modelica.Blocks.Math.Gain gain3(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{80, -15}, {100, 5}})));
        Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{80, -90}, {100, -70}})));
        Modelica.Blocks.Math.Gain gain5(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{80, -135}, {100, -115}})));
        Modelica.Blocks.Math.Gain gain6(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{-75, -15}, {-95, 5}})));
        Modelica.Blocks.Math.Gain gain7(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{-75, -90}, {-95, -70}})));
        Blocks.MsToKms mstoKms1 annotation (
          Placement(transformation(extent = {{70, 70}, {50, 90}})));
        parameter Modelica.Units.SI.HeatCapacity C = 30000 "Heat capacity(caseHousingHeatCapacity)";
        parameter PhysicalElements.ThermodynamicTemperature T0 = 298.14999999999998 "Initial Temperature(caseHousingHeatCapacity)";
        parameter Modelica.Units.SI.ThermalResistance R1 = 0.1 "Thermal resistance to/from Engine(RtoEngine)";
        parameter Modelica.Units.SI.ThermalResistance R2 = 100 "Thermal resistance to/from StartingDevice(RtoStartingDevice)";
        parameter Modelica.Units.SI.ThermalResistance R3 = 100 "Thermal resistance to/from Gear(RtoGear)";
        parameter Modelica.Units.SI.ThermalResistance R4 = 0.006 "Thermal resistance to/from Oil(RtoOil)";
        parameter Real table[:, :] = {{0, 0.022}, {10, 0.021}, {20, 0.021}, {30, 0.02}, {40, 0.019}, {50, 0.018}, {60, 0.017}, {70, 0.016}, {80, 0.015}, {90, 0.014}, {100, 0.013}, {110, 0.012}, {120, 0.012}, {130, 0.011}, {140, 0.011}, {150, 0.01}, {160, 0.01}} "Table(e.g., table={velocity,thermalResistance}) (thermalRVsVehicleVTable)";
        parameter Real kDummy = 1 "Dummy(Do not change)";
      equation
        connect(thQfOut9.Q_flow, gain3.u) annotation (
          Line(points = {{65, 5}, {70, 5}, {73, 5}, {73, -5}, {78, -5}}));
        connect(Qf5, gain3.y) annotation (
          Line(points = {{125, -5}, {120, -5}, {106, -5}, {101, -5}}));
        connect(thQfOut10.Q_flow, gain4.u) annotation (
          Line(points = {{65, -70}, {70, -70}, {73, -70}, {73, -80}, {78, -80}}));
        connect(Qf3, gain4.y) annotation (
          Line(points = {{125, -80}, {120, -80}, {106, -80}, {101, -80}}));
        connect(thQfOut20.Q_flow, gain5.u) annotation (
          Line(points = {{65, -115}, {70, -115}, {73, -115}, {73, -125}, {78, -125}}));
        connect(Qf4, gain5.y) annotation (
          Line(points = {{125, -125}, {120, -125}, {106, -125}, {101, -125}}));
        connect(thQfOut8.Q_flow, gain6.u) annotation (
          Line(points = {{-55, 5}, {-60, 5}, {-68, 5}, {-68, -5}, {-73, -5}}));
        connect(Qf1, gain6.y) annotation (
          Line(points = {{-115, -5}, {-110, -5}, {-101, -5}, {-96, -5}}));
        connect(thQfOut7.Q_flow, gain7.u) annotation (
          Line(points = {{-55, -70}, {-60, -70}, {-68, -70}, {-68, -80}, {-73, -80}}));
        connect(Qf2, gain7.y) annotation (
          Line(points = {{-115, -80}, {-110, -80}, {-101, -80}, {-96, -80}}));
        connect(T4, thQfOut20.T) annotation (
          Line(points = {{125, -105}, {120, -105}, {70, -105}, {65, -105}}, thickness = 0));
        connect(T3, thQfOut10.T) annotation (
          Line(points = {{125, -60}, {120, -60}, {70, -60}, {65, -60}}, thickness = 0));
        connect(T5, thQfOut9.T) annotation (
          Line(points = {{125, 15}, {120, 15}, {70, 15}, {65, 15}}, thickness = 0));
        connect(v1, mstoKms1.u) annotation (
          Line(points = {{120, 80}, {115, 80}, {77, 80}, {72, 80}}, color = {0, 127, 0}, thickness = 0.0625));
        connect(T1, thQfOut8.T) annotation (
          Line(points = {{-115, 15}, {-110, 15}, {-60, 15}, {-55, 15}}, thickness = 0));
        connect(T2, thQfOut7.T) annotation (
          Line(points = {{-115, -60}, {-110, -60}, {-60, -60}, {-55, -60}}, thickness = 0));
        connect(mstoKms1.y, thermalRVsVehicleVTable.u[1]) annotation (
          Line(points = {{49, 80}, {44, 80}, {30, 80}, {30, 62}, {30, 57}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(thermalRVsVehicleV.fluid, caseHousingHeatCapacity.port) annotation (
          Line(points = {{20, 10}, {15, 10}, {0, 10}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(thermalRVsVehicleVTable.y[1], thermalRVsVehicleV.Rc) annotation (
          Line(points = {{30, 34}, {30, 29}, {30, 25}, {30, 20}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(thermalRVsVehicleV.solid, thQfOut9.port_a) annotation (
          Line(points = {{40, 10}, {45, 10}, {50.3, 10}, {55.3, 10}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(RtoEngine.port_a, caseHousingHeatCapacity.port) annotation (
          Line(points = {{-15, 10}, {-10, 10}, {0, 10}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(thQfOut8.port_a, RtoEngine.port_b) annotation (
          Line(points = {{-45.3, 10}, {-40.3, 10}, {-40, 10}, {-35, 10}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(RtoStartingDevice.port_a, caseHousingHeatCapacity.port) annotation (
          Line(points = {{-15, -65}, {-10, -65}, {0, -65}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(thQfOut7.port_a, RtoStartingDevice.port_b) annotation (
          Line(points = {{-45.3, -65}, {-40.3, -65}, {-40, -65}, {-35, -65}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(RtoOil.port_a, caseHousingHeatCapacity.port) annotation (
          Line(points = {{20, -110}, {15, -110}, {0, -110}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(thQfOut20.port_a, RtoOil.port_b) annotation (
          Line(points = {{55.3, -110}, {50.3, -110}, {45, -110}, {40, -110}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(RtoGear.port_a, caseHousingHeatCapacity.port) annotation (
          Line(points = {{20, -65}, {15, -65}, {0, -65}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(RtoGear.port_b, thQfOut10.port_a) annotation (
          Line(points = {{40, -65}, {45, -65}, {50.3, -65}, {55.3, -65}}, color = {191, 0, 0}, thickness = 0.0625));
        annotation (
          Icon(coordinateSystem(extent = {{-300, -100}, {300, 100}}), graphics={  Rectangle(fillPattern = FillPattern.None, extent = {{-300, 100}, {300, -100}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-190, 48}, {210, -30}}, origin = {-10, -10})}),
          experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
      end CaseHousing;

      model OilCooler "Thermal model of Oil Cooler"
        // CP: 65001
        // SimulationX Version: 3.9.4.55045 x64
        constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
        Blocks.Interfaces.TIn T2 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{-45.1, 65}, {-25.1, 85}}), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Blocks.Interfaces.TIn T1 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{155.1, 65}, {135.1, 85}}), iconTransformation(extent = {{110, 40}, {90, 60}})));
        Blocks.Interfaces.QfOut Qf1 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{170, -20}, {190, 0}}), iconTransformation(extent = {{90, -60}, {110, -40}})));
        Blocks.Interfaces.QfOut Qf2 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{-30, -60}, {-50, -40}}), iconTransformation(origin = {50, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
        Blocks.Interfaces.CSigIn Vldot1 "Control Signal Input" annotation (
          Placement(transformation(extent = {{-125, 5}, {-105, 25}}), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}})));
        Blocks.Interfaces.CSigIn Vldot2 "Control Signal Input" annotation (
          Placement(transformation(extent = {{-125, -30}, {-105, -10}}), iconTransformation(extent = {{-110, -60}, {-90, -40}})));
        Modelica.Blocks.Tables.CombiTable2Ds QfToWaterTable(tableOnFile = true, tableName = tableName, fileName = fileName) annotation (
          Placement(transformation(origin = {15, -15}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
        Modelica.Blocks.Math.Add TdiffWaterOil(k1 = -1, k2 = +1) annotation (
          Placement(transformation(origin = {40, 35}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
        Modelica.Blocks.Math.Product QfToWater annotation (
          Placement(transformation(extent = {{55, -20}, {75, 0}})));
        Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
          Placement(transformation(extent = {{100, -20}, {120, 0}})));
        Modelica.Blocks.Math.Gain gain6(k(displayUnit = "1") = kDummy) "Output the product of a gain value with the input signal" annotation (
          Placement(transformation(extent = {{140, -20}, {160, 0}})));
        Modelica.Blocks.Math.Gain gain7(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{30, -60}, {10, -40}})));
        Blocks.M3sToLmin m3stoLmin1 annotation (
          Placement(transformation(extent = {{-55, 5}, {-35, 25}})));
        Blocks.M3sToLmin m3stoLmin2 "m3/s to l/min" annotation (
          Placement(transformation(extent = {{-55, -30}, {-35, -10}})));
        parameter String fileName = currDir + "/Tables/thResistanceOilColler1.txt" "FileName(QfToWaterTable)" annotation (
          specialFormat = 2);
        parameter String tableName = "thResistanceOilColler1" "TableName(QfToWaterTable)";
        parameter Real kDummy = 1 "Dummy(Do not change)";
      equation
        connect(gain1.y, gain6.u) annotation (
          Line(points = {{121, -10}, {126, -10}, {133, -10}, {138, -10}}));
        connect(Qf1, gain6.y) annotation (
          Line(points = {{180, -10}, {175, -10}, {166, -10}, {161, -10}}));
        connect(Qf2, gain7.y) annotation (
          Line(points = {{-40, -50}, {-35, -50}, {4, -50}, {9, -50}}));
        connect(Vldot1, m3stoLmin1.u) annotation (
          Line(points = {{-115, 15}, {-110, 15}, {-62, 15}, {-57, 15}}, color = {0, 127, 0}, thickness = 0.0625));
        connect(Vldot2, m3stoLmin2.u) annotation (
          Line(points = {{-115, -20}, {-110, -20}, {-62, -20}, {-57, -20}}, color = {0, 127, 0}, thickness = 0.0625));
        connect(QfToWaterTable.u2, m3stoLmin2.y) annotation (
          Line(points = {{3, -21}, {-2, -21}, {-29, -21}, {-29, -20}, {-34, -20}}));
        connect(QfToWaterTable.u1, m3stoLmin1.y) annotation (
          Line(points = {{3, -9}, {-2, -9}, {-29, -9}, {-29, 15}, {-34, 15}}));
        connect(QfToWater.y, gain7.u) annotation (
          Line(points = {{76, -10}, {81, -10}, {81, -50}, {37, -50}, {32, -50}}));
        connect(gain1.u, QfToWater.y) annotation (
          Line(points = {{98, -10}, {93, -10}, {81, -10}, {76, -10}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(QfToWaterTable.y, QfToWater.u2) annotation (
          Line(points = {{26, -15}, {31, -15}, {48, -15}, {48, -16}, {53, -16}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(T1, TdiffWaterOil.u2) annotation (
          Line(points = {{145, 75}, {140, 75}, {46, 75}, {46, 52}, {46, 47}}, thickness = 0));
        connect(T2, TdiffWaterOil.u1) annotation (
          Line(points = {{-35, 75}, {-30, 75}, {34, 75}, {34, 52}, {34, 47}}, thickness = 0));
        connect(QfToWater.u1, TdiffWaterOil.y) annotation (
          Line(points = {{53, -4}, {48, -4}, {40, -4}, {40, 19}, {40, 24}}, color = {0, 0, 127}, thickness = 0.0625));
        annotation (
          experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"),
          Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-1, 0}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
      end OilCooler;

      model Oil "Thermal model of Oil"
        // CP: 65001
        // SimulationX Version: 3.9.3.54687 x64
        Blocks.Interfaces.ESigOut nu "Exernal Signal Output" annotation (
          Placement(transformation(extent = {{195, -55.1}, {215, -35.1}}), iconTransformation(origin = {250, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Blocks.Interfaces.ESigOut rho "Exernal Signal Output" annotation (
          Placement(transformation(extent = {{150, -80.09999999999999}, {170, -60.1}}), iconTransformation(origin = {300, 0}, extent = {{-10, -10}, {10, 10}})));
        Blocks.Interfaces.QfIn Qf3 "Heat Flow Rate Input" annotation (
          Placement(transformation(extent = {{-150, 60}, {-130, 80}}), iconTransformation(origin = {50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Blocks.Interfaces.QfIn Qf4 "Heat Flow Rate Input" annotation (
          Placement(transformation(extent = {{-150, -20}, {-130, 0}}), iconTransformation(extent = {{-310, -60}, {-290, -40}})));
        Blocks.Interfaces.TOut T3 "Temperature Output" annotation (
          Placement(transformation(extent = {{-130, 85}, {-150, 105}}), iconTransformation(origin = {-50, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
        Blocks.Interfaces.TOut T4 "Temperature Output" annotation (
          Placement(transformation(extent = {{-130.1, -5}, {-150.1, 15}}), iconTransformation(extent = {{-290, 40}, {-310, 60}})));
        Blocks.Interfaces.TIn T1 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{-150, 35}, {-130, 55}}), iconTransformation(origin = {-250, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
        Blocks.Interfaces.QfOut Qf1 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{-130, 20}, {-150, 40}}), iconTransformation(origin = {-150, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
        Blocks.Interfaces.TIn T2 "Temperatue Signal Input" annotation (
          Placement(transformation(extent = {{120, 70}, {100, 90}}), iconTransformation(origin = {150, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
        Blocks.Interfaces.QfOut Qf2 "Heat Flow Rate Output" annotation (
          Placement(transformation(extent = {{100, 50}, {120, 70}}), iconTransformation(origin = {250, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
        Blocks.Interfaces.ESigOut T5 "Exernal Signal Output" annotation (
          Placement(transformation(extent = {{150, -15}, {170, 5}}), iconTransformation(extent = {{290, 40}, {310, 60}})));
        Blocks.Interfaces.ESigIn Qf5 "External Signal Input" annotation (
          Placement(transformation(extent = {{170, 30}, {150, 50}}), iconTransformation(extent = {{310, -60}, {290, -40}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoGear(R = R2) annotation (
          Placement(transformation(origin = {15, 75}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
        Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoStartingDevice(R = R1) annotation (
          Placement(transformation(origin = {-35, 40}, extent = {{10, -10}, {-10, 10}})));
        Modelica.Blocks.Tables.CombiTable1Dv nuTable(table = Nutable) annotation (
          Placement(transformation(extent = {{65, -55}, {85, -35}})));
        Adaptors.ThTout thTout3 annotation (
          Placement(transformation(origin = {-65, 75}, extent = {{-5, -10}, {5, 10}})));
        Adaptors.ThTout thTout7 annotation (
          Placement(transformation(origin = {-65, -5}, extent = {{-5, -10}, {5, 10}})));
        Adaptors.ThQfOut thQfOut6 annotation (
          Placement(transformation(extent = {{-70, 30}, {-60, 50}})));
        Adaptors.ThQfOut thQfOut16 annotation (
          Placement(transformation(extent = {{45, 65}, {35, 85}})));
        PhysicalElements.HeatCapacitorInitT oilHeatCapacity(C = C, T(displayUnit = "K", fixed = true, start = T0)) annotation (
          Placement(transformation(extent = {{-20, 90}, {0, 110}})));
        Modelica.Blocks.Tables.CombiTable1Dv rhoTable(table = RhoTable) annotation (
          Placement(transformation(extent = {{65, -80}, {85, -60}})));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow QfFrMechControl annotation (
          Placement(transformation(extent = {{75, 30}, {55, 50}})));
        Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor oilT annotation (
          Placement(transformation(extent = {{5, -15}, {25, 5}})));
        parameter PhysicalElements.ThermodynamicTemperature T0 = 298.14999999999998 "Initial Temperature";
        Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{100, -15}, {120, 5}})));
        Modelica.Blocks.Math.Gain gain5(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{150, -55}, {170, -35}})));
        Modelica.Blocks.Math.Gain gain6(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{110, -80}, {130, -60}})));
        Modelica.Blocks.Math.Gain gain7(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{-100, 85}, {-120, 105}})));
        Modelica.Blocks.Math.Gain gain8(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{-100, 20}, {-120, 40}})));
        Modelica.Blocks.Math.Gain gain9(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{-95, -5}, {-115, 15}})));
        Modelica.Blocks.Math.Gain gain10(k(displayUnit = "1") = kDummy) annotation (
          Placement(transformation(extent = {{70, 50}, {90, 70}})));
        Blocks.Mm2sTom2s mm2stom2s1 annotation (
          Placement(transformation(extent = {{110, -55}, {130, -35}})));
        parameter Modelica.Units.SI.HeatCapacity C = 10000 "Heat capacity(oilHeatCapacity)";
        parameter Modelica.Units.SI.ThermalResistance R1 = 0.0007 "Thermal resistance to/from StartingDevice(RtoStartingDevice)";
        parameter Modelica.Units.SI.ThermalResistance R2 = 0.05 "Thermal resistance to/from Gear(RtoGear)";
        parameter Real Nutable[:, :] = {{-30, 70}, {0, 70}, {20, 70}, {40, 40}, {60, 23}, {80, 13}, {100, 7.5}, {120, 7.5}} "Table(e.g., {Temperature,Kinematic Viscosity}) (nuTable)";
        parameter Real RhoTable[:, :] = {{-30, 70}, {0, 70}, {20, 70}, {40, 40}, {60, 23}, {80, 13}, {100, 7.5}, {120, 7.5}} "Table (e.g., table=[0,2]) (rhoTable)";
        parameter Real kDummy = 1 "Dummy(Do not change)";
        Blocks.KelvinToCelcius kelvinToCelcius1 annotation (
          Placement(transformation(origin = {40, -25}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      equation
        connect(T5, gain4.y) annotation (
          Line(points = {{160, -5}, {155, -5}, {126, -5}, {121, -5}}));
        connect(nu, gain5.y) annotation (
          Line(points = {{205, -45}, {200, -45}, {176, -45}, {171, -45}}));
        connect(rho, gain6.y) annotation (
          Line(points = {{160, -70}, {155, -70}, {136, -70}, {131, -70}}));
        connect(thTout3.T, gain7.u) annotation (
          Line(points = {{-70, 80}, {-75, 80}, {-93, 80}, {-93, 95}, {-98, 95}}));
        connect(T3, gain7.y) annotation (
          Line(points = {{-140, 95}, {-135, 95}, {-126, 95}, {-121, 95}}));
        connect(thQfOut6.Q_flow, gain8.u) annotation (
          Line(points = {{-70, 35}, {-75, 35}, {-93, 35}, {-93, 30}, {-98, 30}}));
        connect(Qf1, gain8.y) annotation (
          Line(points = {{-140, 30}, {-135, 30}, {-126, 30}, {-121, 30}}));
        connect(thTout7.T, gain9.u) annotation (
          Line(points = {{-70, 0}, {-75, 0}, {-88, 0}, {-88, 5}, {-93, 5}}));
        connect(T4, gain9.y) annotation (
          Line(points = {{-140, 5}, {-135, 5}, {-121, 5}, {-116, 5}}));
        connect(thQfOut16.Q_flow, gain10.u) annotation (
          Line(points = {{45, 70}, {50, 70}, {63, 70}, {63, 60}, {68, 60}}));
        connect(Qf2, gain10.y) annotation (
          Line(points = {{110, 60}, {105, 60}, {96, 60}, {91, 60}}));
        connect(gain5.u, mm2stom2s1.y) annotation (
          Line(points = {{148, -45}, {143, -45}, {136, -45}, {131, -45}}));
        connect(Qf3, thTout3.Q_flow) annotation (
          Line(points = {{-140, 70}, {-135, 70}, {-75, 70}, {-70, 70}}, thickness = 0));
        connect(T1, thQfOut6.T) annotation (
          Line(points = {{-140, 45}, {-135, 45}, {-75, 45}, {-70, 45}}, thickness = 0));
        connect(Qf4, thTout7.Q_flow) annotation (
          Line(points = {{-140, -10}, {-135, -10}, {-75, -10}, {-70, -10}}, thickness = 0));
        connect(T2, thQfOut16.T) annotation (
          Line(points = {{110, 80}, {105, 80}, {50, 80}, {45, 80}}, thickness = 0));
        connect(oilHeatCapacity.port, thTout3.port_a) annotation (
          Line(points = {{-10, 90.3}, {-10, 85.3}, {-10, 75}, {-55.3, 75}, {-60.3, 75}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(oilHeatCapacity.port, thTout7.port_a) annotation (
          Line(points = {{-10, 90.3}, {-10, 85.3}, {-10, -5}, {-55.3, -5}, {-60.3, -5}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(RtoStartingDevice.port_a, oilHeatCapacity.port) annotation (
          Line(points = {{-25, 40}, {-20, 40}, {-10, 40}, {-10, 85.3}, {-10, 90.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(thQfOut6.port_a, RtoStartingDevice.port_b) annotation (
          Line(points = {{-60.3, 40}, {-55.3, 40}, {-50, 40}, {-45, 40}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(RtoGear.port_a, oilHeatCapacity.port) annotation (
          Line(points = {{5, 75}, {0, 75}, {-10, 75}, {-10, 85.3}, {-10, 90.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(thQfOut16.port_a, RtoGear.port_b) annotation (
          Line(points = {{35.3, 75}, {30.3, 75}, {30, 75}, {25, 75}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(QfFrMechControl.Q_flow, Qf5) annotation (
          Line(points = {{75, 40}, {80, 40}, {155, 40}, {160, 40}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(QfFrMechControl.port, oilHeatCapacity.port) annotation (
          Line(points = {{55, 40}, {50, 40}, {-10, 40}, {-10, 85.3}, {-10, 90.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(oilT.T, gain4.u) annotation (
          Line(points = {{25, -5}, {30, -5}, {93, -5}, {98, -5}}));
        connect(oilT.port, oilHeatCapacity.port) annotation (
          Line(points = {{5, -5}, {0, -5}, {-10, -5}, {-10, 85.3}, {-10, 90.3}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(nuTable.y[1], mm2stom2s1.u) annotation (
          Line(points = {{86, -45}, {91, -45}, {103, -45}, {108, -45}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(rhoTable.y[1], gain6.u) annotation (
          Line(points = {{86, -70}, {91, -70}, {103, -70}, {108, -70}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(kelvinToCelcius1.u, oilT.T) annotation (
          Line(points = {{40, -13}, {40, -8}, {40, -5}, {30, -5}, {25, -5}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(nuTable.u[1], kelvinToCelcius1.y) annotation (
          Line(points = {{63, -45}, {58, -45}, {40, -45}, {40, -41}, {40, -36}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(rhoTable.u[1], kelvinToCelcius1.y) annotation (
          Line(points = {{63, -70}, {58, -70}, {40, -70}, {40, -41}, {40, -36}}, color = {0, 0, 127}, thickness = 0.0625));
        annotation (
          Icon(coordinateSystem(extent = {{-300, -100}, {300, 100}}), graphics={  Rectangle(fillPattern = FillPattern.None, extent = {{-300, 100}, {300, -100}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-200, 40}, {200, -40}})}),
          experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
      end Oil;
      annotation (
        dateModified = "2018-11-29 12:23:09Z",
        Documentation(info = "<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Thermal Components</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}
</STYLE>
 <LINK href=\"../format_help.css\" rel=\"stylesheet\">
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19180\"></HEAD>
<BODY> 
<H1>Thermal Components</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"68\" height=\"68\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABECAYAAAA4E5OyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAACISURBVHhe7dAxAQAwEAOh+jedzn8aQAJvHEJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICAkhISSEhJAQEkJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICAkhISSEhJAQEkJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICDm2DxXm++rfkKchAAAAAElFTkSuQmCC\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">TRAMI.L3.Components.Thermal</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<UL>
  <LI>&nbsp;20181130&nbsp; Thermal Models used both in L3 and L4 
modeling.</LI></UL>
<OL>
  <LI>StartDevice</LI>
  <LI>Gear</LI>
  <LI>CaseHousing</LI>
  <LI>OilCooler</LI>
  <LI>Oil</LI></OL></BODY></HTML>
          "));
    end ThermalComponents;

    package Adaptors "Convert Causal to/frpm Acausal"
      // CP: 65001
      // SimulationX Version: 3.9.4.55045 x64

      model ThTout "Thermal Temperature Out"
        Modelica.Blocks.Interfaces.RealOutput T(unit = "K") "Temperature" annotation (
          Placement(transformation(extent = {{-110, 75}, {-90, 95}}), iconTransformation(extent = {{-40, 40}, {-60, 60}})));
        Modelica.Blocks.Interfaces.RealInput Q_flow(unit = "W") "Heat Flow" annotation (
          Placement(transformation(extent = {{-120, 25}, {-80, 65}}), iconTransformation(extent = {{-70, -70}, {-30, -30}})));
        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a "Thermal port for 1-dim. heat transfer (filled rectangular icon)" annotation (
          Placement(transformation(extent = {{-50, 55}, {-30, 75}}), iconTransformation(extent = {{36.7, -10}, {56.7, 10}})));
        Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor2 annotation (
          Placement(transformation(extent = {{-80, 65}, {-60, 85}})));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow2 annotation (
          Placement(transformation(extent = {{-60, 40}, {-80, 60}})));
        Modelica.Units.SI.Temperature Tout = T;
        Modelica.Units.SI.HeatFlowRate Qflow = Q_flow;
      equation
        connect(temperatureSensor2.port, prescribedHeatFlow2.port) annotation (
          Line(points = {{-80, 75}, {-85, 75}, {-85, 50}, {-80, 50}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(temperatureSensor2.T, T) annotation (
          Line(points = {{-60, 75}, {-55, 75}, {-55, 85}, {-95, 85}, {-100, 85}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(prescribedHeatFlow2.Q_flow, Q_flow) annotation (
          Line(points = {{-60, 50}, {-55, 50}, {-55, 40}, {-95, 40}, {-95, 45}, {-100, 45}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(temperatureSensor2.port, port_a) annotation (
          Line(points = {{-80, 75}, {-85, 75}, {-85, 65}, {-45, 65}, {-40, 65}}, color = {191, 0, 0}, thickness = 0.0625));
        annotation (
          Icon(coordinateSystem(extent = {{-50, -100}, {50, 100}}), graphics={  Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-166.7, 136.7}, {153.3, 100}}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-50, 96.7}, {53.3, -96.7}})}),
          experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
      end ThTout;

      model ThQfOut "Thermal Connector Q_flow Out"
        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a "Thermal port for 1-dim. heat transfer (filled rectangular icon)" annotation (
          Placement(transformation(extent = {{30, 50}, {50, 70}}), iconTransformation(extent = {{36.7, -10}, {56.7, 10}})));
        Modelica.Blocks.Interfaces.RealInput T(unit = "K") "Temperature" annotation (
          Placement(transformation(extent = {{-55, 45}, {-15, 85}}), iconTransformation(extent = {{-70, 30}, {-30, 70}})));
        Modelica.Blocks.Interfaces.RealOutput Q_flow(unit = "W") "Heat_flow" annotation (
          Placement(transformation(extent = {{-35, 25}, {-15, 45}}), iconTransformation(extent = {{-40, -60}, {-60, -40}})));
        Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor4 annotation (
          Placement(transformation(extent = {{15, 50}, {-5, 70}})));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature2 annotation (
          Placement(transformation(extent = {{-5, 75}, {15, 95}})));
        Modelica.Units.SI.Temperature Tin = T;
        Modelica.Units.SI.HeatFlowRate Qflow = Q_flow;
      equation
        connect(prescribedTemperature2.port, heatFlowSensor4.port_b) annotation (
          Line(points = {{15, 85}, {20, 85}, {20, 72.7}, {-10, 72.7}, {-10, 60}, {-5, 60}}, color = {191, 0, 0}, thickness = 0.015625));
        connect(prescribedTemperature2.T, T) annotation (
          Line(points = {{-7, 85}, {-12, 85}, {-30, 85}, {-30, 65}, {-35, 65}}, color = {0, 0, 127}, thickness = 0.0625));
        connect(heatFlowSensor4.port_a, port_a) annotation (
          Line(points = {{15, 60}, {20, 60}, {35, 60}, {40, 60}}, color = {191, 0, 0}, thickness = 0.0625));
        connect(heatFlowSensor4.Q_flow, Q_flow) annotation (
          Line(points = {{5, 50}, {5, 45}, {5, 35}, {-20, 35}, {-25, 35}}, color = {0, 0, 127}, thickness = 0.0625));
        annotation (
          Icon(coordinateSystem(extent = {{-50, -100}, {50, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-45.3, 103.2}, {48, -96.8}}, origin = {2, -6.5}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-163.3, 133.3}, {146.7, 100}})}),
          experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
      end ThQfOut;

      model RotWOut "Adaptor for a Rotational flange with angle, speed, and acceleration as outputs"
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange "1-dim. rotational flange of a shaft (filled square icon)" annotation (
          Placement(transformation(extent = {{-30, 60}, {-10, 80}}), iconTransformation(extent = {{-60, -10}, {-40, 10}})));
        Modelica.Blocks.Interfaces.RealOutput w(unit = "rad/s") "Flange moves with speed w due to torque tau" annotation (
          Placement(transformation(extent = {{20, 90}, {40, 110}}), iconTransformation(extent = {{40, 40}, {60, 60}})));
        Modelica.Blocks.Interfaces.RealInput tau(unit = "N.m") "Torque to drive the flange" annotation (
          Placement(transformation(extent = {{20, -50}, {60, -10}}), iconTransformation(extent = {{60, -60}, {40, -40}})));
      equation
        w = der(flange.phi);
        flange.tau = -tau;
        annotation (
          Icon(coordinateSystem(extent = {{-50, -100}, {50, 100}}, preserveAspectRatio = false), graphics={  Rectangle(pattern = LinePattern.None, fillColor = {170, 255, 85}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 100}, {20, -100}}), Text(textString = "om", fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 59}, {20, 37}}), Text(textString = "tau", textStyle = {TextStyle.Italic}, fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, -44}, {20, -66}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-90, 156.7}, {126.7, 106.7}})}),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime = 1, StartTime = 0, Interval = 0.001));
      end RotWOut;

      model RotTauOut "RotTauOut"
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "1-dim. rotational flange of a shaft (non-filled square icon)" annotation (
          Placement(transformation(extent = {{35, 50}, {55, 70}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
        Modelica.Blocks.Interfaces.RealInput w(unit = "rad/s") "Speed to drive the flange" annotation (
          Placement(transformation(extent = {{-100, 70}, {-60, 110}}), iconTransformation(extent = {{-60, 40}, {-40, 60}})));
        Modelica.Blocks.Interfaces.RealOutput tau(unit = "N.m") "Torque needed to drive the flange according to phi, w, a" annotation (
          Placement(transformation(extent = {{-60, 10}, {-80, 30}}), iconTransformation(extent = {{-40, -60}, {-60, -40}})));
        Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
          Placement(transformation(extent = {{35, 50}, {15, 70}})));
        Modelica.Mechanics.Rotational.Sources.Speed speed2(exact = false, f_crit = 1000) annotation (
          Placement(transformation(extent = {{-25, 50}, {-5, 70}})));
      equation
        connect(torqueSensor.tau, tau) annotation (
          Line(points = {{33, 49}, {33, 44}, {33, 20}, {-65, 20}, {-70, 20}}, color = {0, 0, 127}));
        connect(torqueSensor.flange_a, flange) annotation (
          Line(points = {{35, 60}, {40, 60}, {45, 60}}));
        connect(speed2.flange, torqueSensor.flange_b) annotation (
          Line(points = {{-5, 60}, {0, 60}, {10, 60}, {15, 60}}, thickness = 0.0625));
        connect(speed2.w_ref, w) annotation (
          Line(points = {{-27, 60}, {-32, 60}, {-75, 60}, {-75, 90}, {-80, 90}}, color = {0, 0, 127}, thickness = 0.0625));
        annotation (
          Icon(coordinateSystem(extent = {{-50, -100}, {50, 100}}, preserveAspectRatio = false), graphics={  Rectangle(pattern = LinePattern.None, fillColor = {170, 255, 85}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 100}, {20, -100}}), Text(textString = "om", fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 63}, {20, 41}}), Text(textString = "tau", textStyle = {TextStyle.Italic}, fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, -43}, {20, -65}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-76.7, 156.7}, {100, 113.3}}), Rectangle(pattern = LinePattern.None, fillColor = {170, 255, 85}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 100}, {20, -100}}), Text(textString = "om", fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 63}, {20, 41}}), Text(textString = "tau", textStyle = {TextStyle.Italic}, fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, -43}, {20, -65}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-76.7, 156.7}, {100, 113.3}})}),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          Documentation(info = "<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>RotTauOut</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}
</STYLE>
   <LINK href=\"../format_help.css\" rel=\"stylesheet\"> 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19236\"></HEAD> 
<BODY>
<H1><FONT size=\"2\">20190123: default values&nbsp;are changed.</FONT></H1>
<UL>
  <LI>exact=false, f_crit=1000</LI></UL></BODY></HTML>
            "),
          experiment(StopTime = 1, StartTime = 0, Interval = 0.001));
      end RotTauOut;
      annotation (
        dateModified = "2019-01-23 01:13:51Z",
        Documentation(info = "<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Convert Causal to/frpm Acausal</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}
</STYLE>
   <LINK href=\"../format_help.css\" rel=\"stylesheet\"> 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19236\"></HEAD> 
<BODY>
<H1>Convert Causal to/from Acausal</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"68\" height=\"68\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABECAYAAAA4E5OyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAACISURBVHhe7dAxAQAwEAOh+jedzn8aQAJvHEJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICAkhISSEhJAQEkJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICAkhISSEhJAQEkJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICDm2DxXm++rfkKchAAAAAElFTkSuQmCC\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">TRAMI.Utilities.Adaptors</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">Adaptors.mo</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<UL>
  <LI>&nbsp;20181130</LI></UL>
<OL>
  <LI>ThTout: Thermal adaptor with HearFlowRate output and Temperature     
  input.</LI>
  <LI>ThQfOut: Thermal adaptor with Temperature output and HearFlowRate     
  input.</LI>
  <LI>RotWOut: Rotational adaptor with W(omega) output and Tau input.</LI>
  <LI>RotTauOut: Rotational adaptor with Tau&nbsp;output and W(omega)    
  input.</LI></OL>
<UL>
  <LI>20190122</LI></UL>
<OL>
  <LI>RotTauOut 's default parameters are changed.</LI></OL></BODY></HTML>
          "));
    end Adaptors;

    package PhysicalElements "Physical Elements Modified for TRAMI"
      // CP: 65001
      // SimulationX Version: 3.9.4.55045 x64

      model VariableInertia "Inertia with Signal Driven Value "
        Modelica.Mechanics.Rotational.Interfaces.Flange_a ctr1 "1-dim. rotational flange of a shaft (filled square icon)" annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b ctr2 "1-dim. rotational flange of a shaft (non-filled square icon)" annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{86.7, -10}, {106.7, 10}})));
        Modelica.Blocks.Interfaces.RealInput J(quantity = "Mechanics.Rotation.MomentOfInertia", displayUnit = "kgm²") "Moment of inertia" annotation (
          Placement(transformation(extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
        Real phi(quantity = "Mechanics.Rotation.Angle") "Absolute rotation angle of component";
        Real w(quantity = "Mechanics.Rotation.RotVelocity") "Absolute angular velocity of component (= der(phi))";
        Real a(quantity = "Mechanics.Rotation.RotAccel") "Absolute angular acceleration of component (= der(w))";
        Real tau(quantity = "Mechanics.Rotation.Torque") "Torque at flange";
      equation
        // enter your equations here
        ctr1.phi = phi;
        ctr2.phi = phi;
        ctr1.tau = tau;
        w = der(phi);
        a = der(w);
        J * a = ctr1.tau + ctr2.tau;
        annotation (
          Icon(graphics={  Rectangle(radius = 4, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-102.8, 9.5}, {100, -10}}), Rectangle(radius = 4, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, 50}, {50, -50}}), Line(points = {{-90.09999999999999, 23.4}, {-60.1, 23.4}}), Line(points = {{58.7, 23.2}, {88.7, 23.2}}), Line(points = {{-89.90000000000001, -23}, {-59.9, -23}}), Line(points = {{58.9, -23.2}, {88.90000000000001, -23.2}}), Line(points = {{-73.3, -76.7}, {73.3, -76.7}}), Line(points = {{72.3, -23.3}, {72.3, -76.7}}), Line(points = {{-73.09999999999999, -23.5}, {-73.09999999999999, -76.90000000000001}})}));
      end VariableInertia;

      model SimpleTM "Ideal gear without inertia"
        extends Modelica.Mechanics.Rotational.Icons.Gear;
        extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
        Modelica.Units.SI.Angle phi_a "Angle between left shaft flange and support";
        Modelica.Units.SI.Angle phi_b "Angle between right shaft flange and support";
        Modelica.Blocks.Interfaces.RealInput gearRatio "Actual gear ratio. Should be never zero during continuous integration." annotation (
          Placement(transformation(origin = {0, 106}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 106}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
      protected
        Real ratio "Gear ratio actually used (is never zero)";
        constant Real eps = 1.e-10;
      initial equation
        phi_a = ratio * phi_b;
      equation
        /* coppied from Power Train Library by C.Tsunemitsu @Dassault Systemes
  	     Analysis of a singular situation:
  	 
  	     gearRatio may change smoothly between forward and backward gear and
  	     then passes zero, i.e., gearRatio=0 can occur. Depending on the connection
  	     structure, the equations are either resolved for flange_b.tau or for
  	     flange_a.tau. In the latter case, a division by zero will occur when gearRatio=0:
  	 
  	          flange_a.tau = flange_b.tau / gearRatio
  	 
  	     This case is uninteresting, because in such a case the clutch attached to
  	     IdealCVT will be anyway released and therefore the torques are zero.
  	 
  	     To avoid the division by zero, one might use the guard:
  	 
  	          ratio = if noEvent(abs(gearRatio) > eps) then gearRatio else eps;
  	 
  	     However, this equation needs to be differentiated, since 
  	    
  	          der(phi_a) = ratio*der(phi_b)
  	 
  	     and the acceleration needs to be computed, which means that der(ratio) is
  	     needed. A Modelica tool might print a warning in this case, because
  	     differentiating an if-clause usually results in a dirac impulse. 
  	     Mathematically, this is really the case above, because the if-clause is
  	     discontinuous. This error should not be relevant and shall therefore
  	     be neglected. This can be formulated with the smooth(..) operator:
  	 
  	         ratio = smooth(100, if noEvent(abs(gearRatio) > eps) then gearRatio else eps);
  	 
  	     In some special cases, "gearRatio" can be a constant, say 1. The symbolic 
  	     transformation algorithms may then transform the above equation to
  	 
  	         ratio = smooth(100, 1);
  	 
  	     Dymola has the bug, that the second argument to smooth cannot be an Integer,
  	     contrary to the specification. If it is an Integer an error occurs.
  	     To avoid this error in Dymola, gearRatio is multiplied with a number that is
  	     nearly one. This gives a negliable error. 
  	 
  	     The above analysis results in the following equation:
  	  */
        ratio = smooth(100, noEvent(if abs(gearRatio) > eps then (1.0 + Modelica.Constants.eps) * gearRatio else eps));
        /*
  	  ratio = smooth(100, noEvent(if abs(gearRatio) > eps then gearRatio else eps));
  	  */
        der(phi_a) = ratio * der(phi_b);
        phi_a = flange_a.phi - phi_support;
        phi_b = flange_b.phi - phi_support;
        0 = ratio * flange_a.tau + flange_b.tau;
        annotation (
          Icon(graphics={  Text(textString = "%name", lineColor = {0, 0, 255}, fillPattern = FillPattern.None, extent = {{-153, 145}, {147, 105}})}),
          Documentation(info = "<html>
<p>
This element characterizes any type of gear box which is fixed in the
ground and which has one driving shaft and one driven shaft.
The gear is <b>ideal</b>, i.e., it does not have inertia, elasticity, damping
or backlash. If these effects have to be considered, the gear has to be
connected to other elements in an appropriate way.
</p>

</html>"));
      end SimpleTM;

      model HeatCapacitorInitT "Lumped thermal element storing heat"
        HeatPort port "Thermal port for 1-dim. heat transfer" annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-10, -106.7}, {10, -86.7}})));
        parameter Modelica.Units.SI.HeatCapacity C "Heat capacity of element (= cp*m)";
        Modelica.Units.SI.TemperatureSlope der_T(start = 0) "Time derivative of temperature (= der(T))";
        ThermodynamicTemperature T "Temperature of element" annotation (
          Dialog(group = "Initialization", showStartAttribute = true));
      equation
        T = port.T;
        der_T = der(T);
        C * der(T) = port.Q_flow;
        annotation (
          Icon(graphics={  Text(textString = "%name", lineColor = {0, 0, 255}, fillPattern = FillPattern.None, extent = {{-150, 110}, {150, 70}}), Polygon(points = ":189:
789C5CD23B0EC2300C8061AB13C76062E8C08000090670518B78D307709EDC8C1C892350E1DF484DA42AF9E43871D2642232E9BF4C92166BB5C13CFEBA70C725
BEE013AEF01517B831CB0AB738C71DFEBC2DCF3D8DC3F876E85025F63AD84F6BE2F4EAFB1EB0AFBBB13E3EF02CB130FF89C756B7BEF032B19AA3CFE75ED4D73B
13F77AB847AF2F70EFE146BCD1E47CF848BCC505EECCB260BE3B4F3C228F7C99EA60FFFFFFA2DEC0B9648F4BBCC3FE1ED69CC7D7A1F5EFE90B0000FFFF",
                                                                                                                           lineColor = {160, 160, 164}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Polygon(points = ":201:
789C5CD14B0AC2400C06E0D033B874E1C2851411AC5228428DD0966AAB687D9C676EE61CC92358CC1F212994F0919964669210D172FC13D2EF1C7F211C587C13
53010F700ADFE1CF5BF6A957D1E6F7D6A1763E21A21F5F914764EDDBC25AB794181F70E64C58FF8467726E7EC1B9338BA3AEAF91D77A1DF283CBEB792AE712EB
D55B572F739E3B93ABB7C07DB47FEEACEFA173AB90D7F73C4A0C1DDCC33A8FFFFCADA940BC20A6CE13E729DBFD6B36FD680363EEB4835BED0F3770C3E63EA1B7
F5C7F55F000000FFFF",
                   fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Text(textString = "%C", fillPattern = FillPattern.None, extent = {{-69, 7}, {71, -24}})}),
          Diagram(graphics={  Polygon(points = ":189:
789C5CD23B0EC2300C8061AB13C76062E8C08000090670518B78D307709EDC8C1C892350E1DF484DA42AF9E43871D2642232E9BF4C92166BB5C13CFEBA70C725
BEE013AEF01517B831CB0AB738C71DFEBC2DCF3D8DC3F876E85025F63AD84F6BE2F4EAFB1EB0AFBBB13E3EF02CB130FF89C756B7BEF032B19AA3CFE75ED4D73B
13F77AB847AF2F70EFE146BCD1E47CF848BCC505EECCB260BE3B4F3C228F7C99EA60FFFFFFA2DEC0B9648F4BBCC3FE1ED69CC7D7A1F5EFE90B0000FFFF",
                                                                                                                           lineColor = {160, 160, 164}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Polygon(points = ":201:
789C5CD14B0AC2400C06E0D033B874E1C2851411AC5228428DD0966AAB687D9C676EE61CC92358CC1F212994F0919964669210D172FC13D2EF1C7F211C587C13
53010F700ADFE1CF5BF6A957D1E6F7D6A1763E21A21F5F914764EDDBC25AB794181F70E64C58FF8467726E7EC1B9338BA3AEAF91D77A1DF283CBEB792AE712EB
D55B572F739E3B93ABB7C07DB47FEEACEFA173AB90D7F73C4A0C1DDCC33A8FFFFCADA940BC20A6CE13E729DBFD6B36FD680363EEB4835BED0F3770C3E63EA1B7
F5C7F55F000000FFFF",
                   fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Ellipse(lineColor = {255, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-6, -1}, {6, -12}}), Text(textString = "T", fillPattern = FillPattern.None, extent = {{11, 13}, {50, -25}}), Line(points = {{0, -12}, {0, -96}}, color = {255, 0, 0})}),
          Documentation(info = "<HTML><HEAD>
<META charset=\"utf-8\">
<STYLE type=\"text/css\">
a {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;}
body, blockquote, table, p, li, dl, ul, ol {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; color: black;}
h3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11pt; font-weight: bold;}
h4 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold;}
h5 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold;}
h6 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold; font-style:italic}
pre {font-family: Courier, monospace; font-size: 9pt;}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<P>This is a generic model for the heat capacity of a material. No specific 
geometry is assumed beyond a total volume with uniform temperature for the 
entire volume. Furthermore, it is assumed that the heat capacity is constant 
(independent of temperature). </P>
<P>The temperature T [Kelvin] of this component is a <B>state</B>. A default of 
T = 25 degree Celsius (= SIunits.Conversions.from_degC(25)) is used as start 
value for initialization. This usually means that at start of integration the 
temperature of this component is 25 degrees Celsius. You may, of course, define 
a different temperature as start value for initialization. Alternatively, it is 
possible to set parameter <B>steadyStateStart</B> to <B>true</B>. In this case
 the additional equation '<B>der</B>(T) = 0' is used during initialization, 
i.e., the temperature T is computed in such a way that the component starts in 
<B>steady state</B>. This is useful in cases, where one would like to start 
simulation in a suitable operating point without being forced to integrate for a 
long time to arrive at this point. </P>
<P>Note, that parameter <B>steadyStateStart</B> is not available in the 
parameter menu of the simulation window, because its value is utilized during 
translation to generate quite different equations depending on its setting. 
Therefore, the value of this parameter can only be changed before translating 
the model. </P>
<P>This component may be used for complicated geometries where the heat capacity 
C is determined my measurements. If the component consists mainly of one type of 
material, the <B>mass m</B> of the component may be measured or calculated and 
multiplied with the <B>specific heat capacity cp</B> of the component material 
to compute C: </P>
<PRE>   C = cp*m.
   Typical values for cp at 20 degC in J/(kg.K):
      aluminium   896
      concrete    840
      copper      383
      iron        452
      silver      235
      steel       420 ... 500 (V2A)
      wood       2500
</PRE></BODY></HTML>
            "));
      end HeatCapacitorInitT;

      type ThermodynamicTemperature = Real(final quantity = "ThermodynamicTemperature", final unit = "K", min = 0.0, displayUnit = "degC") "Absolute temperature (use type TemperatureDifference for relative temperatures)" annotation (
        absoluteValue = true);

      connector HeatPort "Thermal port for 1-dim. heat transfer"
        ThermodynamicTemperature T "Port temperature";
        flow Modelica.Units.SI.HeatFlowRate Q_flow "Heat flow rate (positive if flowing from outside into the component)";
        annotation (
          Icon(graphics={  Rectangle(lineColor = {165, 42, 42}, fillColor = {165, 42, 42}, fillPattern = FillPattern.Solid, extent = {{-30, 20}, {23.3, -30}})}),
          Documentation(info = "<html>

</html>"));
      end HeatPort;
      annotation (
        dateModified = "2018-11-29 12:01:11Z",
        Documentation(info = "<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Physical Elements Modified for TRAMI</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}
</STYLE>
 <LINK href=\"../format_help.css\" rel=\"stylesheet\">
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19180\"></HEAD>
<BODY> 
<H1>Physical Elements Modified for TRAMI</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"68\" height=\"68\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABECAYAAAA4E5OyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAACISURBVHhe7dAxAQAwEAOh+jedzn8aQAJvHEJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICAkhISSEhJAQEkJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICAkhISSEhJAQEkJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICDm2DxXm++rfkKchAAAAAElFTkSuQmCC\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">TRAMI.Utilities.PhysicalElements</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">PhysicalElements.mo</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<UL>
  <LI>&nbsp;20181130</LI></UL>
<OL>
  <LI>VariableInertia : Inertia model with&nbsp;variable inertia given via a 
  signal port.</LI>
  <LI>SimpleTM : Gear Ratio model with variable ratil given via a signal 
  port.</LI>
  <LI>Heat CapacitorInit: Heat Capacitor model with explicitly defined start 
  temperature</LI></OL></BODY></HTML>
          "));
    end PhysicalElements;

    package Blocks "Extended Signal Blocks"
      // CP: 65001
      // SimulationX Version: 3.9.4.55045 x64

      package Interfaces "Interfaces"
        partial block SI3SO "3 Single Input / 1 Single Output continuous control block"
          Modelica.Blocks.Interfaces.RealInput u1 "Connector of Real input signal 1" annotation (
            Placement(transformation(extent = {{-140, 40}, {-100, 80}}), iconTransformation(extent = {{-140, 40}, {-100, 80}})));
          Modelica.Blocks.Interfaces.RealInput u2 "Connector of Real input signal 1" annotation (
            Placement(transformation(extent = {{-140, -20}, {-100, 20}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
          Modelica.Blocks.Interfaces.RealInput u3 "Connector of Real input signal 2" annotation (
            Placement(transformation(extent = {{-140, -80}, {-100, -40}}), iconTransformation(extent = {{-140, -80}, {-100, -40}})));
          Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation (
            Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
          extends Modelica.Blocks.Icons.Block;
          annotation (
            Documentation(info = "<html>
<p>
Block has two continuous Real input signals u1 and u2 and one
continuous Real output signal y.
</p>
</html>"));
        end SI3SO;

        partial block SI4SO "SI4SO"
          extends SI3SO;
          Modelica.Blocks.Interfaces.IntegerInput nGear "'input Integer' as connector" annotation (
            Placement(transformation(extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
        end SI4SO;

        type Smoothness = enumeration(Linear "linear interpolate", Spline "spline interpolate") "Smoothness of table interpolation" annotation (
          initValue = Spline);
        connector TIn = input Real(unit = "K") "Temperatue Signal Input" annotation (
          defaultComponentName = "Tin",
          Icon(graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-100.0, 100.0}, {100.0, 0.0}, {-100.0, -100.0}})}, coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.2)),
          Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{0.0, 50.0}, {100.0, 0.0}, {0.0, -50.0}, {0.0, 50.0}}), Text(lineColor = {0, 0, 127}, extent = {{-10.0, 60.0}, {-10.0, 85.0}}, textString = "%name")}),
          Documentation(info = "<html>
  			<p>
  			Connector with one input signal of type Real(K).
  			</p>
  			</html>"));
        connector TOut = output Real(unit = "K") "Temperature Signal Output" annotation (
          defaultComponentName = "Tout",
          Icon(graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100.0, 100.0}, {100.0, 0.0}, {-100.0, -100.0}})}, coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.2)),
          Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{0.0, 50.0}, {100.0, 0.0}, {0.0, -50.0}, {0.0, 50.0}}), Text(lineColor = {0, 0, 127}, extent = {{-10.0, 60.0}, {-10.0, 85.0}}, textString = "%name")}),
          Documentation(info = "<html>
  			<p>
  			Connector with one output signal of type Real(K).
  			</p>
  			</html>"));
        connector QfIn = input Real(unit = "W") "Heat Flow Rate Signal Input" annotation (
          defaultComponentName = "QfIn",
          Icon(graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-100.0, 100.0}, {100.0, 0.0}, {-100.0, -100.0}})}, coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.2)),
          Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{0.0, 50.0}, {100.0, 0.0}, {0.0, -50.0}, {0.0, 50.0}}), Text(lineColor = {0, 0, 127}, extent = {{-10.0, 60.0}, {-10.0, 85.0}}, textString = "%name")}),
          Documentation(info = "<html>
  			<p>
  			Connector with one input signal of type Real(W).
  			</p>
  			</html>"));
        connector QfOut = output Real(unit = "W") "Heat Flow Rate Signal Output" annotation (
          defaultComponentName = "QfOut",
          Icon(graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100.0, 100.0}, {100.0, 0.0}, {-100.0, -100.0}})}, coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.2)),
          Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{0.0, 50.0}, {100.0, 0.0}, {0.0, -50.0}, {0.0, 50.0}}), Text(lineColor = {0, 0, 127}, extent = {{-10.0, 60.0}, {-10.0, 85.0}}, textString = "%name")}),
          Documentation(info = "<html>
  			<p>
  			Connector with one output signal of type Real(W).
  			</p>
  			</html>"));
        connector tauIn = input Real(unit = "N.m") "Torque Signal Input" annotation (
          defaultComponentName = "tauIn",
          Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127}, fillPattern = FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
          Documentation(info = "<html>
  			<p>
  			Connector with one input signal of type Real(N.m).
  			</p>
  			</html>"));
        connector tauOut = output Real(unit = "N.m") "Torque Signal Output" annotation (
          defaultComponentName = "tauOut",
          Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127}, fillPattern = FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
          Documentation(info = "<html>
  			<p>
  			Connector with one output signal of type Real(N.m).
  			</p>
  			</html>"));
        connector wIn = input Real(unit = "rad/s") "Rot. Velocity Signal Input" annotation (
          defaultComponentName = "wIn",
          Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127}, fillPattern = FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
          Documentation(info = "<html>
  			<p>
  			Connector with one input signal of type Real(rad/s).
  			</p>
  			</html>"));
        connector wOut = output Real(unit = "rad/s") "Rot. Velocity Signal Output" annotation (
          defaultComponentName = "wOut",
          Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127}, fillPattern = FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
          Documentation(info = "<html>
  			<p>
  			Connector with one output signal of type Real(rad/s).
  			</p>
  			</html>"));
        connector CSigIn = input Real "Control Signal Input" annotation (
          defaultComponentName = "CSigIn",
          Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 127, 0}, fillColor = {0, 127, 0}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 127, 0}, fillColor = {0, 127, 0}, fillPattern = FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127}, fillPattern = FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
          Documentation(info = "<html>
  			<p>
  			Connector with one input signal of type Real.
  			</p>
  			</html>"));
        connector CSigOut = output Real "Control Signal Output" annotation (
          defaultComponentName = "CSigOut",
          Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 127, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {0, 127, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127}, fillPattern = FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
          Documentation(info = "<html>
  			<p>
  			Connector with one output signal of type Real(K).
  			</p>
  			</html>"));
        connector ESigIn = input Real "External Signal Input" annotation (
          defaultComponentName = "ESigIn",
          Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127}, fillPattern = FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
          Documentation(info = "<html>
  			<p>
  			Connector with one input signal of type Real.
  			</p>
  			</html>"));
        connector ESigOut = output Real "External Signal Output" annotation (
          defaultComponentName = "ESigOut",
          Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {191, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics = {Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {191, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127}, fillPattern = FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
          Documentation(info = "<html>
  			<p>
  			Connector with one output signal of type Real.
  			</p>
  			</html>"));
        annotation (
          dateModified = "2018-11-02 10:35:40Z");
      end Interfaces;

      block CombiTable3D "3-Dim Table"
        parameter String fileName = "NoName" "File where matrixes is stored";
        parameter String tableName = "test" "TableName";
        parameter Real zi[:] = {1, 2, 3} "z axis values";
        Modelica.Blocks.Tables.CombiTable2Ds block1[nz](each tableOnFile = true, tableName = {tableName + String(i) for i in 1:nz}, each fileName = fileName) "Table look-up in two dimensions (matrix/file)" annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}})));
        parameter Boolean noExtrapolate = true "Do not Extrapolate(unavailable)";
        //	protected
        parameter Integer nz = size(zi, 1) "number of zi";
      public
        extends Interfaces.SI3SO;
      algorithm
        // enter your algorithm here
        if noExtrapolate and (u3 < zi[1] or u3 >= zi[nz]) then
          if u3 < zi[1] then
            y := block1[1].y;
          else
            y := block1[nz].y;
          end if;
        else
          y := Modelica.Math.Vectors.interpolate(zi, block1.y, u3);
        end if;
      equation
        // enter your equations here
        for i in 1:nz loop
          block1[i].u1 = u1;
          block1[i].u2 = u2;
        end for;
      end CombiTable3D;

      block CombiTable3D1I "Combination of 3-Dim Tables"
        parameter String fileName = "noName" "File where matrixis stored";
        parameter String tableName = "test" "TableName";
        parameter Integer nGears[:] = {1, 2, 3, 4, 5, 6} "numbers of Shift Gear";
        parameter Real zi[:] = {1, 2, 3} "z axis values";
      protected
        parameter Integer nGearsNum = size(nGears, 1);
      public
        parameter Boolean noExtrapolate = true "Do not Extrapolate(unavailable)";
        CombiTable3D combiTable3D1[nGearsNum](fileName = {Modelica.Utilities.Strings.substring(fileName, 1, Modelica.Utilities.Strings.findLast(fileName, String(min(nGears))) - 1) + String(i) + Modelica.Utilities.Strings.substring(fileName, Modelica.Utilities.Strings.findLast(fileName, String(min(nGears))) + Modelica.Utilities.Strings.length(String(min(nGears))), Modelica.Utilities.Strings.length(fileName)) for i in nGears}, each tableName = tableName, each zi = zi) "CoombiTable3D" annotation (
          Placement(transformation(extent = {{45, -10}, {65, 10}})));
      protected
        Integer calcIndex = min(max(nGear - min(nGears) + 1, 1), nGearsNum) "Variable";
      public
        extends Interfaces.SI4SO;
      equation
        // enter your equations here
        for i in 1:size(nGears, 1) loop
          combiTable3D1[i].u1 = u1;
          combiTable3D1[i].u2 = u2;
          combiTable3D1[i].u3 = u3;
        end for;
        y = combiTable3D1[calcIndex].y;
        annotation (
          Documentation(info = "<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=shift_jis\">
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19204\"></HEAD>
<BODY>
<P>&nbsp;2018/12/19</P>
<P>Input integer value of calcIndex is limited to avoid out of array 
range.&nbsp;</P></BODY></HTML>
            "));
      end CombiTable3D1I;

      block RadSToRPM "Rad/S to RPM"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = Modelica.Units.Conversions.to_rpm(u);
      end RadSToRPM;

      block RPMToRadS "RPM to rad/s"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = Modelica.Units.Conversions.from_rpm(u);
      end RPMToRadS;

      block KelvinToCelcius "Kelvin To Celsius"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = Modelica.Units.Conversions.to_degC(u);
      end KelvinToCelcius;

      block CelciusToKelvin "Celsius to Kelvin"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = Modelica.Units.Conversions.from_degC(u);
      end CelciusToKelvin;

      block M2sTomm2s "m2/s to mm2/s"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = 1000000 * u;
      end M2sTomm2s;

      block PaTokPa "Pa to kPa"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = u / 1000;
      end PaTokPa;

      block MsToKms "m/s to km/s"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = Modelica.Units.Conversions.to_kmh(u);
      end MsToKms;

      block M3sToLmin "m3/s to l/min"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = 60000 * u;
      end M3sToLmin;

      block Mm2sTom2s "mm2/s to m2/s"
        extends Modelica.Blocks.Interfaces.SISO;
      equation
        // enter your equations here
        y = u / 1000000;
      end Mm2sTom2s;
      annotation (
        dateModified = "2018-12-19 03:29:45Z",
        Documentation(info = "<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Extended Signal Blocks</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}
</STYLE>
  <LINK href=\"../format_help.css\" rel=\"stylesheet\"> 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19204\"></HEAD> 
<BODY>
<H1>Extended Signal Blocks</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"68\" height=\"68\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABECAYAAAA4E5OyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAACISURBVHhe7dAxAQAwEAOh+jedzn8aQAJvHEJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICAkhISSEhJAQEkJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICAkhISSEhJAQEkJCSAgJISEkhISQEBJCQkgICSEhJISEkBASQkJICDm2DxXm++rfkKchAAAAAElFTkSuQmCC\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">TRAMI.Utilities.Blocks</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">Blocks.mo</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<UL>
  <LI>20181130:CombiTable3D and CombiTable3D1I&nbsp;support linear interpolation 
    only.&nbsp; </LI>
  <LI>20181130:Nine(9) unit conversion elements</LI></UL>
<P>20181219&nbsp; CombiTable3D1I is modified to avoid out of array range.</P>
<P>&nbsp;</P></BODY></HTML>
          "));
    end Blocks;
  end Thermal;
end TransMission;
