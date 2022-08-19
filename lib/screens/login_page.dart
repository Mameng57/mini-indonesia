import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

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
                  style: Theme.of(context).textTheme.headline2,
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
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      TextField(
                        controller: emailController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          labelText: "Masukan Email / Nomor HP",
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                        onChanged: (tfEmailValue) {},
                      ),
                      Text(
                        "Password",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          labelText: "Masukan Password",
                          labelStyle: Theme.of(context).textTheme.bodyText1,
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
                          primary: Theme.of(context).primaryColor,
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
                          primary: Theme.of(context).primaryColor,
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
