import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class UserProfileDetail extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPhotoUrl;

  const UserProfileDetail({
    Key? key,
    this.userName = "Carlos Lopez",
    this.userEmail = "carlitos@gmail.com",
    this.userPhotoUrl = "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=150",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 320.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF4268D3),
                    Color(0xFF584CD1)
                  ],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 50.0, left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),

          ListView(
            children: [
              const SizedBox(height: 40.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(userPhotoUrl)
                          )
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                              fontFamily: "Lato",
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          userEmail,
                          style: const TextStyle(
                            fontFamily: "Lato",
                            color: Colors.white70,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton(Icons.vpn_key, true),
                    _buildActionButton(Icons.add, false, isBig: true),
                    _buildActionButton(Icons.exit_to_app, true, onTap: () {
                      print("Cerrar sesión");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 20.0),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "My Saved Places",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      _buildPlaceCard(
                          "Salar de Uyuni",
                          "Maravilloso desierto de sal con un reflejo infinito del cielo.",
                          "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?q=80&w=300"
                      ),
                      _buildPlaceCard(
                          "Titicaca Lake",
                          "El lago navegable más alto del mundo, lleno de islas místicas.",
                          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=300"
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, bool isMini, {bool isBig = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isBig ? 65.0 : 40.0,
        height: isBig ? 65.0 : 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isBig ? Colors.white : Colors.white.withOpacity(0.4),
        ),
        child: Icon(
          icon,
          size: isBig ? 35.0 : 22.0,
          color: isBig ? const Color(0xFF584CD1) : Colors.white,
        ),
      ),
    );
  }

  Widget _buildPlaceCard(String title, String description, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0, 5)
            )
          ]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0)
            ),
            child: Image.network(
              imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: "Lato",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: "Lato",
                        fontSize: 12.0,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}