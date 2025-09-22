// models/chart_data_model.dart
import 'package:flutter/material.dart';

class ChartDataModel {
  final String label;
  final double value;
  final Color color;

  ChartDataModel({
    required this.label,
    required this.value,
    required this.color,
  });
}