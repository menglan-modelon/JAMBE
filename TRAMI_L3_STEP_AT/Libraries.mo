within TRAMI_L3_STEP_AT;
package Libraries
  package Utilities
    block Subtruct
      extends Modelica.Blocks.Interfaces.SI2SO;
    equation
      y = u1 - u2;
      annotation (
        Icon(graphics={  Line(points = {{-100, 60}, {-74, 24}, {-44, 24}}, color = {0, 0, 127}), Line(points = {{50, 0}, {100, 0}}, color = {0, 0, 127}), Line(points = {{50, 0}, {100, 0}}, color = {0, 0, 255}), Ellipse(lineColor = {0, 0, 127}, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Text(extent = {{-36, 38}, {40, -30}}, textString = "-"), Line(points = {{-100, -60}, {-74, -28}, {-42, -28}}, color = {0, 0, 127})}));
    end Subtruct;

    block MultiSum
      extends Modelica.Blocks.Interfaces.PartialRealMISO;
    equation
      y = sum(u);
      annotation (
        Icon(graphics={  Text(extent = {{-72, 68}, {92, -68}}, textString = "+")}, coordinateSystem(initialScale = 0.1)));
    end MultiSum;

    model Tanh
      Modelica.Blocks.Interfaces.RealInput u annotation (
        Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y annotation (
        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      parameter Real Coeff = 1;
    equation
      y = tanh(Coeff * u);
      annotation (
        Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{0, -80}, {0, 68}}, color = {192, 192, 192}), Text(origin = {4, -2}, lineColor = {192, 192, 192}, extent = {{-88, 72}, {-16, 24}}, textString = "tanh"), Line(points = {{-80, -80}, {-47.8, -78.7}, {-35.8, -75.7}, {-27.7, -70.6}, {-22.1, -64.2}, {-17.3, -55.9}, {-12.5, -44.3}, {-7.64, -29.2}, {-1.21, -4.82}, {6.83, 26.3}, {11.7, 42}, {16.5, 54.2}, {21.3, 63.1}, {26.9, 69.9}, {34.2, 75}, {45.4, 78.4}, {72, 79.9}, {80, 80}}), Line(points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}), Polygon(origin = {0, 2}, rotation = 90, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}})}));
    end Tanh;

    model IF_winTout
      parameter Real d;
      Modelica.Blocks.Interfaces.RealOutput Tout annotation (
        Placement(visible = true, transformation(origin = {-110, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput win annotation (
        Placement(visible = true, transformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
        Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sources.Speed speed1(exact = true, phi(start = 0), w(start = 0)) annotation (
        Placement(visible = true, transformation(origin = {-42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation (
        Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain1(k = d) annotation (
        Placement(visible = true, transformation(origin = {-72, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    equation
      connect(torqueSensor1.flange_b, flange_a) annotation (
        Line(points = {{20, 0}, {100, 0}}));
      connect(speed1.flange, torqueSensor1.flange_a) annotation (
        Line(points = {{-32, 0}, {0, 0}}));
      connect(gain1.u, torqueSensor1.tau) annotation (
        Line(points = {{-60, -20}, {2, -20}, {2, -11}}, color = {0, 0, 127}));
      connect(gain1.y, Tout) annotation (
        Line(points = {{-84, -20}, {-102, -20}, {-102, -20}, {-110, -20}}, color = {0, 0, 127}));
      connect(win, speed1.w_ref) annotation (
        Line(points = {{-110, 20}, {-80, 20}, {-80, 0}, {-54, 0}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(initialScale = 0.1), graphics={  Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-2.66, 9.19}, points = {{-95.3431, 10.8085}, {-71.3431, 10.8085}, {-71.3431, -9.1916}}), Line(origin = {11, -1}, points = {{-85, 1}, {83, 1}}), Polygon(origin = {-2, 0}, fillColor = {154, 154, 154}, fillPattern = FillPattern.Solid, points = {{-20, 20}, {-20, -20}, {20, 0}, {-20, 20}})}),
        uses(Modelica(version = "3.2.3")));
    end IF_winTout;

    model IF_Tinwout
      Modelica.Blocks.Interfaces.RealOutput wout annotation (
        Placement(visible = true, transformation(origin = {-110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Tin annotation (
        Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
        Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation (
        Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation (
        Placement(visible = true, transformation(origin = {-10, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    equation
      connect(torque1.flange, flange_a) annotation (
        Line(points = {{-30, 0}, {100, 0}}));
      connect(speedSensor1.w, wout) annotation (
        Line(points = {{-22, 40}, {-68, 40}, {-68, 20}, {-110, 20}, {-110, 20}}, color = {0, 0, 127}));
      connect(torque1.flange, speedSensor1.flange) annotation (
        Line(points = {{-30, 0}, {20, 0}, {20, 40}, {0, 40}, {0, 40}}));
      connect(Tin, torque1.tau) annotation (
        Line(points = {{-110, -20}, {-68, -20}, {-68, 0}, {-52, 0}, {-52, 0}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(initialScale = 0.1), graphics={  Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-2.66, 9.19}, points = {{-95.3431, -31.1915}, {-71.3431, -31.1915}, {-71.3431, -9.1916}}), Line(origin = {11, -1}, points = {{-85, 1}, {83, 1}}), Polygon(origin = {2, 0}, fillColor = {182, 182, 182}, fillPattern = FillPattern.HorizontalCylinder, points = {{-20, 20}, {-20, -20}, {20, 0}, {-20, 20}, {-20, 20}})}),
        uses(Modelica(version = "3.2.3")));
    end IF_Tinwout;

    model Min
    extends Modelica.Blocks.Icons.Block;
      Modelica.Blocks.Interfaces.RealInput u1 annotation (
        Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 annotation (
        Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Logical.LessEqual lessEqual1 annotation (
        Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Logical.Switch switch1 annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y annotation (
        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(switch1.y, y) annotation (
        Line(points = {{12, 0}, {104, 0}, {104, 0}, {110, 0}}, color = {0, 0, 127}));
      connect(u2, switch1.u3) annotation (
        Line(points = {{-120, -60}, {-30, -60}, {-30, -8}, {-12, -8}, {-12, -8}}, color = {0, 0, 127}));
      connect(u1, switch1.u1) annotation (
        Line(points = {{-120, 60}, {-30, 60}, {-30, 8}, {-12, 8}, {-12, 8}}, color = {0, 0, 127}));
      connect(lessEqual1.y, switch1.u2) annotation (
        Line(points = {{-38, 0}, {-12, 0}, {-12, 0}, {-12, 0}}, color = {255, 0, 255}));
      connect(u2, lessEqual1.u2) annotation (
        Line(points = {{-120, -60}, {-80, -60}, {-80, -8}, {-62, -8}, {-62, -8}}, color = {0, 0, 127}));
      connect(u1, lessEqual1.u1) annotation (
        Line(points = {{-120, 60}, {-80, 60}, {-80, 0}, {-62, 0}, {-62, 0}}, color = {0, 0, 127}));
    end Min;

    /*  model CombiTable3D
              parameter String filename;
              constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
              parameter Real z_ax[:] = {10, 20, 40, 50};
              Modelica.Blocks.Tables.CombiTable2D combiTable2D1[nz](each fileName = currDir + "/Tables/" + filename, each smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = {"tab" + String(i) for i in 1:nz}, each tableOnFile = true) annotation(
                Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
              Modelica.Blocks.Interfaces.RealInput u annotation(
                Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
              Modelica.Blocks.Interfaces.RealInput u1 annotation(
                Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
              Modelica.Blocks.Interfaces.RealInput u2 annotation(
                Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
              parameter Boolean noExtrapolate = true;
              parameter Integer nz = size(z_ax, 1) "number of zi";
              Modelica.Blocks.Interfaces.RealOutput y annotation(
                Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
              Real y_z[nz];
            equation
              if noExtrapolate and (u2 < z_ax[1] or u2 >= z_ax[nz]) then
                if u2 < z_ax[1] then
                  y = combiTable2D1[1].y;
                else
                  y = combiTable2D1[nz].y;
                end if;
              else
                  y = Modelica.Math.Vectors.interpolate(z_ax, y_z, u2);
              end if;
              for i in 1:nz loop
                combiTable2D1[i].u1 = u;
                combiTable2D1[i].u2 = u1;
                y_z[i] = combiTable2D1[i].y;
              end for;
              annotation(
                Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-16, -8}, points = {{-60, 40}, {-60, -40}, {60, -40}, {60, 40}, {30, 40}, {30, -40}, {-30, -40}, {-30, 40}, {-60, 40}, {-60, 20}, {60, 20}, {60, 0}, {-60, 0}, {-60, -20}, {60, -20}, {60, -40}, {-60, -40}, {-60, 40}, {60, 40}, {60, -40}}), Line(origin = {-16, -8}, points = {{0, 40}, {0, -40}}), Line(origin = {-16, -8}, points = {{-60, 40}, {-30, 20}}), Line(origin = {-16, -8}, points = {{-30, 40}, {-60, 20}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, 0}, {-32.3077, 20}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, -20}, {-32.3077, 0}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, -40}, {-32.3077, -20}}), Rectangle(origin = {-16, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-30, 20}, {0, 40}}), Rectangle(origin = {-16, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 20}, {30, 40}}), Line(origin = {-2, 4}, points = {{-60, 40}, {-60, 28}, {60, 28}, {60, 40}, {30, 40}, {30, 28}, {-30, 28}, {-30, 40}, {-60, 40}, {-60, 28}, {60, 28}, {60, 0}, {46, 0}, {46, -20}, {60, -20}, {60, -40}, {46, -40}, {46, 40}, {60, 40}, {60, -40}}), Rectangle(origin = {-2, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Rectangle(origin = {-32, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Line(origin = {-2, 4}, points = {{-60, 40}, {-44, 28}}), Line(origin = {-2, 4}, points = {{-30, 40}, {-48, 28}}), Line(origin = {12, 16}, points = {{-60, 40}, {-60, 28}, {60, 28}, {60, 40}, {30, 40}, {30, 28}, {-30, 28}, {-30, 40}, {-60, 40}, {-60, 28}, {60, 28}, {60, 0}, {46, 0}, {46, -20}, {60, -20}, {60, -40}, {46, -40}, {46, 40}, {60, 40}, {60, -40}}), Rectangle(origin = {12, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Rectangle(origin = {-18, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Line(origin = {12, 16}, points = {{-60, 40}, {-44, 28}}), Rectangle(origin = {9.692, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Rectangle(origin = {-4.308, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Rectangle(origin = {-18.308, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Line(origin = {11.9666, 16.1}, points = {{-30, 40}, {-48, 28}}), Text(origin = {0, 133}, lineColor = {0, 0, 255}, extent = {{-140, 23}, {140, -23}}, textString = "%name")}),
                Diagram(coordinateSystem(initialScale = 0.1)),
                uses(Modelica(version = "3.2.3")));
            end CombiTable3D;*/

    model CombiTable3D
      Modelica.Blocks.Interfaces.RealInput u annotation (
        Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u1 annotation (
        Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u2 annotation (
        Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y annotation (
        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/Resources");
      parameter Real z_ax[:] = {10, 20, 40, 50};
      parameter Integer nz = size(z_ax, 1) "number of zi";
      parameter String filename = "NoName" "File where matrix is stored" annotation (
        Dialog(group = "Table data definition", enable = tableOnFile, loadSelector(filter = "Text files (*.txt);;MATLAB MAT-files (*.mat)", caption = "Open file in which table is present")));
      parameter String tableName = "tab(i) for i=1:nz" "Table name on file" annotation (
        Dialog(group = "Table data definition", enable = tableOnFile));
      parameter Boolean verboseRead = true "= true, if info message that file is loading is to be printed" annotation (
        Dialog(group = "Table data definition", enable = tableOnFile));
      parameter Modelica.Blocks.Types.Smoothness smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments "Smoothness of table interpolation" annotation (
        Dialog(group = "Table data interpretation"));
      parameter Modelica.Blocks.Types.Extrapolation extrapolation = Modelica.Blocks.Types.Extrapolation.LastTwoPoints "Extrapolation of data outside the definition range" annotation (
        Dialog(group = "Table data interpretation"));
      parameter Boolean verboseExtrapolation = false "= true, if warning messages are to be printed if table input is outside the definition range" annotation (
        Dialog(group = "Table data interpretation", enable = extrapolation == Modelica.Blocks.Types.Extrapolation.LastTwoPoints or extrapolation == Modelica.Blocks.Types.Extrapolation.HoldLastPoint));

      class ExternalCombiTable3D
        extends ExternalObject;

        function constructor
          extends Modelica.Icons.Function;
          input String tableName;
          input String fileName;
          input Real z_ax[:];
          input Integer nz;
          input Real table[:, :];
          input Modelica.Blocks.Types.Smoothness smoothness;
          input Modelica.Blocks.Types.Extrapolation extrapolation = Modelica.Blocks.Types.Extrapolation.LastTwoPoints;
          input Boolean verbosRead = true;
          output ExternalCombiTable3D tableID;

          external "C" tableID = createCombiTable3D(fileName, tableName, z_ax, nz, table, size(table, 1), size(table, 2), smoothness, extrapolation, verbosRead)
          annotation (
            Include = "#include <CombiTable3D.c>",
            IncludeDirectory = "modelica://TRAMI_L3_STEP_AT/Resources/library_etc");
        end constructor;

        function destructor
          extends Modelica.Icons.Function;
          input ExternalCombiTable3D tableID;

          external "C" deleteCombiTable3D(tableID)
          annotation (
            Include = "#include <CombiTable3D.c>",
            IncludeDirectory = "modelica://TRAMI_L3_STEP_AT/Resources/library_etc");
        end destructor;
      end ExternalCombiTable3D;

      function CombiTable3D_getValue
        extends Modelica.Icons.Function;
        input ExternalCombiTable3D tableID;
        input Real u1;
        input Real u2;
        input Real u3;
        output Real out;

        external "C" out = combiTable3D_getValue(tableID, u1, u2, u3)
        annotation (
          Include = "#include <CombiTable3D.c>",
          IncludeDirectory = "modelica://TRAMI_L3_STEP_AT/Resources/library_etc",
          Library = "ModelicaStandardTables");
      end CombiTable3D_getValue;
    protected
      parameter Boolean tableOnFile = true "= true, if table is defined on file or in function usertab" annotation (
        Dialog(group = "Table data definition"));
      parameter Real table[:, :] = fill(0.0, 0, 2) "Table matrix (grid u1 = first column, grid u2 = first row; e.g., table=[0, 0; 0, 1])" annotation (
        Dialog(group = "Table data definition", enable = not tableOnFile));
      parameter ExternalCombiTable3D tableID = ExternalCombiTable3D(if tableOnFile then tableName else "NoName", if tableOnFile and filename <> "NoName" and not Modelica.Utilities.Strings.isEmpty(filename) then currDir + "/Tables/" + filename else "NoName", z_ax, nz, table, smoothness, extrapolation, if tableOnFile then verboseRead else false);
    equation
      y = CombiTable3D_getValue(tableID, u, u1, u2);
      annotation (
        Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-16, -8}, points = {{-60, 40}, {-60, -40}, {60, -40}, {60, 40}, {30, 40}, {30, -40}, {-30, -40}, {-30, 40}, {-60, 40}, {-60, 20}, {60, 20}, {60, 0}, {-60, 0}, {-60, -20}, {60, -20}, {60, -40}, {-60, -40}, {-60, 40}, {60, 40}, {60, -40}}), Line(origin = {-16, -8}, points = {{0, 40}, {0, -40}}), Line(origin = {-16, -8}, points = {{-60, 40}, {-30, 20}}), Line(origin = {-16, -8}, points = {{-30, 40}, {-60, 20}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, 0}, {-32.3077, 20}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, -20}, {-32.3077, 0}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, -40}, {-32.3077, -20}}), Rectangle(origin = {-16, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-30, 20}, {0, 40}}), Rectangle(origin = {-16, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 20}, {30, 40}}), Line(origin = {-2, 4}, points = {{-60, 40}, {-60, 28}, {60, 28}, {60, 40}, {30, 40}, {30, 28}, {-30, 28}, {-30, 40}, {-60, 40}, {-60, 28}, {60, 28}, {60, 0}, {46, 0}, {46, -20}, {60, -20}, {60, -40}, {46, -40}, {46, 40}, {60, 40}, {60, -40}}), Rectangle(origin = {-2, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Rectangle(origin = {-32, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Line(origin = {-2, 4}, points = {{-60, 40}, {-44, 28}}), Line(origin = {-2, 4}, points = {{-30, 40}, {-48, 28}}), Line(origin = {12, 16}, points = {{-60, 40}, {-60, 28}, {60, 28}, {60, 40}, {30, 40}, {30, 28}, {-30, 28}, {-30, 40}, {-60, 40}, {-60, 28}, {60, 28}, {60, 0}, {46, 0}, {46, -20}, {60, -20}, {60, -40}, {46, -40}, {46, 40}, {60, 40}, {60, -40}}), Rectangle(origin = {12, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Rectangle(origin = {-18, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Line(origin = {12, 16}, points = {{-60, 40}, {-44, 28}}), Rectangle(origin = {9.692, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Rectangle(origin = {-4.308, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Rectangle(origin = {-18.308, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Line(origin = {11.9666, 16.1}, points = {{-30, 40}, {-48, 28}}), Text(origin = {0, 133}, lineColor = {0, 0, 255}, extent = {{-140, 23}, {140, -23}}, textString = "%name")}),
        Diagram(coordinateSystem(initialScale = 0.1)),
        uses(Modelica(version = "3.2.3")));
    end CombiTable3D;
  end Utilities;

  package Mechanics
    model ElastoGap
      import SI = Modelica.Units.SI;
      extends Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
      parameter SI.TranslationalSpringConstant c(final min = 0, start = 1) "Spring constant";
      parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) "Damping constant";
      parameter SI.Position s_rel0 = 0 "Unstretched spring length";
      parameter Real n(final min = 1) = 1 "Exponent of spring force ( f_c = -c*|s_rel-s_rel0|^n )";
      parameter Real Coeff = 1e5;
      SI.Force f_c "Spring force";
      SI.Force f_d2 "Linear damping force";
      SI.Force f_d_tmp;
      SI.Force f_d "Linear damping force which is limited by spring force (|f_d| <= |f_c|)";
      Real contact;
      Real gap;
    equation
      gap = s_rel0 - s_rel;
      contact = (1 + tanh(Coeff * gap)) / 2;
      f_c = -c * abs(gap) ^ n * contact;
      f_d2 = d * v_rel * contact;
      f_d_tmp = noEvent(max(-abs(f_c), f_d2));
      f_d = noEvent(min(abs(f_c), f_d_tmp));
      f = f_c + f_d;
      annotation (
        Icon(graphics={  Polygon(lineColor = {95, 127, 95}, fillColor = {95, 127, 95}, fillPattern = FillPattern.Solid, points = {{58, -70}, {28, -60}, {28, -80}, {58, -70}}), Text(extent = {{-150, -160}, {150, -130}}, textString = "d=%d"), Rectangle(lineColor = {0, 127, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{10, -6}, {50, -50}}), Text(extent = {{-150, -125}, {150, -95}}, textString = "c=%c"), Line(points = {{-12, -38}, {-12, 36}}, color = {0, 127, 0}, thickness = 1), Line(points = {{-12, -28}, {70, -28}, {70, 24}}, color = {0, 127, 0}), Line(visible = false, points = {{-100, -100}, {-100, -44}, {22, -44}, {22, -28}}, color = {191, 0, 0}, pattern = LinePattern.Dot), Line(points = {{-48, 36}, {-48, -38}}, color = {0, 127, 0}, thickness = 1), Line(points = {{-12, 24}, {0, 24}, {6, 34}, {18, 14}, {30, 34}, {42, 14}, {54, 34}, {60, 24}, {70, 24}}, color = {0, 127, 0}), Line(points = {{0, -50}, {50, -50}, {50, -6}, {0, -6}}, color = {0, 127, 0}), Line(points = {{-98, 0}, {-48, 0}}, color = {0, 127, 0}), Line(points = {{-52, -70}, {28, -70}}, color = {95, 127, 95}), Text(lineColor = {0, 0, 255}, extent = {{-150, 100}, {150, 60}}, textString = "%name")}));
    end ElastoGap;
  end Mechanics;
end Libraries;
