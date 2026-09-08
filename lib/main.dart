import 'package:flutter/material.dart';

void main() {
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HotelsScreen(),
    );
  }
}

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

 static const List<Map<String, String>> hotels = [
  {'name': 'Sharm El Sheikh', 'image': 'assets/sharm.jpeg'},
  {'name': 'Alexandria', 'image': 'assets/images.jpeg'},
  {'name': 'Dahab', 'image': 'assets/dahab.jpeg'},
  {'name': 'Marsa', 'image': 'assets/marsa.jpeg'},
  {'name': 'Nile', 'image': 'assets/nile.jpeg'},
  {'name': 'Aswan', 'image': 'assets/aswan.jpeg'},
];
  static const Color primaryBlue = Color(0xFF0C4189);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Available Hotels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: hotels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 195 / 231,
                  ),
                  itemBuilder: (context, index) {
                    final item = hotels[index];
                    return HotelCard(
                      title: item['name']!,
                      imagePath: item['image']!,
                      primaryColor: primaryBlue,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color primaryColor;

  const HotelCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
           color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}