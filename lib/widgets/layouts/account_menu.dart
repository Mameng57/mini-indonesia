import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lovo_photography/services/base_client.dart';
import 'package:lovo_photography/screens/login_page.dart';
import 'package:lovo_photography/widgets/capsule_button.dart';

class AccountMenu extends StatefulWidget {
  const AccountMenu({
    required this.userId,
    required this.userName,
    required this.phone,
    required this.email,
    required this.address,
    Key? key
  }) : super(key: key);

  final int? userId;
  final String? userName;
  final String? phone;
  final String? email;
  final String? address;

  @override
  State<AccountMenu> createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool showSaveButton = false;

  @override
  void initState() {
    userNameController.text = widget.userName!;
    phoneController.text = widget.phone!;
    emailController.text = widget.email!;
    addressController.text = widget.address!;

    super.initState();
  }

  void updatedData() {
    setState(() {
      showSaveButton = true;
    });
  }

  void saveUpdatedData() async {
    var response = await BaseClient().put(
      "/user/${widget.userId}",
      {
        'name': userNameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'address': addressController.text,
      }
    );

    if (mounted) {
      if (response.runtimeType == int) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Gagal menyimpan data..."))
        );

        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 5),
          content: Text(
            "Simpan data berhasi! Harap Login ulang untuk melihat perubahan"
          )
        )
      );

      setState(() {
        showSaveButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Akun Saya",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Divider(thickness: 2, color: Theme.of(context).colorScheme.primary,),
            Divider(
              thickness: 2,
              color: Theme.of(context).colorScheme.primary,
              indent: 50,
              endIndent: 50,
            ),
            const Divider(height: 15, color: Colors.transparent,),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: userNameController,
                    enableSuggestions: false,
                    onChanged: (_) => setState(() {
                      showSaveButton = true;
                    }),
                    decoration: InputDecoration(
                      prefix: Text(
                        "Nama : ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )
                      ),
                    ),
                  ),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    enableSuggestions: false,
                    onChanged: (_) => setState(() {
                      showSaveButton = true;
                    }),
                    decoration: InputDecoration(
                      prefix: Text(
                        "Nomor HP : ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    onChanged: (_) => setState(() {
                      showSaveButton = true;
                    }),
                    validator: (email) {
                      if (email!.isNotEmpty && email.contains("@")) {
                        return null;
                      }

                      return "Masukan Email yang valid";
                    },
                    decoration: InputDecoration(
                      prefix: Text(
                        "Email : ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  TextField(
                    controller: addressController,
                    maxLines: 4,
                    enableSuggestions: false,
                    onChanged: (_) => setState(() {
                      showSaveButton = true;
                    }),
                    decoration: InputDecoration(
                      prefix: Text(
                        "Alamat : ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  showSaveButton
                  ? Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CapsuleButton(
                      color: Theme.of(context).colorScheme.primary,
                      onTap: saveUpdatedData,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.save),
                          Text(
                            "Save",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  : const SizedBox(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CapsuleButton(
                color: Colors.red.shade700,
                onTap: () async {
                  var response = jsonDecode(
                    await BaseClient().post("/logout", {})
                  );

                  if (mounted) {
                    if (response['status'] != "OK") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Logout gagal...")
                        )
                      );
                    }

                    Navigator.pushNamedAndRemoveUntil(
                      context, LoginPage.routeName, (route) => false
                    );
                  }

                  return;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
