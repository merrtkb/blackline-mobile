import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../models/car.dart';
import '../models/favorite.dart';
import '../business/favorite_service.dart';
import '../business/user_session.dart';
import 'request_screen.dart';

class CarDetailScreen extends StatefulWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  final AudioPlayer player = AudioPlayer();
  final FavoriteService favoriteService = FavoriteService();

  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    checkFavorite();
  }

  Future<void> checkFavorite() async {
    final favorites = await favoriteService.getFavorites(
      UserSession.email ?? "",
    );

    setState(() {
      isFavorite = favorites.any((f) => f.carId == widget.car.id);
    });
  }

  Future<void> toggleFavorite() async {
    final result = await favoriteService.toggleFavorite(
      Favorite(
        userEmail: UserSession.email ?? "",
        carId: widget.car.id,
        carName: widget.car.name,
        image: widget.car.image,
      ),
    );

    setState(() {
      isFavorite = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),

      appBar: AppBar(
        backgroundColor: const Color(0xFF050505),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.car.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.car.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "\$${widget.car.price}",
                    style: const TextStyle(color: Colors.white70, fontSize: 20),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    widget.car.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await player.play(
                          AssetSource(
                            widget.car.soundUrl.replaceFirst('assets/', ''),
                          ),
                        );
                      },
                      icon: const Icon(Icons.volume_up),
                      label: const Text(
                        "PLAY ENGINE SOUND",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        side: const BorderSide(color: Colors.white38, width: 1),
                        minimumSize: const Size.fromHeight(55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  _info("Category", widget.car.category),

                  _info("Year", widget.car.year.toString()),

                  _info("Power", "${widget.car.power} "),

                  _info("Top Speed", "${widget.car.topSpeed} "),

                  _info("0-100", "${widget.car.acceleration} "),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RequestScreen(car: widget.car),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        side: const BorderSide(color: Colors.white38),
                        minimumSize: const Size.fromHeight(55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "SUBMIT REQUEST",
                        style: TextStyle(letterSpacing: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(color: Colors.white54, fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
