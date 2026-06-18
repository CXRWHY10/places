import 'package:flutter/material.dart';
import 'user_profile_detail.dart'; // Importamos tu diseño de perfil

class ProfilePlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retornamos directamente tu vista con los datos fijos locales
    return const UserProfileDetail();
  }
}

/* 💡 GUARDADO PARA EL BACKEND (PRACTICA 2):
Acá abajo te dejo tu lógica original con el StreamBuilder para cuando configuremos Firebase:

import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class ProfilePlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          // Cuando configures Firebase, descomentamos la variable 'user' en el constructor del detalle
          return const UserProfileDetail();
        }
        return LoginScreen();
      },
    );
  }
}
*/