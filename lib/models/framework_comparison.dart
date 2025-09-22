import 'dart:ui';

class FrameworkComparison {
  final String name;
  final String logoPath;
  final Color primaryColor;
  final List<FrameworkFeature> features;
  final double popularity; // 0 a 1
  final double easeOfLearning; // 0 a 1
  final double documentation; // 0 a 1
  final double ecosystem; // 0 a 1

  FrameworkComparison({
    required this.name,
    required this.logoPath,
    required this.primaryColor,
    required this.features,
    required this.popularity,
    required this.easeOfLearning,
    required this.documentation,
    required this.ecosystem,
  });
}

class FrameworkFeature {
  final String name;
  final double score; // 0 a 1
  FrameworkFeature({required this.name, required this.score});
}
