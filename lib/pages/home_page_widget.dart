import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/home_page.dart';
import '../models/framework_model.dart';

// Importa las páginas
import 'flutter_page.dart';
import 'kotlin_swift_page.dart';
import 'react_native_page.dart';

class HomePageWidget extends StatefulWidget {
  final HomePageModel home;

  const HomePageWidget({Key? key, required this.home}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final List<FrameworkModel> frameworks = [
    FrameworkModel(
      name: "Flutter",
      imagePath: "assets/images/flutter.png",
      description:
          "Framework de Google para desarrollar aplicaciones nativas para iOS y Android desde un solo código.",
      color: Colors.blue,
      icon: Icons.flutter_dash,
    ),
    FrameworkModel(
      name: "Kotlin/Swift",
      imagePath: "assets/images/kotlin_swift.png",
      description:
          "Lenguajes nativos para Android (Kotlin) y iOS (Swift) para máximo rendimiento y acceso a APIs nativas.",
      color: Colors.orange,
      icon: Icons.code,
    ),
    FrameworkModel(
      name: "React Native",
      imagePath: "assets/images/react_native.png",
      description:
          "Framework de Facebook que permite crear apps nativas usando JavaScript y React.",
      color: Colors.lightBlue,
      icon: Icons.mobile_friendly,
    ),
  ];

  String? hoveredFramework;

  void _navigateToPage(String frameworkName) {
    if (frameworkName == "Flutter") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const FlutterPage()),
      );
    } else if (frameworkName == "Kotlin/Swift") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const KotlinSwiftPage()),
      );
    } else if (frameworkName == "React Native") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ReactNativePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frameworks de Desarrollo Móvil')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Carrusel de imágenes
            CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.85,
                aspectRatio: 16 / 9,
              ),
              items: frameworks.map((framework) {
                final isHovered = hoveredFramework == framework.name;
                return Builder(
                  builder: (BuildContext context) {
                    return MouseRegion(
                      onEnter: (_) => setState(() {
                        hoveredFramework = framework.name;
                      }),
                      onExit: (_) => setState(() {
                        hoveredFramework = null;
                      }),
                      child: GestureDetector(
                        onTap: () => _navigateToPage(framework.name),
                        child: AnimatedScale(
                          scale: isHovered ? 1.1 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    framework.imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                  // Fondo semitransparente
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.9),
                                          Colors.black.withOpacity(0.6),
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                  // Texto encima
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    right: 20,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          framework.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black,
                                                blurRadius: 6,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          framework.description,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
           // Lista de frameworks con descripción
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Column(
    children: frameworks.map((framework) {
      final isHovered = hoveredFramework == framework.name;
      return MouseRegion(
        onEnter: (_) => setState(() {
          hoveredFramework = framework.name;
        }),
        onExit: (_) => setState(() {
          hoveredFramework = null;
        }),
        child: GestureDetector(
          onTap: () => _navigateToPage(framework.name),
          child: AnimatedScale(
            scale: isHovered ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                color: framework.color, // Fondo con color del framework
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        framework.icon,
                        size: 32,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          framework.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }).toList(),
  ),
),

          ],
        ),
      ),
    );
  }
}
