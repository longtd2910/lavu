import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _carouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();
    return SafeArea(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: CarouselSlider(
                  items: [
                    welcomeComponent('assets/images/welcome1.png', "Joyfulness", "Enjoy happy moments with family"),
                    welcomeComponent('assets/images/welcome2.png', "Convenience", "All your favorite foods in one place with online reservation feature"),
                    welcomeComponent('assets/images/welcome3.png', "Enjoy & Reviews", "Enjoy all your great food, review and share your experience"),
                  ],
                  options: CarouselOptions(
                    aspectRatio: 0.9,
                    viewportFraction: 1,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _carouselIndex = index;
                      });
                    },
                  ),
                  carouselController: controller,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 8, left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (_carouselIndex == 0) ? const Color(0xFF0A0A0A) : const Color(0xFFF0ECE6),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 8, left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (_carouselIndex == 1) ? const Color(0xFF0A0A0A) : const Color(0xFFF0ECE6),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 8, left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (_carouselIndex == 2) ? const Color(0xFF0A0A0A) : const Color(0xFFF0ECE6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 176,
                height: 44,
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Getting Started',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Color(0xFF95AE45),
                    ),
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF0A0A0A))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container welcomeComponent(String imageAsset, String label, String description) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              imageAsset,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 30, left: 30),
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
