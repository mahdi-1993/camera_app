import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class BiometricAuthService {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  // Check if Face Unlock is available
  Future<bool> isFaceUnlockAvailable() async {
    try {
      bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
      List<BiometricType> availableBiometrics =
          await _localAuthentication.getAvailableBiometrics();

      return canCheckBiometrics &&
          availableBiometrics.contains(BiometricType.face);
    } on PlatformException catch (e) {
      print('Error checking Face Unlock availability: $e');
      return false;
    }
  }

  // Perform Face Unlock authentication
  Future<bool> authenticateUser({
    String title = 'Authenticate',
    String localizedReason = 'Please authenticate with Face Unlock to proceed',
  }) async {
    try {
      // Check if Face Unlock is available
      bool isAvailable = await isFaceUnlockAvailable();
      if (!isAvailable) {
        print('Face Unlock not available');
        return false;
      }

      // Perform authentication
      return await _localAuthentication.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true, // Force biometric authentication
        ),
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Face Unlock',
            cancelButton: 'Cancel',
          ),
        ],
      );
    } on PlatformException catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }
}

// Example usage in a Flutter widget
class BiometricAuthScreen extends StatefulWidget {
  @override
  _BiometricAuthScreenState createState() => _BiometricAuthScreenState();
}

class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
  final BiometricAuthService _authService = BiometricAuthService();
  bool _isAuthenticated = false;

  Future<void> _performBiometricAuth() async {
    try {
      bool result = await _authService.authenticateUser(
        title: 'Unlock App',
        localizedReason: 'Verify your identity with Face Unlock',
      );

      setState(() {
        _isAuthenticated = result;
      });

      if (result) {
        // Navigate to home screen or perform authenticated action
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    } catch (e) {
      print('Authentication failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Face Unlock Authentication')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isAuthenticated
                  ? 'Authenticated'
                  : 'Please authenticate with Face Unlock',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _performBiometricAuth,
              child: Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder home screen after authentication
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text('Welcome! You are authenticated.'),
      ),
    );
  }
}
