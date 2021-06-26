import 'package:flutter/material.dart';
import 'package:texster/utils/constants.dart';

class SliderCard extends StatelessWidget {
  SliderCard(
      {required this.child, required this.value, required this.valueType});
  final String valueType;
  final Slider child;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: kCardColor,
      elevation: 12.0,
      child: Column(
        children: [
          Text(
            '$valueType: ${value.toString().substring(0, 5)}',
            style: kLabelTextStyle,
          ),
          child,
        ],
      ),
    );
  }
}
