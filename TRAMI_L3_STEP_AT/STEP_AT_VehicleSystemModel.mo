within TRAMI_L3_STEP_AT;
model STEP_AT_VehicleSystemModel
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
  parameter Real Oil_Viscosity_Breakpoint[:] = {6.7e-6, 8.2e-6, 11.2e-6, 16.9e-6, 31.2e-6, 65.9e-6};
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(visible = true, transformation(origin = {190, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {190, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y1 annotation (
    Placement(visible = true, transformation(origin = {190, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {190, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.ContinuousClock clock(offset = 0, startTime = 0) annotation (
    Placement(visible = true, transformation(origin = {-294, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(columns = 2:8, fileName = currDir + "/ModelicaInputData.txt", smoothness = Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-258, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Control.MultiSignal_Input multiSignal_Input annotation (
    Placement(visible = true, transformation(origin = {-84, 62}, extent = {{-10, -30}, {10, 30}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Control.TCU_Main_Execution tCU_Main_Execution(samplePeriod = 0.01) annotation (
    Placement(visible = true, transformation(origin = {-52, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Control.MultiSignal_Output multiSignal_Output annotation (
    Placement(visible = true, transformation(origin = {-22, 66}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Vehicle.Driver driver(Accelerator_FileName = "Accelerator_open_per_MAP.txt", Accelerator_tabName = "Accelerator_open_per_MAP", Coef_A = vehicle.Coef_A, Coef_C = vehicle.Coef_C, Final_GearRatio = transMission.at_ds.finalGear.GearRatio, Jfw = transMission.Flywheel.Jfw, Mv = vehicle.Mv, Rt = vehicle.Rt) annotation (
    Placement(visible = true, transformation(origin = {-168, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Vehicle.EngineController engineController1 annotation (
    Placement(visible = true, transformation(origin = {-172, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Vehicle.ENGINE engine1 annotation (
    Placement(visible = true, transformation(origin = {-144, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.Min min2 annotation (
    Placement(visible = true, transformation(origin = {-118, -6}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.TransMission transMission(Oil_Viscosity_Breakpoint = {4.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6}) annotation (
    Placement(visible = true, transformation(origin = {58.1684, -17.5504}, extent = {{-10.3448, -30}, {10.3448, 30}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Vehicle.VEHICLE vehicle annotation (
    Placement(visible = true, transformation(origin = {154, -4}, extent = {{-25, -15}, {20, 15}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Thermal.ThermalModelAll thermalModelAll(Nutable1 = {{-30, 39.4}, {0, 39.4}, {20, 39.4}, {40, 18.0}, {60, 9.7}, {80, 6.0}, {100, 4.1}, {120, 4.1}}, R1 = 100, R2 = 0.340, R3 = 100, R4 = 100, R5 = 0.004, R6 = 0.0001, R7 = 0.07, RhoTable1 = {{-30, 39.4}, {0, 39.4}, {20, 39.4}, {40, 18.0}, {60, 9.7}, {80, 6.0}, {100, 4.1}, {120, 4.1}}, T0(displayUnit = "degC") = 300, T1(displayUnit = "degC") = 300, T2(displayUnit = "degC") = 300, T3(displayUnit = "degC") = 300, c1 = 10000, c2 = 30000, c3 = 15000, c4 = 10000, table1 = {{0, 0.015}, {10, 0.015}, {20, 0.015}, {30, 0.014}, {40, 0.014}, {50, 0.014}, {60, 0.013}, {70, 0.013}, {80, 0.013}, {90, 0.012}, {100, 0.012}, {110, 0.012}, {120, 0.012}, {130, 0.011}, {140, 0.011}, {150, 0.011}, {160, 0.010}}) annotation (
    Placement(visible = true, transformation(origin = {40, -112}, extent = {{-12.5, -50}, {12.5, 50}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant degC2K(k = 273.15) annotation (
    Placement(visible = true, transformation(origin = {-86, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add air annotation (
    Placement(visible = true, transformation(origin = {-52, -56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add eng annotation (
    Placement(visible = true, transformation(origin = {-52, -74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add pt_th annotation (
    Placement(visible = true, transformation(origin = {-52, -92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain rads2rpm(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-208, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant dummy_Batt_V(k = 12) annotation (
    Placement(visible = true, transformation(origin = {-28, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Step initialize(height = -1, offset = 1, startTime = 0.001) annotation (
    Placement(visible = true, transformation(origin = {-134, 92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    
    
    
equation
  connect(engine1.tau_engine_target, multiSignal_Input.tau_engine_target) annotation (
    Line(points = {{-135, 2}, {-130, 2}, {-130, 44}, {-94, 44}}, color = {0, 0, 127}));
  connect(transMission.w_ENG_PNT_radps, engine1.w_ENG_PNT_radps) annotation (
    Line(points = {{70, -10}, {86, -10}, {86, 20}, {26, 20}, {26, 6}, {-135, 6}}, color = {0, 0, 127}));
  connect(engine1.accel_position_per1, engineController1.accel_position_per1) annotation (
    Line(points = {{-153, 4}, {-161, 4}}, color = {0, 0, 127}));
  connect(engine1.tau_engine_target, min2.u1) annotation (
    Line(points = {{-135, 2}, {-130, 2}, {-130, -2}, {-125, -2}}, color = {0, 0, 127}));
  connect(multiSignal_Output.ratio_AT, driver.Ratio_AT) annotation (
    Line(points = {{-10, 52}, {-4, 52}, {-4, -24}, {-234, -24}, {-234, 40}, {-178, 40}}, color = {0, 0, 127}));
  connect(transMission.w_ENG_PNT_radps, driver.w_ENG_PNT_radps) annotation (
    Line(points = {{70, -10}, {86, -10}, {86, 20}, {26, 20}, {26, 6}, {-96, 6}, {-96, -20}, {-230, -20}, {-230, 30}, {-178, 30}}, color = {0, 0, 127}));
  connect(vehicle.v_vehicle_mps, driver.v_vehicle_mps) annotation (
    Line(points = {{162, 0}, {170, 0}, {170, 122}, {-188, 122}, {-188, 36}, {-178, 36}}, color = {0, 0, 127}));
  connect(driver.accel_position_per, multiSignal_Input.accel_position_per) annotation (
    Line(points = {{-155, 46}, {-152, 46}, {-152, 68}, {-96, 68}}, color = {0, 0, 127}));
  connect(driver.tau_brake, multiSignal_Input.tau_brake) annotation (
    Line(points = {{-155, 36}, {-124, 36}, {-124, 56}, {-96, 56}}, color = {0, 0, 127}));
  connect(driver.tau_brake, vehicle.tau_brake) annotation (
    Line(points = {{-155, 36}, {-124, 36}, {-124, 26}, {138, 26}, {138, -6}, {146, -6}, {146, -4}}, color = {0, 0, 127}));
  connect(combiTable1Ds.y[1], driver.Target_Speed) annotation (
    Line(points = {{-246, 72}, {-198, 72}, {-198, 54}, {-178, 54}}, color = {0, 0, 127}, thickness = 0.5));
  connect(driver.accel_position_per, engineController1.accel_position_per) annotation (
    Line(points = {{-155, 46}, {-152, 46}, {-152, 24}, {-190, 24}, {-190, 12}, {-186, 12}}, color = {0, 0, 127}));
  connect(combiTable1Ds.y[6], eng.u1) annotation (
    Line(points = {{-246, 72}, {-238, 72}, {-238, -52}, {-64, -52}, {-64, -70}, {-59, -70}}, color = {0, 0, 127}, thickness = 0.5));
  connect(combiTable1Ds.y[7], pt_th.u1) annotation (
    Line(points = {{-246, 72}, {-238, 72}, {-238, -52}, {-64, -52}, {-64, -88}, {-59, -88}}, color = {0, 0, 127}, thickness = 0.5));
  connect(combiTable1Ds.y[5], air.u1) annotation (
    Line(points = {{-246, 72}, {-238, 72}, {-238, -52}, {-59, -52}}, color = {0, 0, 127}, thickness = 0.5));
  connect(combiTable1Ds.y[7], multiSignal_Input.t_engine_water_k) annotation (
    Line(points = {{-246, 72}, {-94, 72}}, color = {0, 0, 127}, thickness = 0.5));
  connect(combiTable1Ds.y[2], multiSignal_Input.trans_shifter_position) annotation (
    Line(points = {{-246, 72}, {-118, 72}, {-118, 64}, {-96, 64}, {-96, 64}}, color = {0, 0, 127}, thickness = 0.5));
  connect(combiTable1Ds.y[3], multiSignal_Input.tau_engine_min_pos) annotation (
    Line(points = {{-246, 72}, {-118, 72}, {-118, 36}, {-94, 36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(combiTable1Ds.y[4], multiSignal_Input.tau_engine_max_pos) annotation (
    Line(points = {{-246, 72}, {-118, 72}, {-118, 32}, {-94, 32}}, color = {0, 0, 127}, thickness = 0.5));
  connect(clock.y, combiTable1Ds.u) annotation (
    Line(points = {{-283, 72}, {-270, 72}}, color = {0, 0, 127}));
  connect(transMission.w_ENG_PNT_radps, rads2rpm.u) annotation (
    Line(points = {{70, -10}, {86, -10}, {86, 20}, {26, 20}, {26, 6}, {-96, 6}, {-96, -20}, {-230, -20}, {-230, 0}, {-220, 0}}, color = {0, 0, 127}));
  connect(transMission.w_ENG_PNT_radps, multiSignal_Input.w_engine_radps) annotation (
    Line(points = {{70, -10}, {86, -10}, {86, 20}, {26, 20}, {26, 6}, {-112, 6}, {-112, 52}, {-94, 52}}, color = {0, 0, 127}));
  connect(multiSignal_Output.flag_trans_lock_up, engineController1.flag_trans_lock_up) annotation (
    Line(points = {{-10, 48}, {-8, 48}, {-8, -14}, {-190, -14}, {-190, -4}, {-184, -4}, {-184, -4}}, color = {0, 0, 127}));
  connect(multiSignal_Output.ratio_AT, transMission.ratio_AT) annotation (
    Line(points = {{-9, 52}, {-4, 52}, {-4, -18}, {46, -18}}, color = {0, 0, 127}));
  connect(multiSignal_Output.tau_lockup_cap, transMission.tau_lockup_cap) annotation (
    Line(points = {{-9, 80}, {38, 80}, {38, 5}, {46, 5}}, color = {0, 0, 127}));
connect(multiSignal_Output.qv_cooler_trans_fluid_m3ps, thermalModelAll.VIdot1OilCooler) annotation (
    Line(points = {{-9, 64}, {6, 64}, {6, -99.5}, {5, -99.5}}, color = {0, 0, 127}));
  connect(multiSignal_Output.tau_engine_max_req, min2.u2) annotation (
    Line(points = {{-9, 56}, {0, 56}, {0, 20}, {-128, 20}, {-128, -10}, {-125, -10}}, color = {0, 0, 127}));
connect(multiSignal_Output.qv_cooler_eng_water_m3ps, thermalModelAll.VIdot2OilCooler) annotation (
    Line(points = {{-9, 60}, {10, 60}, {10, -99.5}}, color = {0, 0, 127}));
  connect(tCU_Main_Execution.Sfunction_Out1, multiSignal_Output.u) annotation (
    Line(points = {{-41, 66}, {-32, 66}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiSignal_Output.p_line_Pa, transMission.p_line_Pa) annotation (
    Line(points = {{-9, 76}, {34, 76}, {34, -23}, {46, -23}}, color = {0, 0, 127}));
  connect(transMission.I_actuator_A, multiSignal_Output.i_actuator_ampere) annotation (
    Line(points = {{46, -34}, {22, -34}, {22, 72}, {-9, 72}}, color = {0, 0, 127}));
  connect(transMission.I_EOP_A, multiSignal_Output.i_eop_ampere) annotation (
    Line(points = {{46, -40}, {18, -40}, {18, 69}, {-9, 69}}, color = {0, 0, 127}));
  connect(multiSignal_Output.tau_clutch_cap, transMission.tau_clutch_cap) annotation (
    Line(points = {{-9, 84}, {42, 84}, {42, 11}, {46, 11}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiSignal_Input.y, tCU_Main_Execution.SFunction_in1) annotation (
    Line(points = {{-71, 70}, {-63, 70}}, color = {0, 0, 127}, thickness = 0.5));
  connect(min2.y, transMission.trq_FW_PNT_in_Nm) annotation (
    Line(points = {{-111, -6}, {46, -6}}, color = {0, 0, 127}));
  connect(min2.y, multiSignal_Input.tau_engine) annotation (
    Line(points = {{-111, -6}, {-108, -6}, {-108, 40}, {-94, 40}}, color = {0, 0, 127}));
  connect(rads2rpm.y, engineController1.Neng) annotation (
    Line(points = {{-197, 0}, {-184, 0}}, color = {0, 0, 127}));
  connect(engineController1.w_engine_idle_radps, multiSignal_Input.w_engine_idle_radps) annotation (
    Line(points = {{-163, 11}, {-156, 11}, {-156, 18}, {-116, 18}, {-116, 48}, {-94, 48}}, color = {0, 0, 127}));
  connect(initialize.y, multiSignal_Input.flag_initialize) annotation (
    Line(points = {{-127, 92}, {-94, 92}}, color = {0, 0, 127}));
  connect(vehicle.v_vehicle_mps, y) annotation (
    Line(points = {{162, 0}, {170, 0}, {170, 12}, {190, 12}, {190, 12}}, color = {0, 0, 127}));
  connect(vehicle.out_vehicle_G_g, y1) annotation (
    Line(points = {{162.6, -2.8}, {164.6, -2.8}, {164.6, -2.8}, {166.6, -2.8}, {166.6, -2.8}, {175, -2.8}, {175, -10.8}, {190.6, -10.8}, {190.6, -10.8}, {190.6, -10.8}, {190.6, -10.8}}, color = {0, 0, 127}));
connect(vehicle.v_vehicle_mps, thermalModelAll.vCaseHousing) annotation (
    Line(points = {{162, 0}, {170, 0}, {170, -68}, {40, -68}, {40, -99.5}}, color = {0, 0, 127}));
  connect(vehicle.w_DS_PNT_out_radps, transMission.w_DS_PNT_out_radps) annotation (
    Line(points = {{144, 2}, {90, 2}, {90, 24}, {30, 24}, {30, -12}, {46, -12}}, color = {0, 0, 127}));
  connect(vehicle.v_vehicle_mps, multiSignal_Input.v_vehicle_mps) annotation (
    Line(points = {{162, 0}, {170, 0}, {170, 122}, {-114, 122}, {-114, 60}, {-94, 60}}, color = {0, 0, 127}));
connect(eng.y, thermalModelAll.TinENtoCH) annotation (
    Line(points = {{-45, -74}, {25, -74}, {25, -99.5}}, color = {0, 0, 127}));
connect(thermalModelAll.ToutOil, multiSignal_Input.TinOil_K) annotation (
    Line(points = {{65, -124}, {65, -123}, {66, -123}, {66, -132}, {-104, -132}, {-104, 76}, {-94, 76}}, color = {191, 0, 0}));
  connect(transMission.w_gearbox_input_radps, multiSignal_Input.w_gearbox_input_radps) annotation (
    Line(points = {{70, 7}, {74, 7}, {74, 100}, {-102, 100}, {-102, 88}, {-94, 88}}, color = {0, 0, 127}));
  connect(transMission.w_gearbox_output_radps, multiSignal_Input.w_gearbox_output_radps) annotation (
    Line(points = {{70, 1}, {78, 1}, {78, 104}, {-106, 104}, {-106, 84}, {-94, 84}}, color = {0, 0, 127}));
  connect(transMission.V_BT_PNT_Lo_V, dummy_Batt_V.y) annotation (
    Line(points = {{46, -46}, {-21, -46}}, color = {0, 0, 127}));
connect(thermalModelAll.QfStartDevice, transMission.Qf_SD_PNT_W) annotation (
    Line(points = {{60, -99.5}, {60, -80}, {114, -80}, {114, -27}, {70, -27}}, color = {191, 0, 0}));
connect(thermalModelAll.QfGear, transMission.Qf_GB_PNT_W) annotation (
    Line(points = {{55, -99.5}, {55, -76}, {110, -76}, {110, -33}, {70, -33}}, color = {191, 0, 0}));
connect(thermalModelAll.QfOil, transMission.Qf_HYD_W) annotation (
    Line(points = {{50, -99.5}, {50, -72}, {106, -72}, {106, -38}, {70, -38}}, color = {191, 0, 0}));
connect(thermalModelAll.nuOil, transMission.nu_oil_m2ps) annotation (
    Line(points = {{70, -99.5}, {70, -64}, {40, -64}, {40, -1}, {46, -1}}, color = {191, 0, 0}));
connect(air.y, thermalModelAll.TinAirtoCH) annotation (
    Line(points = {{-45, -56}, {35, -56}, {35, -99.5}}, color = {0, 0, 127}));
connect(eng.y, thermalModelAll.TinENtoSD) annotation (
    Line(points = {{-45, -74}, {30, -74}, {30, -99.5}}, color = {0, 0, 127}));
connect(pt_th.y, thermalModelAll.TinTStoOC) annotation (
    Line(points = {{-45, -92}, {0, -92}, {0, -99.5}}, color = {0, 0, 127}));
  connect(degC2K.y, eng.u2) annotation (
    Line(points = {{-80, -70}, {-68, -70}, {-68, -78}, {-59, -78}}, color = {0, 0, 127}));
  connect(degC2K.y, pt_th.u2) annotation (
    Line(points = {{-80, -70}, {-68, -70}, {-68, -96}, {-59, -96}}, color = {0, 0, 127}));
  connect(degC2K.y, air.u2) annotation (
    Line(points = {{-80, -70}, {-68, -70}, {-68, -60}, {-59, -60}}, color = {0, 0, 127}));
connect(thermalModelAll.ToutOil, transMission.ToutOil) annotation (
    Line(points = {{66, -124}, {66, -132}, {-40, -132}, {-40, -29}, {46, -29}}, color = {191, 0, 0}));
  connect(transMission.trq_DS_PNT_out_Nm, vehicle.trq_DS_PNT_out_Nm) annotation (
    Line(points = {{70, -16}, {90, -16}, {90, -2}, {144, -2}, {144, -2}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-360, -200}, {220, 200}})),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    experiment(StartTime = 0, StopTime = 1800, Tolerance = 1e-06, Interval = 0.1),
    Icon(coordinateSystem(extent = {{-240, -200}, {280, 200}})),
    __OpenModelica_simulationFlags(cpu = "()", lv = "LOG_STATS", noEventEmit = "()", outputFormat = "mat", s = "dassl"));
end STEP_AT_VehicleSystemModel;
