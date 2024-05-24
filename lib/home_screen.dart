

import 'package:firstly/main.dart';
import 'package:firstly/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;

  HomeScreen({required this.firstName, required this.lastName, required this.email});

  // Fonction pour obtenir l'icône de la météo en fonction de la température
  IconData getWeatherIcon(double temperature) {
    if (temperature <= 10) {
      return Icons.ac_unit; // Neige pour température froide
    } else if (temperature >= 30) {
      return Icons.wb_sunny; // Soleil pour température chaude
    } else {
      return Icons.thermostat; // Thermomètre par défaut
    }
  }

  @override
  Widget build(BuildContext context) {
    // Exemple de température (remplacez par la valeur réelle de la température)
    double temperature = 25;                        
    return Scaffold(
      appBar: AppBar(
        title: Text('ThermoControl'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $firstName !',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  getWeatherIcon(temperature), // Utilisation de la fonction pour obtenir l'icône dynamique
                  size: 48, // Taille de l'icône
                ),
                SizedBox(height: 16), // Espacement entre l'icône et le texte
                Text(
                  'Température actuelle', // Texte descriptif
                  style: TextStyle(fontSize: 20), // Style du texte
                ),
                SizedBox(height: 8), // Espacement entre le texte et la valeur de température
                Text(
                  '$temperature°C', // Valeur de température (exemple)
                  style: TextStyle(fontSize: 24), // Style du texte de la température
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action pour activer ou désactiver le système de chauffage/climatisation
                // Modifie les données dans Firestore en conséquence
              },
              child: Text('Activer/Désactiver'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'ThermControl',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profil'),
              onTap: () {
                // Naviguer vers la page du profil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                     builder: (context) => ProfileScreen (
                      firstName: firstName,
                      lastName: lastName,
                      email: email),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Historique de Température'),
              onTap: () {
                // Action pour afficher l'historique de température
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Réglages'),
              onTap: () {
                // Action pour afficher les réglages
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Déconnexion'),
              onTap: () {
                _logout(context); // Action pour se déconnecter
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fonction de déconnexion
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // Navigation vers la page de connexion
    );
  }
}
















