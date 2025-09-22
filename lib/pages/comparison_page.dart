import 'package:flutter/material.dart';
import '../models/framework_comparison.dart';

class ComparisonPage extends StatelessWidget {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FrameworkComparison> frameworks = [
      FrameworkComparison(
        name: "Flutter",
        logoPath: "assets/images/flutter.png",
        primaryColor: Colors.blue,
        features: [
          FrameworkFeature(name: "Rendimiento", score: 0.95),
          FrameworkFeature(name: "Acceso a APIs", score: 0.9),
        ],
        popularity: 0.85,
        easeOfLearning: 0.8,
        documentation: 0.9,
        ecosystem: 0.8,
      ),
      FrameworkComparison(
        name: "React Native",
        logoPath: "assets/images/react_native.png",
        primaryColor: Colors.lightBlue,
        features: [
          FrameworkFeature(name: "Rendimiento", score: 0.75),
          FrameworkFeature(name: "Acceso a APIs", score: 0.8),
        ],
        popularity: 0.9,
        easeOfLearning: 0.85,
        documentation: 0.85,
        ecosystem: 0.9,
      ),
      FrameworkComparison(
        name: "Kotlin/Swift",
        logoPath: "assets/images/kotlin_swift.png",
        primaryColor: Colors.orange,
        features: [
          FrameworkFeature(name: "Rendimiento", score: 1.0),
          FrameworkFeature(name: "Acceso a APIs", score: 1.0),
        ],
        popularity: 0.7,
        easeOfLearning: 0.6,
        documentation: 0.8,
        ecosystem: 0.7,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comparación de Frameworks"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: frameworks.map((framework) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      framework.primaryColor.withOpacity(0.9),
                      framework.primaryColor.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Imagen redondeada
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            framework.logoPath,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          framework.name,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: framework.features.map((feature) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feature.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: AnimatedContainer(
                                  duration:
                                      const Duration(milliseconds: 600),
                                  height: 14,
                                  width: MediaQuery.of(context).size.width *
                                      0.8 *
                                      feature.score,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    // Gráficos circulares estilo rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCircularRating(
                            "Popularidad", framework.popularity),
                        _buildCircularRating(
                            "Facilidad", framework.easeOfLearning),
                        _buildCircularRating(
                            "Docs", framework.documentation),
                        _buildCircularRating(
                            "Ecosistema", framework.ecosystem),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCircularRating(String label, double score) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: score,
                color: Colors.white,
                backgroundColor: Colors.white.withOpacity(0.3),
                strokeWidth: 6,
              ),
              Center(
                child: Text(
                  "${(score * 100).toInt()}%",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
