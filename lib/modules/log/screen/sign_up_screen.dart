import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      cpassword = TextEditingController();
  bool ps = false, cps = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height / 5,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 70,
            left: 20,
            child: Text(
              "Let's get you Sign Un!!!",
              style: TextStyle(
                  color: white, fontSize: 20, fontFamily: 'Merriweather'),
            ),
          ),
          Positioned(
              top: height / 5 - 30,
              left: 25,
              right: 25,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
                // child: Text('data'),
              )),
          Positioned(
            top: height / 5 - 30,
            right: 25,
            child: Container(
              height: 50,
              width: width / 2 - 10,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height / 3 - 50,
            left: 10,
            right: 10,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: width,
                  child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      labelText: 'Full Name',
                      labelStyle: TextStyle(fontFamily: 'Merriweather'),
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.email),
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: width,
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontFamily: 'Merriweather'),
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.email),
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: width,
                  child: TextFormField(
                    controller: password,
                    obscureText: !ps,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      labelText: 'PassWord',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      labelStyle: const TextStyle(fontFamily: 'Merriweather'),
                      border: const OutlineInputBorder(),
                      prefix: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: ps
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            ps = !ps;
                          });
                        },
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: width,
                  child: TextFormField(
                    controller: cpassword,
                    obscureText: !cps,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      labelText: 'Confirm PassWord',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      labelStyle: const TextStyle(fontFamily: 'Merriweather'),
                      border: const OutlineInputBorder(),
                      prefix: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: cps
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            cps = !cps;
                          });
                        },
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: primaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Merriweather',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1.2,
                      color: Colors.black,
                    )),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Or Login With'),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1.2,
                      color: Colors.black,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: width / 4,
                      width: width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey,
                      ),
                      child: Icon(
                        FontAwesomeIcons.facebookF,
                        color: primaryColor,
                        size: width / 7,
                      ),
                    ),
                    Container(
                      height: width / 4,
                      width: width / 4,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        FontAwesomeIcons.googlePlusG,
                        color: red,
                        size: width / 6,
                      ),
                    ),
                    Container(
                      height: width / 4,
                      width: width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey,
                      ),
                      child: Icon(
                        Icons.apple,
                        size: width / 6,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: width / 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Text(
                        'LogIn Here',
                        style: TextStyle(color: red, fontSize: 18),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
