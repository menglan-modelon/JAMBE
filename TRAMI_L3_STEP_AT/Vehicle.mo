within TRAMI_L3_STEP_AT;
package Vehicle
  model ENGINE
    constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
    parameter String Engile_Trq_Map = "ENGINE_TRQ_MAP.txt";
    parameter String Engine_Trq_Table = "ENGINE_TRQ_MAP";
    Modelica.Blocks.Tables.CombiTable2Ds ENGINE_TROQUE_MAP(fileName = currDir + "/Tables/" + Engile_Trq_Map, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = Engine_Trq_Table, tableOnFile = true, verboseRead = true) annotation (
      Placement(visible = true, transformation(origin = {-56, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput accel_position_per1 annotation (
      Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-94, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Math.Gain rpm(k = 60 / (2 * Modelica.Constants.pi)) annotation (
      Placement(visible = true, transformation(origin = {64, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    Modelica.Blocks.Nonlinear.Limiter limiter1( uMax = 6300, uMin = 0) annotation (
      Placement(visible = true, transformation(origin = {30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput w_ENG_PNT_radps annotation (
      Placement(visible = true, transformation(origin = {100, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput tau_engine_target annotation (
      Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter2( uMax = 1000, uMin = -1000) annotation (
      Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.001, initType = Modelica.Blocks.Types.Init.InitialState, k = 1, y_start = 0) annotation (
      Placement(visible = true, transformation(origin = {66, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(ENGINE_TROQUE_MAP.y, limiter2.u) annotation (
      Line(points = {{-44, 66}, {-20, 66}, {-20, -20}, {18, -20}, {18, -20}}, color = {0, 0, 127}));
    connect(firstOrder1.y, tau_engine_target) annotation (
      Line(points = {{78, -20}, {92, -20}, {92, -20}, {100, -20}}, color = {0, 0, 127}));
    connect(limiter2.y, firstOrder1.u) annotation (
      Line(points = {{42, -20}, {54, -20}, {54, -20}, {54, -20}}, color = {0, 0, 127}));
    connect(w_ENG_PNT_radps, rpm.u) annotation (
      Line(points = {{100, 20}, {76, 20}}, color = {0, 0, 127}));
    connect(limiter1.y, ENGINE_TROQUE_MAP.u1) annotation (
      Line(points = {{19, 20}, {0, 20}, {0, 92}, {-80, 92}, {-80, 72}, {-68, 72}}, color = {0, 0, 127}));
    connect(rpm.y, limiter1.u) annotation (
      Line(points = {{53, 20}, {42, 20}}, color = {0, 0, 127}));
    connect(accel_position_per1, ENGINE_TROQUE_MAP.u2) annotation (
      Line(points = {{-100, 60}, {-68, 60}, {-68, 60}, {-68, 60}}, color = {0, 0, 127}));
    annotation (
      Icon(graphics={  Rectangle(origin = {9, 2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-89, 98}, {71, -102}}), Rectangle(origin = {3, 48}, fillColor = {176, 176, 176}, fillPattern = FillPattern.Solid, extent = {{-43, 38}, {37, -46}}), Rectangle(origin = {2, 39}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-26, 35}, {24, -37}}), Rectangle(origin = {0, 34}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-24, 14}, {26, -14}}), Ellipse(origin = {1, 21}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Ellipse(origin = {-31, -37}, fillPattern = FillPattern.Solid, extent = {{-21, 23}, {55, -55}}, endAngle = 360), Rectangle(origin = {6, -57}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 45}, {18, -35}}), Ellipse(origin = {-19, -49}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117}, fillPattern = FillPattern.Solid, extent = {{-7, 7}, {15, -15}}, endAngle = 360), Polygon(origin = {17, -20}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117}, fillPattern = FillPattern.Solid, points = {{-11, 42}, {23, -30}, {3, -42}, {-21, 40}, {-13, 42}, {-11, 42}}), Polygon(origin = {2, -53}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117}, fillPattern = FillPattern.Solid, points = {{-16, 11}, {26, 11}, {24, -11}, {-16, -11}, {-16, 11}}), Ellipse(origin = {25, -49}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117}, fillPattern = FillPattern.Solid, extent = {{-7, 7}, {15, -15}}, endAngle = 360), Ellipse(origin = {-25, -43}, fillPattern = FillPattern.Solid, extent = {{5, -5}, {15, -15}}, endAngle = 360), Ellipse(origin = {19, -43}, fillPattern = FillPattern.Solid, extent = {{3, -3}, {15, -15}}, endAngle = 360), Ellipse(origin = {-7, 29}, fillPattern = FillPattern.Solid, extent = {{5, -5}, {11, -11}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
  end ENGINE;

  model EngineController
    parameter Real Target_Idle_Speed = 650;
    Modelica.Blocks.Sources.Constant targetIdleSpeed(k = Target_Idle_Speed) annotation (
      Placement(visible = true, transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation (
      Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput accel_position_per annotation (
      Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput accel_position_per1 annotation (
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Neng annotation (
      Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Math.Add add annotation (
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0) annotation (
      Placement(visible = true, transformation(origin = {-62, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain P_gain(k = 1) annotation (
      Placement(visible = true, transformation(origin = {14, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Max max annotation (
      Placement(visible = true, transformation(origin = {-20, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput w_engine_idle_radps annotation (
      Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product annotation (
      Placement(visible = true, transformation(origin = {46, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput flag_trans_lock_up annotation (
      Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  equation
    connect(product.y, add.u2) annotation (
      Line(points = {{58, -12}, {62, -12}, {62, -6}, {68, -6}, {68, -6}}, color = {0, 0, 127}));
    connect(P_gain.y, product.u1) annotation (
      Line(points = {{26, -6}, {34, -6}, {34, -6}, {34, -6}}, color = {0, 0, 127}));
    connect(flag_trans_lock_up, product.u2) annotation (
      Line(points = {{-120, -80}, {24, -80}, {24, -18}, {34, -18}, {34, -18}}, color = {0, 0, 127}));
    connect(max.y, P_gain.u) annotation (
      Line(points = {{-9, -6}, {1, -6}, {1, -6}, {1, -6}}, color = {0, 0, 127}));
    connect(feedback1.y, max.u1) annotation (
      Line(points = {{-42, 0}, {-32, 0}}, color = {0, 0, 127}));
    connect(const.y, max.u2) annotation (
      Line(points = {{-51, -60}, {-40, -60}, {-40, -12}, {-32, -12}}, color = {0, 0, 127}));
    connect(accel_position_per, add.u1) annotation (
      Line(points = {{-120, 80}, {56, 80}, {56, 6}, {68, 6}}, color = {0, 0, 127}));
    connect(Neng, feedback1.u2) annotation (
      Line(points = {{-120, -40}, {-52, -40}, {-52, -8}}, color = {0, 0, 127}));
    connect(targetIdleSpeed.y, w_engine_idle_radps) annotation (
      Line(points = {{-90, 0}, {-74, 0}, {-74, 70}, {110, 70}, {110, 70}}, color = {0, 0, 127}));
    connect(targetIdleSpeed.y, feedback1.u1) annotation (
      Line(points = {{-91, 0}, {-60, 0}}, color = {0, 0, 127}));
    connect(add.y, accel_position_per1) annotation (
      Line(points = {{91, 0}, {110, 0}}, color = {0, 0, 127}));
    annotation (
      Icon(graphics={  Text(origin = {-33, 37}, extent = {{-47, 19}, {121, -93}}, textString = "Idle Speed Controller"), Rectangle(extent = {{-100, 100}, {100, -100}})}));
  end EngineController;

  model VEHICLE
    parameter Real Mv = 1738;
    parameter Real Rt = 0.334;
    parameter Real Coef_A = 196.5;
    parameter Real Coef_C = 0.03014;
    Modelica.Blocks.Math.Gain gain1(k = 1 / 100) annotation (
      Placement(visible = true, transformation(origin = {-195, -131}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Atan atan1 annotation (
      Placement(visible = true, transformation(origin = {-179, -131}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant CAR_WEIGHT(k = Mv) annotation (
      Placement(visible = true, transformation(origin = {-154, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant ROAD_GRADIENT(k = 0) annotation (
      Placement(visible = true, transformation(origin = {-211, -131}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Gain TIRE_R2(k = Rt) annotation (
      Placement(visible = true, transformation(origin = {40, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain2(k = 3.6) annotation (
      Placement(visible = true, transformation(origin = {64, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain TIRE_R3(k = Rt) annotation (
      Placement(visible = true, transformation(origin = {40, 28}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain3(k = 1 / 9.8) annotation (
      Placement(visible = true, transformation(origin = {66, 28}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Cd(k = Coef_C) annotation (
      Placement(visible = true, transformation(origin = {-169, -79}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product7 annotation (
      Placement(visible = true, transformation(origin = {-132, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product product8 annotation (
      Placement(visible = true, transformation(origin = {-132, -120}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Sin sin1 annotation (
      Placement(visible = true, transformation(origin = {-153, -131}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v_vehicle_mps annotation (
      Placement(visible = true, transformation(origin = {118, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain8(k = -9.8) annotation (
      Placement(visible = true, transformation(origin = {-112, -120}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain7(k = -Rt) annotation (
      Placement(visible = true, transformation(origin = {-154, 6}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product product9 annotation (
      Placement(visible = true, transformation(origin = {-189, -67}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput out_vehicle_G_g annotation (
      Placement(visible = true, transformation(origin = {118, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation (
      Placement(visible = true, transformation(origin = {-56, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Mv * Rt ^ 2 + 3.05, phi(fixed = true, start = 0), w(start = 0)) annotation (
      Placement(visible = true, transformation(origin = {-6, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Damper damper1(d = 0, w_rel(fixed = true)) annotation (
      Placement(visible = true, transformation(origin = {76, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
      Placement(visible = true, transformation(origin = {116, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Torque LoadTorque annotation (
      Placement(visible = true, transformation(origin = {-34, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor WheelSpeedW annotation (
      Placement(visible = true, transformation(origin = {26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Mechanics.Rotational.Sensors.AccSensor accSensor1 annotation (
      Placement(visible = true, transformation(origin = {14, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Math.Add add1 annotation (
      Placement(visible = true, transformation(origin = {-85, -57}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2 annotation (
      Placement(visible = true, transformation(origin = {-17, -57}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput tau_brake annotation (
      Placement(visible = true, transformation(origin = {-200, 132}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-81, -9}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput trq_DS_PNT_out_Nm annotation (
      Placement(visible = true, transformation(origin = {-238, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-108, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput w_DS_PNT_out_radps annotation (
      Placement(visible = true, transformation(origin = {-238, 102}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain9(k = 1000 / 3600) annotation (
      Placement(visible = true, transformation(origin = {96, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = Coef_A) annotation (
      Placement(visible = true, transformation(origin = {-123, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation (
      Placement(visible = true, transformation(origin = {-172, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Math.Product product1 annotation (
      Placement(visible = true, transformation(origin = {-102, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1(use_a = false, use_w = true) annotation (
      Placement(visible = true, transformation(origin = {-188, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain4(k = -1) annotation (
      Placement(visible = true, transformation(origin = {-210, 82}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(table = [-1, -1; -0.1, -1; 0, 0; 0.1, 1; 1, 1]) annotation (
      Placement(visible = true, transformation(origin = {-150, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TRAMI_L3_STEP_AT.Vehicle.TRAMI_Brake tRAMI_Brake(Coeff = 1e2) annotation (
      Placement(visible = true, transformation(origin = {-140, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = 2000) annotation (
      Placement(visible = true, transformation(origin = {-160, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(combiTable1Ds1.y[1], product1.u1) annotation (
      Line(points = {{-138, 34}, {-126, 34}, {-126, 18}, {-114, 18}, {-114, 18}}, color = {0, 0, 127}, thickness = 0.5));
    connect(speedSensor1.w, combiTable1Ds1.u) annotation (
      Line(points = {{-172, 60}, {-172, 60}, {-172, 34}, {-162, 34}, {-162, 34}}, color = {0, 0, 127}));
    connect(torqueToAngleAdaptor1.flange, speedSensor1.flange) annotation (
      Line(points = {{-186, 100}, {-172, 100}, {-172, 80}, {-172, 80}}));
    connect(gain7.y, product1.u2) annotation (
      Line(points = {{-148, 6}, {-114, 6}, {-114, 6}, {-114, 6}}, color = {0, 0, 127}));
    connect(add2.y, gain7.u) annotation (
      Line(points = {{-9, -57}, {0, -57}, {0, -26}, {-176, -26}, {-176, 6}, {-161, 6}}, color = {0, 0, 127}));
    connect(gain4.y, torqueToAngleAdaptor1.tau) annotation (
      Line(points = {{-204, 82}, {-198, 82}, {-198, 92}, {-192, 92}, {-192, 92}}, color = {0, 0, 127}));
    connect(trq_DS_PNT_out_Nm, gain4.u) annotation (
      Line(points = {{-238, 82}, {-218, 82}, {-218, 82}, {-218, 82}}, color = {0, 0, 127}));
    connect(product1.y, LoadTorque.tau) annotation (
      Line(points = {{-90, 12}, {-48, 12}, {-48, 12}, {-46, 12}}, color = {0, 0, 127}));
    connect(w_DS_PNT_out_radps, torqueToAngleAdaptor1.w) annotation (
      Line(points = {{-238, 102}, {-208, 102}, {-208, 102}, {-192, 102}, {-192, 104}}, color = {0, 0, 127}));
    connect(LoadTorque.flange, inertia1.flange_a) annotation (
      Line(points = {{-24, 12}, {-16, 12}, {-16, 100}, {-16, 100}}));
    connect(Cd.y, product7.u2) annotation (
      Line(points = {{-163.5, -79}, {-139.5, -79}, {-139.5, -81}}, color = {0, 0, 127}));
    connect(add1.y, add2.u1) annotation (
      Line(points = {{-78, -56}, {-56, -56}, {-56, -52}, {-26, -52}, {-26, -52}, {-26, -52}}, color = {0, 0, 127}));
    connect(gain8.y, add2.u2) annotation (
      Line(points = {{-105.4, -120}, {-39.4, -120}, {-39.4, -62}, {-25, -62}, {-25, -61}}, color = {0, 0, 127}));
    connect(const.y, add1.u1) annotation (
      Line(points = {{-117.5, -53}, {-91.5, -53}}, color = {0, 0, 127}));
    connect(product7.y, add1.u2) annotation (
      Line(points = {{-125, -76}, {-113.4, -76}, {-113.4, -59}, {-103.2, -59}, {-103.2, -61}, {-93, -61}}, color = {0, 0, 127}));
    connect(product9.y, product7.u1) annotation (
      Line(points = {{-183.5, -67}, {-150, -67}, {-150, -68}, {-149, -68}, {-149, -74}, {-140, -74}}, color = {0, 0, 127}));
    connect(gain2.y, product9.u1) annotation (
      Line(points = {{70, 54}, {80, 54}, {80, -146}, {-238, -146}, {-238, -64}, {-195, -64}}, color = {0, 0, 127}));
    connect(gain2.y, product9.u2) annotation (
      Line(points = {{70, 54}, {80, 54}, {80, -146}, {-238, -146}, {-238, -70}, {-195, -70}}, color = {0, 0, 127}));
    connect(product8.y, gain8.u) annotation (
      Line(points = {{-125.4, -120}, {-120.4, -120}}, color = {0, 0, 127}));
    connect(sin1.y, product8.u2) annotation (
      Line(points = {{-147.5, -131}, {-146.375, -131}, {-146.375, -131}, {-145.25, -131}, {-145.25, -131}, {-143, -131}, {-143, -124}, {-141.5, -124}, {-141.5, -124}, {-140, -124}}, color = {0, 0, 127}));
    connect(atan1.y, sin1.u) annotation (
      Line(points = {{-173.5, -131}, {-159.5, -131}}, color = {0, 0, 127}));
    connect(CAR_WEIGHT.y, product8.u1) annotation (
      Line(points = {{-147.4, -110}, {-143.4, -110}, {-143.4, -116}, {-139.4, -116}, {-139.4, -116}, {-139.4, -116}, {-139.4, -116}}, color = {0, 0, 127}));
    connect(ROAD_GRADIENT.y, gain1.u) annotation (
      Line(points = {{-205.5, -131}, {-201.5, -131}}, color = {0, 0, 127}));
    connect(gain1.y, atan1.u) annotation (
      Line(points = {{-189.5, -131}, {-185.5, -131}}, color = {0, 0, 127}));
    connect(torqueSensor1.flange_b, inertia1.flange_a) annotation (
      Line(points = {{-46, 100}, {-16, 100}}));
    connect(accSensor1.a, TIRE_R3.u) annotation (
      Line(points = {{14, 38}, {14, 38}, {14, 28}, {32, 28}, {32, 28}}, color = {0, 0, 127}));
    connect(gain9.y, v_vehicle_mps) annotation (
      Line(points = {{102, 54}, {112, 54}, {112, 54}, {118, 54}}, color = {0, 0, 127}));
    connect(gain9.u, gain2.y) annotation (
      Line(points = {{88, 54}, {70, 54}, {70, 54}, {70, 54}}, color = {0, 0, 127}));
    connect(inertia1.flange_b, accSensor1.flange) annotation (
      Line(points = {{4, 100}, {14, 100}, {14, 58}, {14, 58}}));
    connect(gain3.y, out_vehicle_G_g) annotation (
      Line(points = {{73, 28}, {116, 28}}, color = {0, 0, 127}));
    connect(TIRE_R2.u, WheelSpeedW.w) annotation (
      Line(points = {{33, 54}, {26, 54}, {26, 69}}, color = {0, 0, 127}));
    connect(inertia1.flange_b, WheelSpeedW.flange) annotation (
      Line(points = {{4, 100}, {26, 100}, {26, 90}}));
    connect(TIRE_R3.y, gain3.u) annotation (
      Line(points = {{47, 28}, {59, 28}}, color = {0, 0, 127}));
    connect(TIRE_R2.y, gain2.u) annotation (
      Line(points = {{47, 54}, {57, 54}}, color = {0, 0, 127}));
    connect(inertia1.flange_b, damper1.flange_a) annotation (
      Line(points = {{4, 100}, {66, 100}}));
    connect(damper1.flange_b, fixed1.flange) annotation (
      Line(points = {{86, 100}, {116, 100}, {116, 100}, {116, 100}}));
    connect(torqueToAngleAdaptor1.flange, tRAMI_Brake.flange_a) annotation (
      Line(points = {{-186, 100}, {-150, 100}, {-150, 100}, {-150, 100}}));
    connect(tRAMI_Brake.flange_b, torqueSensor1.flange_a) annotation (
      Line(points = {{-130, 100}, {-68, 100}, {-68, 100}, {-66, 100}}));
    connect(tau_brake, gain.u) annotation (
      Line(points = {{-200, 132}, {-172, 132}, {-172, 132}, {-172, 132}}, color = {0, 0, 127}));
    connect(gain.y, tRAMI_Brake.tau_cap) annotation (
      Line(points = {{-148, 132}, {-140, 132}, {-140, 112}, {-140, 112}}, color = {0, 0, 127}));
    annotation (
      Icon(graphics={  Polygon(origin = {3, 42}, fillColor = {0, 170, 255}, fillPattern = FillPattern.Solid, points = {{-43, 30}, {7, 30}, {37, -2}, {77, -2}, {77, -36}, {-83, -36}, {-83, -2}, {-63, -2}, {-43, 30}}), Polygon(origin = {11, 54}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-31, 14}, {-5, 14}, {21, -14}, {-31, -14}, {-31, 14}}), Polygon(origin = {-39, 54}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{1, 14}, {-15, -14}, {15, -14}, {15, 14}, {1, 14}}), Ellipse(origin = {-45, 7}, fillPattern = FillPattern.Solid, extent = {{-15, 15}, {15, -15}}, endAngle = 360), Ellipse(origin = {47, 7}, fillPattern = FillPattern.Solid, extent = {{-15, 15}, {15, -15}}, endAngle = 360)}, coordinateSystem(extent = {{-250, -150}, {200, 150}}, initialScale = 0.1)),
      Diagram(coordinateSystem(extent = {{-250, -150}, {200, 150}}, initialScale = 0.1)));
  end VEHICLE;

  model Driver
    parameter Real Jfw = 0.29;
    parameter Real Mv = 1738;
    parameter Real Rt = 0.334;
    parameter Real Final_GearRatio = 3.066;
    parameter Real Coef_A = 196.5;
    parameter Real Coef_C = 0.03014;
    parameter String Accelerator_FileName;
    parameter String Accelerator_tabName;
    constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
    Modelica.Blocks.Interfaces.RealInput Target_Speed annotation (
      Placement(visible = true, transformation(origin = {-220, 180}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput accel_position_per annotation (
      Placement(visible = true, transformation(origin = {210, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput v_vehicle_mps annotation (
      Placement(visible = true, transformation(origin = {-220, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput tau_brake annotation (
      Placement(visible = true, transformation(origin = {210, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain kph2mps(k = 1000 / 3600) annotation (
      Placement(visible = true, transformation(origin = {-180, 180}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Continuous.Der der1 annotation (
      Placement(visible = true, transformation(origin = {-154, 180}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = Mv) annotation (
      Placement(visible = true, transformation(origin = {-154, 162}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation (
      Placement(visible = true, transformation(origin = {-132, 170}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product product2 annotation (
      Placement(visible = true, transformation(origin = {-180, 138}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = Coef_C) annotation (
      Placement(visible = true, transformation(origin = {-154, 128}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product product3 annotation (
      Placement(visible = true, transformation(origin = {-134, 134}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const2(k = Coef_A) annotation (
      Placement(visible = true, transformation(origin = {-154, 96}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant TireRadius(k = Rt) annotation (
      Placement(visible = true, transformation(origin = {-104, 110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Add3 add31 annotation (
      Placement(visible = true, transformation(origin = {-104, 134}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product tire_torque annotation (
      Placement(visible = true, transformation(origin = {-78, 130}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Ratio_AT annotation (
      Placement(visible = true, transformation(origin = {-220, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput w_ENG_PNT_radps annotation (
      Placement(visible = true, transformation(origin = {-220, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Math.Gain radps2rpm(k = 60 / (2 * Modelica.Constants.pi)) annotation (
      Placement(visible = true, transformation(origin = {-180, -120}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Tables.CombiTable2Ds torque2acc_per(fileName = currDir + "/Tables/" + Accelerator_FileName, tableName = Accelerator_tabName, tableOnFile = true) annotation (
      Placement(visible = true, transformation(origin = {82, 44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, initType = Modelica.Blocks.Types.Init.InitialState, k = 1, y_start = 0) annotation (
      Placement(visible = true, transformation(origin = {160, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Division EngineOutputTorque annotation (
      Placement(visible = true, transformation(origin = {-8, 122}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation (
      Placement(visible = true, transformation(origin = {-134, -48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Continuous.PID PID(Nd = 10, Td = 0.05, Ti = 10, initType = Modelica.Blocks.Types.Init.InitialState, k = 50, y_start = 0) annotation (
      Placement(visible = true, transformation(origin = {10, -48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation (
      Placement(visible = true, transformation(origin = {140, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Logical.Switch switch1 annotation (
      Placement(visible = true, transformation(origin = {72, -92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold = 10) annotation (
      Placement(visible = true, transformation(origin = {50, -92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const4(k = 0) annotation (
      Placement(visible = true, transformation(origin = {50, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(table = [-1, 0; 0, 0; 0.1, 1; 1, 1]) annotation (
      Placement(visible = true, transformation(origin = {-154, 78}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product product5 annotation (
      Placement(visible = true, transformation(origin = {-134, 92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterThreshold greaterThreshold2(threshold = 0.1) annotation (
      Placement(visible = true, transformation(origin = {96, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Logical.Switch switch11 annotation (
      Placement(visible = true, transformation(origin = {118, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const5(k = 2000) annotation (
      Placement(visible = true, transformation(origin = {96, -130}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain2(k = 1 / 2000) annotation (
      Placement(visible = true, transformation(origin = {140, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1( uMax = 1, uMin = 0) annotation (
      Placement(visible = true, transformation(origin = {160, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs1 annotation (
      Placement(visible = true, transformation(origin = {-98, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Logical.Switch switch12 annotation (
      Placement(visible = true, transformation(origin = {-56, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Logical.LessThreshold lessThreshold1(threshold = 1e-3) annotation (
      Placement(visible = true, transformation(origin = {-78, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const6(k = 1e-3) annotation (
      Placement(visible = true, transformation(origin = {-78, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.001, initType = Modelica.Blocks.Types.Init.InitialState, k = 1, y_start = 0) annotation (
      Placement(visible = true, transformation(origin = {180, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant DiffRatio(k = Final_GearRatio) annotation (
      Placement(visible = true, transformation(origin = {-78, 110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Division GearBoxOutputTorque annotation (
      Placement(visible = true, transformation(origin = {-54, 126}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const8(k = Jfw) annotation (
      Placement(visible = true, transformation(origin = {-34, 34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Add torque_Total annotation (
      Placement(visible = true, transformation(origin = {14, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Division tire_radps2 annotation (
      Placement(visible = true, transformation(origin = {-78, 52}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product torque_FlyWheel annotation (
      Placement(visible = true, transformation(origin = {-10, 48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain3(k = -2000) annotation (
      Placement(visible = true, transformation(origin = {94, -92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter2( uMax = 100, uMin = 0) annotation (
      Placement(visible = true, transformation(origin = {182, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product GearBoxOutput_radps2 annotation (
      Placement(visible = true, transformation(origin = {-54, 56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Product EngineOutput_radps2 annotation (
      Placement(visible = true, transformation(origin = {-34, 52}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D1(filename = "Loss_Compensation.txt", z_ax = {-4.798, 0, 0.601, 0.717, 0.865, 1.000, 1.211, 1.636, 2.252, 3.243, 5.354}) annotation (
      Placement(visible = true, transformation(origin = {38, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2 annotation (
      Placement(visible = true, transformation(origin = {60, 48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  equation
    connect(torque2acc_per.y, greaterThreshold1.u) annotation (
      Line(points = {{89, 44}, {92, 44}, {92, -64}, {38, -64}, {38, -92}, {43, -92}}, color = {0, 0, 127}));
    connect(radps2rpm.y, torque2acc_per.u2) annotation (
      Line(points = {{-174, -120}, {-150, -120}, {-150, 12}, {14, 12}, {14, 40}, {74, 40}}, color = {0, 0, 127}));
    connect(PID.y, switch1.u3) annotation (
      Line(points = {{16, -48}, {30, -48}, {30, -102}, {60, -102}, {60, -96}, {64, -96}, {64, -96}}, color = {0, 0, 127}));
    connect(PID.y, add1.u2) annotation (
      Line(points = {{17, -48}, {129, -48}, {129, 36}, {133, 36}}, color = {0, 0, 127}));
    connect(feedback1.y, PID.u) annotation (
      Line(points = {{-129, -48}, {3, -48}}, color = {0, 0, 127}));
    connect(der1.y, tire_radps2.u1) annotation (
      Line(points = {{-148, 180}, {-116, 180}, {-116, 56}, {-86, 56}, {-86, 56}}, color = {0, 0, 127}));
    connect(TireRadius.y, tire_radps2.u2) annotation (
      Line(points = {{-98, 110}, {-92, 110}, {-92, 48}, {-86, 48}, {-86, 48}}, color = {0, 0, 127}));
    connect(gain3.y, switch11.u1) annotation (
      Line(points = {{101, -92}, {104, -92}, {104, -106}, {110, -106}}, color = {0, 0, 127}));
    connect(switch1.y, gain3.u) annotation (
      Line(points = {{78.6, -92}, {86.6, -92}}, color = {0, 0, 127}));
    connect(const4.y, switch1.u1) annotation (
      Line(points = {{56.6, -76}, {58.6, -76}, {58.6, -76}, {60.6, -76}, {60.6, -87}, {63.1, -87}, {63.1, -87}, {65.6, -87}}, color = {0, 0, 127}));
    connect(greaterThreshold1.y, switch1.u2) annotation (
      Line(points = {{56.6, -92}, {65.6, -92}}, color = {255, 0, 255}));
    connect(radps2rpm.y, combiTable3D1.u1) annotation (
      Line(points = {{-174, -120}, {-150, -120}, {-150, 12}, {31, 12}}, color = {0, 0, 127}));
    connect(Ratio_AT, combiTable3D1.u2) annotation (
      Line(points = {{-220, -20}, {-142, -20}, {-142, 7}, {31, 7}}, color = {0, 0, 127}));
    connect(torque_Total.y, combiTable3D1.u) annotation (
      Line(points = {{21, 86}, {24.6, 86}, {24.6, 18}, {31, 18}, {31, 17}}, color = {0, 0, 127}));
    connect(combiTable3D1.y, add2.u2) annotation (
      Line(points = {{45, 12}, {48, 12}, {48, 44}, {53, 44}}, color = {0, 0, 127}));
    connect(torque_Total.y, add2.u1) annotation (
      Line(points = {{21, 86}, {48, 86}, {48, 52}, {53, 52}}, color = {0, 0, 127}));
    connect(add2.y, torque2acc_per.u1) annotation (
      Line(points = {{66.6, 48}, {73.6, 48}}, color = {0, 0, 127}));
    connect(torque2acc_per.y, add1.u1) annotation (
      Line(points = {{89, 44}, {133, 44}}, color = {0, 0, 127}));
    connect(const5.y, switch11.u3) annotation (
      Line(points = {{102, -130}, {106, -130}, {106, -114}, {110, -114}, {110, -114}}, color = {0, 0, 127}));
    connect(switch11.y, gain2.u) annotation (
      Line(points = {{124.6, -110}, {132.6, -110}, {132.6, -110}, {132.6, -110}}, color = {0, 0, 127}));
    connect(gain2.y, limiter1.u) annotation (
      Line(points = {{147, -110}, {153, -110}}, color = {0, 0, 127}));
    connect(greaterThreshold2.y, switch11.u2) annotation (
      Line(points = {{102.6, -110}, {105.6, -110}, {105.6, -110}, {108.6, -110}, {108.6, -110}, {109.6, -110}, {109.6, -110}, {110.6, -110}}, color = {255, 0, 255}));
    connect(kph2mps.y, greaterThreshold2.u) annotation (
      Line(points = {{-174, 180}, {-166, 180}, {-166, -110}, {89, -110}}, color = {0, 0, 127}));
    connect(limiter1.y, firstOrder2.u) annotation (
      Line(points = {{167, -110}, {173, -110}}, color = {0, 0, 127}));
    connect(add1.y, firstOrder1.u) annotation (
      Line(points = {{147, 40}, {153, 40}}, color = {0, 0, 127}));
    connect(firstOrder1.y, limiter2.u) annotation (
      Line(points = {{167, 40}, {174.6, 40}}, color = {0, 0, 127}));
    connect(limiter2.y, accel_position_per) annotation (
      Line(points = {{189, 40}, {210, 40}}, color = {0, 0, 127}));
    connect(firstOrder2.y, tau_brake) annotation (
      Line(points = {{187, -110}, {210, -110}}, color = {0, 0, 127}));
    connect(torque_FlyWheel.y, torque_Total.u2) annotation (
      Line(points = {{-4, 48}, {2, 48}, {2, 82}, {6, 82}, {6, 82}}, color = {0, 0, 127}));
    connect(EngineOutputTorque.y, torque_Total.u1) annotation (
      Line(points = {{-2, 122}, {2, 122}, {2, 90}, {6, 90}, {6, 90}}, color = {0, 0, 127}));
    connect(Ratio_AT, switch12.u3) annotation (
      Line(points = {{-220, -20}, {-131, -20}, {-131, -32}, {-68, -32}, {-68, -25}, {-63, -25}}, color = {0, 0, 127}));
    connect(EngineOutput_radps2.y, torque_FlyWheel.u1) annotation (
      Line(points = {{-28, 52}, {-17, 52}}, color = {0, 0, 127}));
    connect(const8.y, torque_FlyWheel.u2) annotation (
      Line(points = {{-28, 34}, {-20, 34}, {-20, 44}, {-17, 44}}, color = {0, 0, 127}));
    connect(switch12.y, EngineOutputTorque.u2) annotation (
      Line(points = {{-50, -20}, {-24, -20}, {-24, 118}, {-16, 118}}, color = {0, 0, 127}));
    connect(GearBoxOutput_radps2.y, EngineOutput_radps2.u1) annotation (
      Line(points = {{-47, 56}, {-41, 56}}, color = {0, 0, 127}));
    connect(DiffRatio.y, GearBoxOutput_radps2.u1) annotation (
      Line(points = {{-71, 110}, {-66, 110}, {-66, 60}, {-61, 60}}, color = {0, 0, 127}));
    connect(tire_radps2.y, GearBoxOutput_radps2.u2) annotation (
      Line(points = {{-72, 52}, {-61, 52}}, color = {0, 0, 127}));
    connect(DiffRatio.y, GearBoxOutputTorque.u2) annotation (
      Line(points = {{-71, 110}, {-66, 110}, {-66, 122}, {-61, 122}}, color = {0, 0, 127}));
    connect(tire_torque.y, GearBoxOutputTorque.u1) annotation (
      Line(points = {{-71, 130}, {-61, 130}}, color = {0, 0, 127}));
    connect(GearBoxOutputTorque.y, EngineOutputTorque.u1) annotation (
      Line(points = {{-47, 126}, {-15, 126}}, color = {0, 0, 127}));
    connect(Ratio_AT, EngineOutput_radps2.u2) annotation (
      Line(points = {{-220, -20}, {-112, -20}, {-112, 40}, {-45.5, 40}, {-45.5, 48}, {-41, 48}}, color = {0, 0, 127}));
    connect(const6.y, switch12.u1) annotation (
      Line(points = {{-71.4, -4}, {-67.8, -4}, {-67.8, -15}, {-62.8, -15}}, color = {0, 0, 127}));
    connect(abs1.y, lessThreshold1.u) annotation (
      Line(points = {{-91.4, -20}, {-85.4, -20}, {-85.4, -22}, {-85.4, -22}, {-85.4, -20}, {-85.4, -20}}, color = {0, 0, 127}));
    connect(lessThreshold1.y, switch12.u2) annotation (
      Line(points = {{-71.4, -20}, {-62.4, -20}}, color = {255, 0, 255}));
    connect(Ratio_AT, abs1.u) annotation (
      Line(points = {{-220, -20}, {-105, -20}}, color = {0, 0, 127}));
    connect(TireRadius.y, tire_torque.u2) annotation (
      Line(points = {{-98, 110}, {-92, 110}, {-92, 126}, {-86, 126}, {-86, 126}}, color = {0, 0, 127}));
    connect(add31.y, tire_torque.u1) annotation (
      Line(points = {{-97, 134}, {-85, 134}}, color = {0, 0, 127}));
    connect(product1.y, add31.u1) annotation (
      Line(points = {{-126, 170}, {-120, 170}, {-120, 138}, {-111, 138}, {-111, 139}}, color = {0, 0, 127}));
    connect(product5.y, add31.u3) annotation (
      Line(points = {{-128, 92}, {-120, 92}, {-120, 130}, {-112, 130}, {-112, 130}}, color = {0, 0, 127}));
    connect(product3.y, add31.u2) annotation (
      Line(points = {{-127.4, 134}, {-111, 134}}, color = {0, 0, 127}));
    connect(const1.y, product3.u2) annotation (
      Line(points = {{-147.4, 128}, {-146.9, 128}, {-146.9, 128}, {-146.4, 128}, {-146.4, 128}, {-145.4, 128}, {-145.4, 130}, {-143.4, 130}, {-143.4, 130}, {-141.4, 130}, {-141.4, 130}}, color = {0, 0, 127}));
    connect(product2.y, product3.u1) annotation (
      Line(points = {{-173.4, 138}, {-141.4, 138}}, color = {0, 0, 127}));
    connect(Target_Speed, product2.u1) annotation (
      Line(points = {{-220, 180}, {-192, 180}, {-192, 142}, {-187, 142}}, color = {0, 0, 127}));
    connect(Target_Speed, product2.u2) annotation (
      Line(points = {{-220, 180}, {-192, 180}, {-192, 134}, {-187, 134}}, color = {0, 0, 127}));
    connect(kph2mps.y, feedback1.u1) annotation (
      Line(points = {{-174, 180}, {-166, 180}, {-166, -48}, {-138, -48}, {-138, -48}}, color = {0, 0, 127}));
    connect(kph2mps.y, combiTable1Ds1.u) annotation (
      Line(points = {{-174, 180}, {-166, 180}, {-166, 78}, {-162, 78}, {-162, 78}}, color = {0, 0, 127}));
    connect(kph2mps.y, der1.u) annotation (
      Line(points = {{-174, 180}, {-162, 180}, {-162, 180}, {-162, 180}}, color = {0, 0, 127}));
    connect(combiTable1Ds1.y[1], product5.u2) annotation (
      Line(points = {{-147.4, 78}, {-146.4, 78}, {-146.4, 78}, {-145.4, 78}, {-145.4, 88}, {-143.4, 88}, {-143.4, 88}, {-141.4, 88}, {-141.4, 88}, {-141.4, 88}, {-141.4, 88}}, color = {0, 0, 127}, thickness = 0.5));
    connect(const2.y, product5.u1) annotation (
      Line(points = {{-147.4, 96}, {-141.4, 96}}, color = {0, 0, 127}));
    connect(der1.y, product1.u1) annotation (
      Line(points = {{-147.4, 180}, {-145.6, 180}, {-145.6, 180}, {-143.8, 180}, {-143.8, 174}, {-139.4, 174}}, color = {0, 0, 127}));
    connect(const.y, product1.u2) annotation (
      Line(points = {{-147.4, 162}, {-145.6, 162}, {-145.6, 162}, {-143.8, 162}, {-143.8, 166}, {-139.4, 166}}, color = {0, 0, 127}));
    connect(Target_Speed, kph2mps.u) annotation (
      Line(points = {{-220, 180}, {-187, 180}}, color = {0, 0, 127}));
    connect(v_vehicle_mps, feedback1.u2) annotation (
      Line(points = {{-220, -60}, {-134, -60}, {-134, -53}}, color = {0, 0, 127}));
    connect(w_ENG_PNT_radps, radps2rpm.u) annotation (
      Line(points = {{-220, -120}, {-187, -120}}, color = {0, 0, 127}));
    annotation (
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}), graphics={  Text(origin = {-146, 153}, extent = {{-14, 1}, {20, -5}}, textString = "Inertia"), Text(origin = {-142, 113}, extent = {{-20, 5}, {20, -5}}, textString = "Air Resistance"), Text(origin = {-142, 67}, extent = {{-20, 5}, {24, -7}}, textString = "Rolling Resistance"), Text(origin = {-48, 25}, extent = {{-10, -1}, {24, -7}}, textString = "FW Inertia"), Text(origin = {34, 5}, extent = {{-10, -1}, {24, -7}}, textString = "TM_LossTorque")}),
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.1),Icon(graphics = {Rectangle(origin={0,-2},extent={{-100,143},{100,-143}},fillColor={65,117,5})}));
  end Driver;

  model Flywheel
    parameter Modelica.Units.SI.Inertia Jfw = 0.4;
    /*initType = Modelica.Blocks.Types.Init.SteadyState,*/
    Modelica.Mechanics.Rotational.Components.Inertia inertia_FlyWheel(J = Jfw, phi(fixed = true, start = 0), w(fixed = true, start = 0)) annotation (
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1 annotation (
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor2(use_a = false, use_w = true) annotation (
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput trq_ENG_PNT_in_Nm annotation (
      Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput w_ENG_PNT_radps annotation (
      Placement(visible = true, transformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_FW_radps annotation (
      Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_FW_Nm annotation (
      Placement(visible = true, transformation(origin = {120, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
      Placement(visible = true, transformation(origin = {-80, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain2(k = -1) annotation (
      Placement(visible = true, transformation(origin = {80, -8}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  equation
    connect(gain2.u, trq_TM_PNT_FW_Nm) annotation (
      Line(points = {{88, -8}, {94, -8}, {94, -40}, {120, -40}, {120, -40}}, color = {0, 0, 127}));
    connect(torqueToAngleAdaptor2.tau, gain2.y) annotation (
      Line(points = {{64, -8}, {74, -8}, {74, -8}, {74, -8}}, color = {0, 0, 127}));
    connect(gain1.y, torqueToAngleAdaptor1.tau) annotation (
      Line(points = {{-74, -8}, {-64, -8}, {-64, -8}, {-64, -8}}, color = {0, 0, 127}));
    connect(trq_ENG_PNT_in_Nm, gain1.u) annotation (
      Line(points = {{-120, -40}, {-94, -40}, {-94, -8}, {-88, -8}, {-88, -8}}, color = {0, 0, 127}));
    connect(inertia_FlyWheel.flange_b, torqueToAngleAdaptor2.flange) annotation (
      Line(points = {{10, 0}, {56, 0}}));
    connect(w_TM_PNT_FW_radps, torqueToAngleAdaptor2.w) annotation (
      Line(points = {{110, 40}, {80, 40}, {80, 2}, {61, 2}, {61, 3}}, color = {0, 0, 127}));
    connect(inertia_FlyWheel.flange_a, torqueToAngleAdaptor1.flange) annotation (
      Line(points = {{-10, 0}, {-60, 0}}));
    connect(w_ENG_PNT_radps, torqueToAngleAdaptor1.w) annotation (
      Line(points = {{-110, 40}, {-80, 40}, {-80, 2}, {-65, 2}, {-65, 3}}, color = {0, 0, 127}));
    annotation (
      Icon(coordinateSystem(initialScale = 0.1), graphics={  Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(rotation = 90, points = {{0, 50}, {0, -50}}), Rectangle(origin = {2, -1}, fillColor = {163, 163, 163}, fillPattern = FillPattern.Solid, extent = {{-22, 65}, {18, -65}}), Text(origin = {-122, 6}, extent = {{-18, 2}, {22, -28}}, textString = "T"), Text(origin = {-122, 76}, extent = {{-18, 2}, {22, -28}}, textString = "w"), Text(origin = {118, 76}, extent = {{-18, 2}, {22, -28}}, textString = "w"), Text(origin = {118, 6}, extent = {{-18, 2}, {22, -28}}, textString = "T")}));
  end Flywheel;

  model TRAMI_Brake
    import Modelica.Units.SI;
    extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
    SI.Torque tau "Brake friction torque";
    SI.Angle phi_rel "Relative angle between frictional surfaces";
    SI.AngularVelocity w_rel "Relative angular velocity between frictional surfaces";
    //  SI.AngularAcceleration a_rel "Relative angular acceleration between frictional surfaces";
    Modelica.Blocks.Interfaces.RealInput tau_cap annotation (
      Placement(transformation(origin = {0, 110}, extent = {{20, -20}, {-20, 20}}, rotation = 90)));
    parameter Real Coeff = 1e5;
  equation
    phi_rel = flange_a.phi - phi_support;
    flange_b.phi = flange_a.phi;
    // Angular velocity and angular acceleration of flanges flange_a and flange_b
    w_rel = der(phi_rel);
    //  a_rel = der(w_rel);
    // Friction torque, normal force and friction torque for w_rel=0
    flange_a.tau + flange_b.tau - tau = 0;
    // Friction torque
    tau = abs(tau_cap) * smooth(0, min(1, max(-1, w_rel * Coeff)));
    annotation (
      Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
  end TRAMI_Brake;
end Vehicle;
