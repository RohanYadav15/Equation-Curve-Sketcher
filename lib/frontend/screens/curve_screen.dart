import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texster/backend/equations.dart';
import 'package:texster/providers/curve_screen_provider.dart';
import 'package:texster/frontend/widgets/graph_painter.dart';
import 'package:texster/utils/constants.dart';
import 'package:texster/utils/enums.dart';

import '../widgets/slider_card.dart';

class CurveScreen extends StatelessWidget {
  Equation getEquation(CurveModel model) {
    switch (model.selectedEquation) {
      case Equations.linear:
        return LinearEquation(
            a: model.valueOfA, b: model.valueOfB, c: model.valueOfC);

      case Equations.quadratic:
        return QuadraticEquation(
            a: model.valueOfA, b: model.valueOfB, c: model.valueOfC);

      case Equations.cubic:
        return CubicEquation(
            a: model.valueOfA,
            b: model.valueOfB,
            c: model.valueOfC,
            d: model.valueOfD);
      default:
        return LinearEquation(a: 1.0, b: 0.0, c: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              child: Consumer<CurveModel>(
                builder: (context, model, image) {
                  return Stack(
                    children: [
                      image ?? Text('ssf'),
                      CustomPaint(
                        painter: DrawCurve(
                          equation: getEquation(model),
                        ),
                        size: Size(
                          double.infinity,
                          350.0,
                        ),
                      ),
                    ],
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  child: Image.asset(
                    'assets/images/grid.jpg',
                    height: 350.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
                context
                    .select<CurveModel, String>((value) => value.getHeaderText),
                textStyle: kLabelTextStyle,
                speed: Duration(milliseconds: 300),
                curve: Curves.bounceInOut),
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SliderCard(
                  valueType: 'A',
                  child: Slider(
                    activeColor: kActiveColor,
                    max: 4.9999,
                    min: -4.9999,
                    value: context
                        .select<CurveModel, double>((value) => value.valueOfA),
                    onChanged: context.read<CurveModel>().changeA,
                  ),
                  value: context
                      .select<CurveModel, double>((value) => value.valueOfA),
                ),
                SliderCard(
                  valueType: 'B',
                  child: Slider(
                      activeColor: kActiveColor,
                      max: 3.9999,
                      min: -3.9999,
                      value: context.select<CurveModel, double>(
                          (value) => value.valueOfB),
                      onChanged: context.read<CurveModel>().changeB),
                  value: context
                      .select<CurveModel, double>((value) => value.valueOfB),
                ),
                SliderCard(
                  valueType: 'C',
                  child: Slider(
                      activeColor: kActiveColor,
                      max: 19.9999,
                      min: -19.9999,
                      value: context.select<CurveModel, double>(
                          (value) => value.valueOfC),
                      onChanged: context.read<CurveModel>().changeC),
                  value: context
                      .select<CurveModel, double>((value) => value.valueOfC),
                ),
                if (context.select<CurveModel, Equations>(
                        (value) => value.selectedEquation) ==
                    Equations.cubic) ...[
                  SliderCard(
                    child: Slider(
                      activeColor: kActiveColor,
                      max: 9.9999,
                      min: -9.9999,
                      value: context.select<CurveModel, double>(
                          (value) => value.valueOfD),
                      onChanged: context.read<CurveModel>().changeD,
                    ),
                    value: context
                        .select<CurveModel, double>((value) => value.valueOfD),
                    valueType: 'D',
                  ),
                ],
              ],
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          height: MediaQuery.of(context).size.height * 0.1,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.cyan[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: CupertinoPicker(
            backgroundColor: Colors.cyan[200],
            itemExtent: 30.0,
            onSelectedItemChanged: (value) =>
                Provider.of<CurveModel>(context, listen: false)
                    .dropDownChanged(value),
            children: [
              Text('Linear', style: kHeaderTextStyle),
              Text('Quadratic', style: kHeaderTextStyle),
              Text('Cubic', style: kHeaderTextStyle),
            ],
          ),
        )
      ],
    );
  }
}
