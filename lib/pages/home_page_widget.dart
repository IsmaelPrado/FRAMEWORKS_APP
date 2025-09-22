import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/home_page.dart';
import '../models/framework_model.dart';

class HomePageWidget extends StatelessWidget {
  final HomePageModel home;

  const HomePageWidget({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Frameworks de Desarrollo Móvil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
              ),
              items: frameworks.map((framework) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(framework.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: frameworks.map((framework) {
                  return Card(
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
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            framework.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
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
