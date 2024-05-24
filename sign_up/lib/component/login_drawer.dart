import 'package:flutter/material.dart';

class LoginDrawer extends StatelessWidget {
  const LoginDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_circle_left_outlined,
                ),
              ),
              const Spacer(),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Existing Accounts',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const Spacer(flex: 2),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  labelText: 'Password',
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.greenAccent[700],
                  ),
                  onPressed: () {},
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const FittedBox(child: Text("By logging in, you agree to the")),
              Text(
                "Terms and Conditions",
                style: TextStyle(color: Colors.greenAccent[700]),
              ),
              const Spacer(flex: 8),
            ],
          ),
        ),
      ),
    );
  }
}
