import 'package:crypto_wallet/net/flutterfire.dart';
import 'package:crypto_wallet/ui/home_view.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: _emailField,
            decoration: const InputDecoration(
                hintText: "Something@gmail.com",
                hintStyle: TextStyle(color: Colors.white),
                label: Text('Email'),
                labelStyle: TextStyle(color: Colors.white)),
          ),
          TextFormField(
            controller: _passwordField,
            decoration: const InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.white),
                label: Text('password'),
                labelStyle: TextStyle(color: Colors.white)),
            obscureText: true,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: MaterialButton(
              onPressed: () async {
                bool shouldNavigate =
                    await register(_emailField.text, _passwordField.text);

                if (shouldNavigate) {
                  //Navigate

                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                }
              },
              child: Text("Register"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: MaterialButton(
              onPressed: () async {
                bool shouldNavigate =
                    await signIn(_emailField.text, _passwordField.text);

                if (shouldNavigate) {
                  //Navigate
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                }
              },
              child: const Text("Login"),
            ),
          ),
        ],
      ),
    ));
  }
}
