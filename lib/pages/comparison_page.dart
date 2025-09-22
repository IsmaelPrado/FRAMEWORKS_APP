import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/framework_comparison.dart';
import '../models/chart_data_model.dart'; // Importa el modelo de la gráfica

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

    // Datos para la gráfica de popularidad (pastel)
    final List<ChartDataModel> popularityData = frameworks
        .map((f) => ChartDataModel(
            label: f.name, value: f.popularity, color: f.primaryColor))
        .toList();

    // Datos para la gráfica de rendimiento (barras)
    final List<ChartDataModel> performanceData = frameworks
        .map((f) => ChartDataModel(
            label: f.name,
            value: f.features[0].score, // 'Rendimiento'
            color: f.primaryColor))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comparación de Frameworks"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Tarjetas de comparación
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
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
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
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

            const SizedBox(height: 30),

            // Carrusel de gráficas (debajo de las tarjetas)
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                autoPlay: true, // Cambia solito
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enableInfiniteScroll: true,
                viewportFraction: 0.9,
              ),
              items: [
                _buildPieChart(popularityData),
                _buildBarChart(performanceData),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para la gráfica de pastel
  // Widget para la gráfica de pastel
Widget _buildPieChart(List<ChartDataModel> data) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const Text(
          "Popularidad 2025",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 40, // más compacto
              sections: data.map((d) {
                return PieChartSectionData(
                  color: d.color,
                  value: d.value,
                  title: '${(d.value * 100).toInt()}%',
                  radius: 70, // tamaño más equilibrado
                  titlePositionPercentageOffset: 0.6, // evita que se corte
                  titleStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Leyenda bonita
        Wrap(
          spacing: 12,
          runSpacing: 6,
          children: data.map((d) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: d.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  d.label,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    ),
  );
}

  // Widget para la gráfica de barras
  Widget _buildBarChart(List<ChartDataModel> data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            "Rendimiento de Frameworks (Benchmarks 2025)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 1.0,
                barGroups: data.asMap().entries.map((entry) {
                  final index = entry.key;
                  final d = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: d.value,
                        color: d.color,
                        width: 25,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            data[value.toInt()].label.split(' ')[0],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color(0xffe7e7e7),
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(color: Color(0xffe7e7e7), width: 1),
                    left: BorderSide(color: Color(0xffe7e7e7), width: 1),
                  ),
                ),
              ),
            ),
          ),
        ],
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
