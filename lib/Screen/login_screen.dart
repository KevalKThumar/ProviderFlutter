import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/auth_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void checkPassword(email, password) {
      if (email != '' && password != '') {
        authProvider.login(email, password, context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter your email and password'),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: "Login".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "Login".text.fontWeight(FontWeight.bold).xl4.makeCentered(),
            20.heightBox,
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: "Email".text.make(),
                hintText: "Enter your email",
                prefixIcon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            10.heightBox,
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: "password".text.make(),
                hintText: "Enter your password",
                prefixIcon: const Icon(Icons.lock),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            20.heightBox,
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  checkPassword(emailController.text, passwordController.text);
                },
                child: authProvider.isLoding
                    ? const CircularProgressIndicator()
                    : "Login".text.xl2.make(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
