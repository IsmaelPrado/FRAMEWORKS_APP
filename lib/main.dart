import 'package:flutter/material.dart';
import 'package:frameworks_app/models/home_page.dart';
import 'package:frameworks_app/pages/home_page_widget.dart';
import 'pages/tutorial_page_widget.dart';
import 'models/tutorial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tutorial Lottie',
      home: const TutorialScreen(),
    );
  }
}

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<TutorialPageModel> pages = [
    TutorialPageModel(
      animation: "assets/lottie/flutter.json",
      title: "¡Bienvenido!",
      text:
          "Esta app te enseñará los frameworks más populares para desarrollo móvil: Flutter, React Native y Kotlin/Swift.",
      bgColor1: Colors.orange,
      bgColor2: Colors.deepOrange,
    ),
    TutorialPageModel(
      animation: "assets/lottie/framework.json",
      title: "¿Qué es un framework de desarrollo móvil?",
      text:
          "Es un conjunto de herramientas y librerías que permiten crear aplicaciones para smartphones de manera más rápida y eficiente.",
      bgColor1: Colors.blue,
      bgColor2: Colors.blueAccent,
    ),
    TutorialPageModel(
      animation: "assets/lottie/learn_more.json",
      title: "Conoce más...",
      text:
          "Explora Flutter, React Native y Kotlin/Swift para descubrir cuál se adapta mejor a tus proyectos y necesidades.",
      bgColor1: const Color.fromARGB(255, 99, 76, 175),
      bgColor2: const Color.fromARGB(255, 112, 105, 240),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return TutorialPageWidget(page: pages[index]);
            },
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    pages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentPage == index ? 16 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentPage < pages.length - 1) {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    } else {
                      // Acción al terminar tutorial
                      // Por ejemplo, navegar a la pantalla principal
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageWidget(
                            home: HomePageModel(
                              welcomeText: "¡Bienvenido a la página principal!",
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    currentPage == pages.length - 1 ? "Finalizar" : "Siguiente",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
