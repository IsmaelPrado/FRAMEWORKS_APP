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
    ),
    FrameworkModel(
      name: "Kotlin/Swift",
      imagePath: "assets/images/kotlin_swift.png",
      description:
          "Lenguajes nativos para Android (Kotlin) y iOS (Swift) para máximo rendimiento y acceso a APIs nativas.",
    ),
    FrameworkModel(
      name: "React Native",
      imagePath: "assets/images/react_native.png",
      description:
          "Framework de Facebook que permite crear apps nativas usando JavaScript y React.",
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
        // ¡Importante! Asegúrate de que el nombre de la clase 'KotlinSwiftPage'
        // coincida exactamente con el nombre de la clase en el archivo
        // kotlin_swift_page.dart. Si no, cámbialo aquí.
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
      appBar: AppBar(
        title: const Text('Frameworks de Desarrollo Móvil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Carrusel de imágenes
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(framework.imagePath),
                                fit: BoxFit.cover,
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
                        // SizedBox para asegurar que todas las tarjetas tengan el mismo tamaño
                        child: SizedBox(
                          width: double.infinity, // Ancho completo
                          height: 180, // Altura fija
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    framework.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: Text(
                                      framework.description,
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
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