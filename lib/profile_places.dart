import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'gradient_back.dart';

class ProfilePlaces extends StatelessWidget {
  const ProfilePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBack("Perfil de Usuario"),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 40.0),

                  Row(
                    children: [
                      Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.0),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/hombre.jpg"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Carlos Lopez",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "carlos@correo.com",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14.0,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50.0),

                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const ListTile(
                            leading: Icon(Icons.badge, color: Colors.deepPurple),
                            title: Text("Documento de Identidad"),
                            subtitle: Text("7975711"),
                          ),
                          const Divider(),
                          const ListTile(
                            leading: Icon(Icons.phone_android, color: Colors.deepPurple),
                            title: Text("Celular"),
                            subtitle: Text("78488011"),
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
                            title: const Text(
                              "Cerrar Sesión",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Text("Salir de tu cuenta de forma segura"),
                            onTap: () async {
                              final SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.remove('auth_token');

                              if (context.mounted) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                                      (route) => false, // Elimina todo el historial para evitar volver atrás
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}