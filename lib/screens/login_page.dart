import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lovo_photography/models/user.dart';
import 'package:lovo_photography/screens/home_page.dart';
import 'package:lovo_photography/services/base_client.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: w / 1.15,
            height: h / 1.1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/big_card.png",
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  width: w / 1.5,
                  height: h / 4,
                  image: const AssetImage(
                    "assets/images/lovo.png",
                  ),
                ),
                Text(
                  "Silahkan masuk dengan akun member",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: w / 1.3,
                  height: h / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID Member",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary
                        ),
                        decoration: InputDecoration(
                          labelText: "Masukan Email / Nomor HP",
                          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary
                          ),
                        ),
                        onChanged: (tfEmailValue) {},
                      ),
                      Text(
                        "Password",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwController,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary
                        ),
                        decoration: InputDecoration(
                          labelText: "Masukan Password",
                          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary
                          ),
                        ),
                        onChanged: (tfPasswValue) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w / 1.3,
                  height: h / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 50,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text("Daftar"),
                            Icon(
                              Icons.whatsapp,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 50,
                          ),
                        ),
                        onPressed: () async {
                          var response = await BaseClient().post("/login", {
                              'email_or_phone': emailController.text,
                              'password': passwController.text,
                            }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login gagal..."),
                              ),
                            );
                          });

                          if (response != null) {
                            var data = jsonDecode(response);

                            if (mounted) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                HomePage.routeName,
                                (route) => false,
                                arguments: User.fromJson(data['user']),
                              );
                            }
                          }
                        },
                        child: Row(
                          children: const [
                            Text("Masuk"),
                            Icon(
                              Icons.login,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
