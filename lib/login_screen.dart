import 'package:flutter/material.dart';
import 'package:places/places_cupertino.dart';
import 'gradient_back.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [

          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: GradientBack(),
          ),

          Center(
            child: Container(
              width: screenWidth > 600 ? 450 : double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bienvenido a Places",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lato"
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 40),
                    _buildTextField("Email", Icons.email_outlined, false),
                    SizedBox(height: 15),
                    _buildTextField("Password", Icons.lock_outline, true),

                    SizedBox(height: 30),

                    _buildCustomButton(
                        "Login",
                        const [Color(0xFFa7ff84), Color(0xFF1cbb78)],
                        Colors.white,
                            () {

                          print("Login presionado");

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => PLacesCupertino())
                          );
                        }
                    ),

                    SizedBox(height: 15),

                    _buildCustomButton(
                        "Login with Google",
                        null,
                        Colors.white,
                            () => print("Google Login"),
                        hasBorder: true
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white60),
        filled: true,
        fillColor: Colors.white.withOpacity(0.15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCustomButton(String text, List<Color>? gradientColors, Color textColor, VoidCallback onTap, {bool hasBorder = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: gradientColors != null ? LinearGradient(colors: gradientColors) : null,
          border: hasBorder ? Border.all(color: Colors.white, width: 1.2) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato"
            ),
          ),
        ),
      ),
    );
  }
}