import 'package:flutter/material.dart';

// DATA_MODEL
class CardData {
  final String imageUrl;
  final String username;
  final String title;

  const CardData({
    required this.imageUrl,
    required this.username,
    required this.title,
  });
}

class CustomCardWidget extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String title;

  const CustomCardWidget({
    Key? key,
    required this.imageUrl,
    required this.username,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 48,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      username,
                      style: const TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TarjetasColumnPage extends StatelessWidget {
  final List<CardData> cards;

  // Actualizado: Ahora contiene las 5 tarjetas con datos de ejemplo
  const TarjetasColumnPage({Key? key})
      : cards = const <CardData>[
          CardData(
            imageUrl: 'https://raw.githubusercontent.com/LoyaCesar0630/Imagenes-para-flutter-6TO-I-11-FEB-2026/refs/heads/main/roll.jpeg',
            username: 'Favorito roll',
            title: 'Sushi empanizado',
          ),
          CardData(
            imageUrl: 'https://raw.githubusercontent.com/LoyaCesar0630/Imagenes-para-flutter-6TO-I-11-FEB-2026/refs/heads/main/pancoroll.jpeg',
            username: 'Panco roll',
            title: 'Rollo de sushi empanizado',
          ),
          CardData(
            imageUrl: 'https://raw.githubusercontent.com/LoyaCesar0630/Imagenes-para-flutter-6TO-I-11-FEB-2026/refs/heads/main/cafe2.jpg',
            username: 'Un cafe',
            title: 'Es solo un cafe',
          ),
          CardData(
            imageUrl: 'https://raw.githubusercontent.com/LoyaCesar0630/Imagenes-para-flutter-6TO-I-11-FEB-2026/refs/heads/main/cafe.png',
            username: 'Otro cafe',
            title: 'Del caffenio',
          ),
          CardData(
            imageUrl: 'https://raw.githubusercontent.com/LoyaCesar0630/Imagenes-para-flutter-6TO-I-11-FEB-2026/refs/heads/main/KINSUI-EXPRESS.jpg',
            username: 'Kinsui Express',
            title: 'Local de sushi',
          ),
        ],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Kinsui Express & coffe'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            final CardData card = cards[index];
            return CustomCardWidget(
              imageUrl: card.imageUrl,
              username: card.username,
              title: card.title,
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 12),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarjetas de Información',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TarjetasColumnPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const MyApp());
}