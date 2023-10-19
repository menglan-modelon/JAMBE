within TRAMI_L3_STEP_AT;
package Control
  block TCU_Main_Execution
    extends Modelica.Blocks.Interfaces.DiscreteBlock;

    function TCU_Main_AT_DCT
      output Real x1[12];
      output Real x2[11];
      output Real x3;
      output Real x4;
      output Real x5;
      output Real x6;
      output Real x7;
      output Real x8;
      output Real x9;
      output Real x10;
      output Real x11;
      output Real x12;
      output Real x13;
      input Real z1;
      input Real z2;
      input Real z3;
      input Real z4[:];
      input Real z5;
      input Real z6;
      input Real z7;
      input Real z8;
      input Real z9;
      input Real z10;
      input Real z11;
      input Real z12;
      input Real z13;
      input Real z14;
      input Real z15;
      input Real z16;

      external "C" TCU_Main_AT_DCT(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15, z16)
      annotation (
        Include = "#include <TCU_Main_AT_DCT.c>",
        IncludeDirectory = "modelica://TRAMI_L3_STEP_AT/Resources/library_etc");
    end TCU_Main_AT_DCT;

    //__Maplesoft_source = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources")+"\\TCU_Main_AT_DCT_ForMapleSim.c");
    Modelica.Blocks.Interfaces.RealOutput Sfunction_Out1[34] annotation (
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput SFunction_in1[26] annotation (
      Placement(visible = true, transformation(origin = {-112, 0}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-120, 50}, extent = {{-20, -20}, {5, 5}}, rotation = 0)));
    //output
    Real MO_tau_clutch_cap[12];
    Real MO_f_synchro_n[11];
    Real MO_p_line_pa;
    Real MO_i_actuator_ampere;
    Real MO_i_eop_ampere;
    Real MO_qv_cooler_trans_fluid_m3ps;
    Real MO_qv_cooler_eng_water_m3ps;
    Real MO_tau_engine_max_req;
    Real MO_tau_engine_min_req;
    Real MO_w_engine_target_radps;
    Real MO_tau_trans_input;
    Real MO_trans_gear_ratio;
    Real MO_flag_trans_lock_up;
    //Input
    Real MO_flag_initialize = SFunction_in1[1];
    Real MO_floatw_gearbox_input_radps = SFunction_in1[2];
    Real MO_floatw_gearbox_output_radps = SFunction_in1[3];
    Real MO_floatw_synchoro_dif_radps[11] = {SFunction_in1[4], SFunction_in1[5], SFunction_in1[6], SFunction_in1[7], SFunction_in1[8], SFunction_in1[9], SFunction_in1[10], SFunction_in1[11], SFunction_in1[12], SFunction_in1[13], SFunction_in1[14]};
    Real MO_floatt_trans_fluid_k = SFunction_in1[15];
    Real MO_floatt_engine_water_k = SFunction_in1[16];
    Real MO_floataccel_position_per = SFunction_in1[17];
    Real MO_sshortrans_shifter_position = SFunction_in1[18];
    Real MO_floatv_vehicle_mps = SFunction_in1[19];
    Real MO_floattau_brake = SFunction_in1[20];
    Real MO_floatw_engine_radps = SFunction_in1[21];
    Real MO_floatw_engine_idle_radps = SFunction_in1[22];
    Real MO_floattau_engine_target = SFunction_in1[23];
    Real MO_floattau_engine = SFunction_in1[24];
    Real MO_floattau_engine_min_pos = SFunction_in1[25];
    Real MO_floattau_engine_max_pos = SFunction_in1[26];
    Real y(start = 0, fixed = true);
  equation
    when {sampleTrigger, initial()} then
      (MO_tau_clutch_cap, MO_f_synchro_n, MO_p_line_pa, MO_i_actuator_ampere, MO_i_eop_ampere, MO_qv_cooler_trans_fluid_m3ps, MO_qv_cooler_eng_water_m3ps, MO_tau_engine_max_req, MO_tau_engine_min_req, MO_w_engine_target_radps, MO_tau_trans_input, MO_trans_gear_ratio, MO_flag_trans_lock_up) = TCU_Main_AT_DCT(MO_flag_initialize, MO_floatw_gearbox_input_radps, MO_floatw_gearbox_output_radps, MO_floatw_synchoro_dif_radps, MO_floatt_trans_fluid_k, MO_floatt_engine_water_k, MO_floataccel_position_per, MO_sshortrans_shifter_position, MO_floatv_vehicle_mps, MO_floattau_brake, MO_floatw_engine_radps, MO_floatw_engine_idle_radps, MO_floattau_engine_target, MO_floattau_engine, MO_floattau_engine_min_pos, MO_floattau_engine_max_pos);
      Sfunction_Out1[1] = MO_tau_clutch_cap[1];
      Sfunction_Out1[2] = MO_tau_clutch_cap[2];
      Sfunction_Out1[3] = MO_tau_clutch_cap[3];
      Sfunction_Out1[4] = MO_tau_clutch_cap[4];
      Sfunction_Out1[5] = MO_tau_clutch_cap[5];
      Sfunction_Out1[6] = MO_tau_clutch_cap[6];
      Sfunction_Out1[7] = MO_tau_clutch_cap[7];
      Sfunction_Out1[8] = MO_tau_clutch_cap[8];
      Sfunction_Out1[9] = MO_tau_clutch_cap[9];
      Sfunction_Out1[10] = MO_tau_clutch_cap[10];
      Sfunction_Out1[11] = MO_tau_clutch_cap[11];
      Sfunction_Out1[12] = MO_tau_clutch_cap[12];
      Sfunction_Out1[13] = MO_f_synchro_n[1];
      Sfunction_Out1[14] = MO_f_synchro_n[2];
      Sfunction_Out1[15] = MO_f_synchro_n[3];
      Sfunction_Out1[16] = MO_f_synchro_n[4];
      Sfunction_Out1[17] = MO_f_synchro_n[5];
      Sfunction_Out1[18] = MO_f_synchro_n[6];
      Sfunction_Out1[19] = MO_f_synchro_n[7];
      Sfunction_Out1[20] = MO_f_synchro_n[8];
      Sfunction_Out1[21] = MO_f_synchro_n[9];
      Sfunction_Out1[22] = MO_f_synchro_n[10];
      Sfunction_Out1[23] = MO_f_synchro_n[11];
      Sfunction_Out1[24] = MO_p_line_pa;
      Sfunction_Out1[25] = MO_i_actuator_ampere;
      Sfunction_Out1[26] = MO_i_eop_ampere;
      Sfunction_Out1[27] = MO_qv_cooler_trans_fluid_m3ps;
      Sfunction_Out1[28] = MO_qv_cooler_eng_water_m3ps;
      Sfunction_Out1[29] = MO_tau_engine_max_req;
      Sfunction_Out1[30] = MO_tau_engine_min_req;
      Sfunction_Out1[31] = MO_w_engine_target_radps;
      Sfunction_Out1[32] = MO_tau_trans_input;
      Sfunction_Out1[33] = MO_trans_gear_ratio;
      Sfunction_Out1[34] = MO_flag_trans_lock_up;
      y = pre(y) + 1;
    end when;
    annotation (
      Icon(graphics={  Polygon(lineColor = {0, 170, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, points = {{-60, 100}, {60, 100}, {100, 62}, {100, -60}, {60, -98}, {-60, -100}, {-100, -58}, {-100, 60}, {-100, 60}, {-60, 100}}), Text(origin = {34, -44}, extent = {{-98, 58}, {32, -8}}, textString = "Main"), Text(origin = {-4, 26}, extent = {{-82, 24}, {82, -24}}, textString = "TCU")}, coordinateSystem(initialScale = 0.1)));
  end TCU_Main_Execution;

  block Acceptance
    Modelica.Blocks.Interfaces.RealInput Acceptance_data[33] annotation (
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  equation

    annotation (
      Icon(graphics={  Polygon(origin = {-2, 1}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, points = {{-90, 67}, {-90, 87}, {90, 85}, {90, -87}, {-86, -83}, {-86, -55}, {58, -55}, {60, 61}, {-90, 67}, {-90, 67}, {-90, 67}}), Text(origin = {-19, 11}, extent = {{-53, 39}, {53, -39}}, textString = "A")}, coordinateSystem(initialScale = 0.1)));
  end Acceptance;

  model TCU_Main
    constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = 2:26, fileName = currDir + "/ModelicaInputData.txt", tableName = "tab1", tableOnFile = true) annotation (
      Placement(visible = true, transformation(origin = {-464, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Control.Acceptance acceptance1 annotation (
      Placement(visible = true, transformation(origin = {132, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Control.TCU_Main_Execution TCU_Main_Execution1(samplePeriod = 0.010, startTime = 0) annotation (
      Placement(visible = true, transformation(origin = {6, 8}, extent = {{-68, -68}, {68, 68}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex5 deMultiplex5(n1 = 2, n2 = 1, n3 = 14, n4 = 1, n5 = 7) annotation (
      Placement(visible = true, transformation(origin = {-381, 35}, extent = {{-39, -39}, {39, 39}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex5 multiplex5(n1 = 2, n2 = 1, n3 = 14, n4 = 1, n5 = 7) annotation (
      Placement(visible = true, transformation(origin = {-158, 36}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
    Modelica.Blocks.Math.MatrixGain matrixGain(K = [2 * 3.141592 / 2.05]) annotation (
      Placement(visible = true, transformation(origin = {-300, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.MatrixGain matrixGain1(K = [3.066]) annotation (
      Placement(visible = true, transformation(origin = {-270, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(matrixGain1.u, matrixGain.y) annotation (
      Line(points = {{-282, -102}, {-289, -102}}, color = {0, 0, 127}, thickness = 0.5));
    connect(matrixGain.u, deMultiplex5.y4) annotation (
      Line(points = {{-312, -102}, {-328, -102}, {-328, 20}, {-338, 20}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable.y, deMultiplex5.u) annotation (
      Line(points = {{-453, 34}, {-428, 34}, {-428, 35}}, color = {0, 0, 127}, thickness = 0.5));
    connect(multiplex5.u2, matrixGain1.y) annotation (
      Line(points = {{-194, 52}, {-258, 52}, {-258, -102}, {-258, -102}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex5.y4, multiplex5.u4) annotation (
      Line(points = {{-338, 20}, {-198, 20}, {-198, 22}, {-194, 22}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex5.y5, multiplex5.u5) annotation (
      Line(points = {{-338, 6}, {-194, 6}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex5.y3, multiplex5.u3) annotation (
      Line(points = {{-338, 37}, {-269, 37}, {-269, 36}, {-194, 36}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex5.y1, multiplex5.u1) annotation (
      Line(points = {{-338, 68}, {-266, 68}, {-266, 66}, {-194, 66}}, color = {0, 0, 127}, thickness = 0.5));
    connect(multiplex5.y, TCU_Main_Execution1.SFunction_in1) annotation (
      Line(points = {{-124, 36}, {-82, 36}, {-82, 36}, {-80, 36}}, color = {0, 0, 127}, thickness = 0.5));
    connect(TCU_Main_Execution1.Sfunction_Out1, acceptance1.Acceptance_data) annotation (
      Line(points = {{80, 8}, {120, 8}}, color = {0, 0, 127}, thickness = 0.5));
    annotation (
      experiment(StartTime = 0, StopTime = 88, Tolerance = 1e-06, Interval = 0.01),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end TCU_Main;

  model GearSelector
    extends Modelica.Blocks.Icons.Block;
    parameter Real Gear_ratio_1st = 5.353, Gear_ratio_2nd = 3.243, Gear_ratio_3rd = 2.252, Gear_ratio_4th = 1.636, Gear_ratio_5th = 1.211, Gear_ratio_6th = 1.000, Gear_ratio_7th = 0.865, Gear_ratio_8th = 0.717, Gear_ratio_9th = 0.601, Gear_ratio_N = 0, Gear_ratio_rev = -4.798;
    Modelica.Blocks.Interfaces.RealInput GearRatio annotation (
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput GearSelectSignal[11] annotation (
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    GearSelectSignal = if GearRatio > Gear_ratio_1st - 0.05 then {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0} elseif GearRatio > Gear_ratio_2nd - 0.05 then {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}
     elseif GearRatio > Gear_ratio_3rd - 0.05 then {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0}
     elseif GearRatio > Gear_ratio_4th - 0.05 then {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0}
     elseif GearRatio > Gear_ratio_5th - 0.05 then {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
     elseif GearRatio > Gear_ratio_6th - 0.05 then {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0}
     elseif GearRatio > Gear_ratio_7th - 0.05 then {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0}
     elseif GearRatio > Gear_ratio_8th - 0.05 then {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0}
     elseif GearRatio > Gear_ratio_9th - 0.05 then {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0}
     elseif GearRatio > Gear_ratio_N - 0.05 then {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1} else {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    // 1速
    // 2速
    // 3速
    // 4速
    // 5速
    // 6速
    // 7速
    // 8速
    // 9速
    // 10速
    // ニュートラル
    // Reverse
  end GearSelector;

  model MultiSignal_Output
    constant Real FirstOrderTime = 0.01;
    Modelica.Blocks.Interfaces.RealInput u[34] annotation (
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex5 deMultiplex51(n1 = 5, n2 = 5, n3 = 5, n4 = 5, n5 = 5) annotation (
      Placement(visible = true, transformation(origin = {-44, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex5 deMultiplex52 annotation (
      Placement(visible = true, transformation(origin = {-10, 138}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex5 deMultiplex53 annotation (
      Placement(visible = true, transformation(origin = {-10, 112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex5 deMultiplex54 annotation (
      Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex5 deMultiplex55 annotation (
      Placement(visible = true, transformation(origin = {-10, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex5 deMultiplex56 annotation (
      Placement(visible = true, transformation(origin = {-10, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput tau_clutch_cap[6] annotation (
      Placement(visible = true, transformation(origin = {110, 126}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex5 multiplex51 annotation (
      Placement(visible = true, transformation(origin = {40, 138}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex2 multiplex21(n1 = 5, n2 = 1) annotation (
      Placement(visible = true, transformation(origin = {76, 126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex2 deMultiplex21(n1 = 25, n2 = 9) annotation (
      Placement(visible = true, transformation(origin = {-76, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex2 deMultiplex22(n1 = 5, n2 = 4) annotation (
      Placement(visible = true, transformation(origin = {-44, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex5 deMultiplex57 annotation (
      Placement(visible = true, transformation(origin = {-10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput tau_engine_max_req annotation (
      Placement(visible = true, transformation(origin = {110, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder10(T = FirstOrderTime, y(fixed = true)) annotation (
      Placement(visible = true, transformation(origin = {14, 4}, extent = {{-2, -2}, {2, 2}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput p_line_Pa annotation (
      Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput qv_cooler_trans_fluid_m3ps annotation (
      Placement(visible = true, transformation(origin = {110, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput qv_cooler_eng_water_m3ps annotation (
      Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i_actuator_ampere annotation (
      Placement(visible = true, transformation(origin = {110, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i_eop_ampere annotation (
      Placement(visible = true, transformation(origin = {110, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = FirstOrderTime, y(fixed = true)) annotation (
      Placement(visible = true, transformation(origin = {20, 8}, extent = {{-2, -2}, {2, 2}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = FirstOrderTime, y(fixed = true)) annotation (
      Placement(visible = true, transformation(origin = {26, 12}, extent = {{-2, -2}, {2, 2}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput tau_lockup_cap annotation (
      Placement(visible = true, transformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput ratio_AT annotation (
      Placement(visible = true, transformation(origin = {110, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput flag_trans_lock_up annotation (
      Placement(visible = true, transformation(origin = {110, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.DeMultiplex4 deMultiplex41(n1 = 1, n2 = 1, n3 = 1, n4 = 1) annotation (
      Placement(visible = true, transformation(origin = {-10, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(multiplex21.y, tau_clutch_cap) annotation (
      Line(points = {{88, 126}, {104, 126}, {104, 126}, {110, 126}}, color = {0, 0, 127}, thickness = 0.5));
    connect(multiplex51.y, multiplex21.u1) annotation (
      Line(points = {{52, 138}, {56, 138}, {56, 132}, {64, 132}, {64, 132}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex52.y5, multiplex51.u5) annotation (
      Line(points = {{1, 130}, {26, 130}, {26, 128}, {28, 128}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex52.y4, multiplex51.u4) annotation (
      Line(points = {{1, 134}, {28, 134}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex52.y3, multiplex51.u3) annotation (
      Line(points = {{1, 138}, {28, 138}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex52.y2, multiplex51.u2) annotation (
      Line(points = {{1, 142}, {26, 142}, {26, 144}, {28, 144}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex52.y1, multiplex51.u1) annotation (
      Line(points = {{1, 146}, {26, 146}, {26, 148}, {28, 148}}, color = {0, 0, 127}, thickness = 0.5));
    connect(firstOrder10.y, tau_engine_max_req) annotation (
      Line(points = {{16, 4}, {49.1, 4}, {49.1, -116}, {110, -116}}, color = {0, 0, 127}));
    connect(firstOrder1.y, qv_cooler_eng_water_m3ps) annotation (
      Line(points = {{22, 8}, {56, 8}, {56, -80}, {110, -80}}, color = {0, 0, 127}));
    connect(firstOrder2.y, qv_cooler_trans_fluid_m3ps) annotation (
      Line(points = {{28, 12}, {64, 12}, {64, -44}, {110, -44}}, color = {0, 0, 127}));
    connect(deMultiplex51.y1, deMultiplex52.u) annotation (
      Line(points = {{-33, 94}, {-31, 94}, {-31, 138}, {-22, 138}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex22.y1, deMultiplex57.u) annotation (
      Line(points = {{-33, 2}, {-27, 2}, {-27, 8}, {-22, 8}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex21.y2, deMultiplex22.u) annotation (
      Line(points = {{-65, 44}, {-60, 44}, {-60, -4}, {-56, -4}}, color = {0, 0, 127}, thickness = 0.5));
    connect(u, deMultiplex21.u) annotation (
      Line(points = {{-120, 0}, {-94, 0}, {-94, 50}, {-88, 50}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex21.y1, deMultiplex51.u) annotation (
      Line(points = {{-65, 56}, {-59, 56}, {-59, 86}, {-57, 86}, {-57, 87}, {-56, 87}, {-56, 86}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex51.y5, deMultiplex56.u) annotation (
      Line(points = {{-33, 78}, {-31, 78}, {-31, 34}, {-22, 34}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex51.y3, deMultiplex55.u) annotation (
      Line(points = {{-33, 86}, {-22, 86}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex51.y4, deMultiplex54.u) annotation (
      Line(points = {{-33, 82}, {-27, 82}, {-27, 60}, {-21, 60}, {-21, 62}, {-23, 62}, {-23, 61}, {-22, 61}, {-22, 60}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex51.y2, deMultiplex53.u) annotation (
      Line(points = {{-33, 90}, {-29, 90}, {-29, 112}, {-22, 112}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex53.y1[1], multiplex21.u2[1]) annotation (
      Line(points = {{1, 120}, {64, 120}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex55.y2[1], tau_lockup_cap) annotation (
      Line(points = {{1, 90}, {110, 90}}, color = {0, 0, 127}));
    connect(deMultiplex22.y2, deMultiplex41.u) annotation (
      Line(points = {{-33, -10}, {-26, -10}, {-26, -18}, {-22, -18}}, color = {0, 0, 127}, thickness = 0.5));
    connect(deMultiplex41.y3[1], ratio_AT) annotation (
      Line(points = {{1, -21}, {40, -21}, {40, -150}, {110, -150}}, color = {0, 0, 127}));
    connect(deMultiplex41.y4[1], flag_trans_lock_up) annotation (
      Line(points = {{1, -27}, {30, -27}, {30, -190}, {110, -190}}, color = {0, 0, 127}));
    connect(deMultiplex57.y4[1], firstOrder10.u) annotation (
      Line(points = {{1, 4}, {12, 4}}, color = {0, 0, 127}));
    connect(deMultiplex57.y3[1], firstOrder1.u) annotation (
      Line(points = {{1, 8}, {18, 8}}, color = {0, 0, 127}));
    connect(deMultiplex57.y2[1], firstOrder2.u) annotation (
      Line(points = {{1, 12}, {24, 12}}, color = {0, 0, 127}));
    connect(deMultiplex57.y1[1], i_eop_ampere) annotation (
      Line(points = {{1, 16}, {72, 16}, {72, -6}, {110, -6}}, color = {0, 0, 127}));
    connect(deMultiplex56.y5[1], i_actuator_ampere) annotation (
      Line(points = {{1, 26}, {110, 26}}, color = {0, 0, 127}));
    connect(deMultiplex56.y4[1], p_line_Pa) annotation (
      Line(points = {{1, 30}, {80, 30}, {80, 60}, {110, 60}}, color = {0, 0, 127}));
    annotation (
      Diagram(coordinateSystem(extent = {{-100, -200}, {100, 160}})),
      __OpenModelica_commandLineOptions = "",
      Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 200}, {100, -200}}), Text(origin = {0, -230}, lineColor = {0, 0, 255}, extent = {{-150, 20}, {150, -20}}, textString = "%name"), Text(origin = {0, 40}, extent = {{-100, 30}, {100, -30}}, textString = "Mulitiple"), Text(origin = {20, -30}, extent = {{-100, 30}, {60, -30}}, textString = "Output")}, coordinateSystem(extent = {{-100, -200}, {100, 200}}, initialScale = 0.1)),
      version = "",
      uses(Modelica(version = "3.2.3")));
  end MultiSignal_Output;

  model MultiSignal_Input
    Modelica.Blocks.Interfaces.RealInput flag_initialize annotation (
      Placement(visible = true, transformation(origin = {-120, 204}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex5 multiplex51(n1 = 5, n2 = 5, n3 = 5, n4 = 5, n5 = 5) annotation (
      Placement(visible = true, transformation(origin = {40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex5 multiplex52 annotation (
      Placement(visible = true, transformation(origin = {0, 162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex5 multiplex53 annotation (
      Placement(visible = true, transformation(origin = {0, 136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex5 multiplex54 annotation (
      Placement(visible = true, transformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex5 multiplex55 annotation (
      Placement(visible = true, transformation(origin = {0, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex5 multiplex56 annotation (
      Placement(visible = true, transformation(origin = {0, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y[26] annotation (
      Placement(visible = true, transformation(origin = {110, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput v_vehicle_mps annotation (
      Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput w_engine_radps annotation (
      Placement(visible = true, transformation(origin = {-120, -84}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput tau_engine annotation (
      Placement(visible = true, transformation(origin = {-120, -168}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -220}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput tau_engine_target annotation (
      Placement(visible = true, transformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput accel_position_per annotation (
      Placement(visible = true, transformation(origin = {-120, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput tau_brake annotation (
      Placement(visible = true, transformation(origin = {-120, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput w_gearbox_input_radps annotation (
      Placement(visible = true, transformation(origin = {-120, 176}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 260}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput w_gearbox_output_radps annotation (
      Placement(visible = true, transformation(origin = {-120, 148}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 220}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput TinOil_K annotation (
      Placement(visible = true, transformation(origin = {-120, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput w_engine_idle_radps annotation (
      Placement(visible = true, transformation(origin = {-120, -112}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Math.Gain rpm2radps(k = 2 * Modelica.Constants.pi / 60) annotation (
      Placement(visible = true, transformation(origin = {-70, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput t_engine_water_k annotation (
      Placement(visible = true, transformation(origin = {-120, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput trans_shifter_position annotation (
      Placement(visible = true, transformation(origin = {-120, -4}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput tau_engine_min_pos annotation (
      Placement(visible = true, transformation(origin = {-120, -196}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -260}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput tau_engine_max_pos annotation (
      Placement(visible = true, transformation(origin = {-120, -224}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 200) annotation (
      Placement(visible = true, transformation(origin = {-50, 136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Routing.Multiplex2 multiplex2(n1 = 25, n2 = 1) annotation (
      Placement(visible = true, transformation(origin = {80, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(const.y, multiplex54.u3[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 110}, {-12, 110}}, color = {0, 0, 127}));
    connect(const.y, multiplex54.u2[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 116}, {-12, 116}, {-12, 115}}, color = {0, 0, 127}));
    connect(const.y, multiplex54.u1[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 120}, {-12, 120}}, color = {0, 0, 127}));
    connect(const.y, multiplex53.u5[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 126}, {-12, 126}}, color = {0, 0, 127}));
    connect(const.y, multiplex53.u4[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 130}, {-12, 130}, {-12, 131}}, color = {0, 0, 127}));
    connect(const.y, multiplex53.u3[1]) annotation (
      Line(points = {{-39, 136}, {-12, 136}}, color = {0, 0, 127}));
    connect(const.y, multiplex53.u2[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 142}, {-12, 142}, {-12, 141}}, color = {0, 0, 127}));
    connect(const.y, multiplex53.u1[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 146}, {-12, 146}}, color = {0, 0, 127}));
    connect(const.y, multiplex52.u5[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 152}, {-12, 152}}, color = {0, 0, 127}));
    connect(const.y, multiplex52.u4[1]) annotation (
      Line(points = {{-39, 136}, {-22, 136}, {-22, 158}, {-12, 158}, {-12, 157}}, color = {0, 0, 127}));
    connect(rpm2radps.u, w_engine_idle_radps) annotation (
      Line(points = {{-82, -112}, {-112, -112}, {-112, -112}, {-120, -112}}, color = {0, 0, 127}));
    connect(multiplex56.y, multiplex51.u5) annotation (
      Line(points = {{11, 58}, {16, 58}, {16, 100}, {28, 100}}, color = {0, 0, 127}));
    connect(multiplex55.y, multiplex51.u4) annotation (
      Line(points = {{11, 84}, {13.5, 84}, {13.5, 106}, {28, 106}, {28, 105}}, color = {0, 0, 127}));
    connect(multiplex54.y, multiplex51.u3) annotation (
      Line(points = {{11, 110}, {28, 110}}, color = {0, 0, 127}));
    connect(multiplex53.y, multiplex51.u2) annotation (
      Line(points = {{11, 136}, {14, 136}, {14, 114}, {28, 114}, {28, 115}}, color = {0, 0, 127}));
    connect(multiplex52.y, multiplex51.u1) annotation (
      Line(points = {{11, 162}, {16, 162}, {16, 120}, {28, 120}}, color = {0, 0, 127}));
    connect(multiplex54.u4[1], const.y) annotation (
      Line(points = {{-12, 105}, {-22, 105}, {-22, 136}, {-39, 136}}, color = {0, 0, 127}));
    connect(multiplex2.y, y) annotation (
      Line(points = {{92, 90}, {104, 90}, {104, 88}, {110, 88}}, color = {0, 0, 127}, thickness = 0.5));
    connect(tau_engine_max_pos, multiplex2.u2[1]) annotation (
      Line(points = {{-120, -224}, {60, -224}, {60, 84}, {68, 84}, {68, 84}}, color = {0, 0, 127}));
    connect(multiplex51.y, multiplex2.u1) annotation (
      Line(points = {{52, 110}, {60, 110}, {60, 96}, {68, 96}, {68, 96}}, color = {0, 0, 127}, thickness = 0.5));
    connect(w_gearbox_output_radps, multiplex52.u3[1]) annotation (
      Line(points = {{-120, 148}, {-70, 148}, {-70, 162}, {-12, 162}, {-12, 162}}, color = {0, 0, 127}));
    connect(w_gearbox_input_radps, multiplex52.u2[1]) annotation (
      Line(points = {{-120, 176}, {-70, 176}, {-70, 166}, {-12, 166}, {-12, 168}}, color = {0, 0, 127}));
    connect(flag_initialize, multiplex52.u1[1]) annotation (
      Line(points = {{-120, 204}, {-66, 204}, {-66, 172}, {-12, 172}, {-12, 172}}, color = {0, 0, 127}));
    connect(tau_engine_min_pos, multiplex56.u5[1]) annotation (
      Line(points = {{-120, -196}, {-18, -196}, {-18, 48}, {-12, 48}, {-12, 48}}, color = {0, 0, 127}));
    connect(tau_engine, multiplex56.u4[1]) annotation (
      Line(points = {{-120, -168}, {-22, -168}, {-22, 52}, {-12, 52}, {-12, 54}}, color = {0, 0, 127}));
    connect(tau_engine_target, multiplex56.u3[1]) annotation (
      Line(points = {{-120, -140}, {-26, -140}, {-26, 58}, {-12, 58}, {-12, 58}}, color = {0, 0, 127}));
    connect(rpm2radps.y, multiplex56.u2[1]) annotation (
      Line(points = {{-58, -112}, {-30, -112}, {-30, 62}, {-12, 62}, {-12, 64}}, color = {0, 0, 127}));
    connect(w_engine_radps, multiplex56.u1[1]) annotation (
      Line(points = {{-120, -84}, {-34, -84}, {-34, 66}, {-12, 66}, {-12, 68}}, color = {0, 0, 127}));
    connect(tau_brake, multiplex55.u5[1]) annotation (
      Line(points = {{-120, -56}, {-38, -56}, {-38, 74}, {-12, 74}, {-12, 74}}, color = {0, 0, 127}));
    connect(v_vehicle_mps, multiplex55.u4[1]) annotation (
      Line(points = {{-120, -30}, {-42, -30}, {-42, 78}, {-12, 78}, {-12, 80}}, color = {0, 0, 127}));
    connect(trans_shifter_position, multiplex55.u3[1]) annotation (
      Line(points = {{-120, -4}, {-46, -4}, {-46, 84}, {-12, 84}, {-12, 84}}, color = {0, 0, 127}));
    connect(accel_position_per, multiplex55.u2[1]) annotation (
      Line(points = {{-120, 24}, {-50, 24}, {-50, 88}, {-12, 88}, {-12, 90}}, color = {0, 0, 127}));
    connect(t_engine_water_k, multiplex55.u1[1]) annotation (
      Line(points = {{-120, 50}, {-54, 50}, {-54, 94}, {-12, 94}, {-12, 94}}, color = {0, 0, 127}));
    connect(TinOil_K, multiplex54.u5[1]) annotation (
      Line(points = {{-120, 84}, {-58, 84}, {-58, 100}, {-12, 100}, {-12, 100}}, color = {0, 0, 127}));
    annotation (
      Diagram(coordinateSystem(extent = {{-100, -300}, {100, 300}})),
      __OpenModelica_commandLineOptions = "",
      Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 300}, {100, -300}}), Text(origin = {-10, -340}, lineColor = {0, 0, 255}, extent = {{-150, 20}, {150, -20}}, textString = "%name"), Text(origin = {0, 40}, extent = {{-100, 30}, {100, -30}}, textString = "Multiple"), Text(origin = {20, -30}, extent = {{-100, 30}, {60, -30}}, textString = "Input")}, coordinateSystem(extent = {{-100, -300}, {100, 300}}, initialScale = 0.1)));
  end MultiSignal_Input;
end Control;
