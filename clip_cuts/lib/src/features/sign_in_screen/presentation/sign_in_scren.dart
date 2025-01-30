import 'package:clip_cuts/src/features/sign_up_screen/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.275,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  // Top section with rounded image and overlay
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height * 0.5,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/img_sign_in_screen_bg.png',
                          height: MediaQuery.of(context).size.height * 0.2325,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.none,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2325,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height * 0.5,
                              ),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(0.5),
                                Colors.teal.withOpacity(0.5),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: MediaQuery.of(context).size.width * 0.4,
                    right: MediaQuery.of(context).size.width * 0.4,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.2,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          "assets/images/img_sign_in_screen_icon.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.035,
                fontWeight: FontWeight.bold,
                color: const Color(0xff000000),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Hello there, sign in to continue",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02,
                color: const Color(0xff7C7C7C),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            // Email input field
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    isEmailFocused = hasFocus;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isEmailFocused
                        ? const Color(0xff00B4BF).withOpacity(0.1)
                        : const Color(0xfff9f9f9),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.02),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      // labelText: "Email",
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: isEmailFocused
                            ? const Color(0xff00B4BF)
                            : Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.email,
                        size: MediaQuery.of(context).size.height * 0.03,
                        color: isEmailFocused
                            ? const Color(0xff00B4BF)
                            : Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02),
                        borderSide: BorderSide(
                            color: isEmailFocused
                                ? const Color(0xff00B4BF)
                                : Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // Password input field
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    isPasswordFocused = hasFocus;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isPasswordFocused
                        ? const Color(0xff00B4BF).withOpacity(0.1)
                        : const Color(0xfff9f9f9),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.02),
                  ),
                  child: TextField(
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: isPasswordFocused
                            ? const Color(0xff00B4BF)
                            : Colors.grey,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure; // Toggle the state
                          });
                        },
                        child: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          size: MediaQuery.of(context).size.height * 0.03,
                          color: isPasswordFocused
                              ? const Color(0xff00B4BF)
                              : Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02),
                        borderSide: BorderSide(
                            color: isPasswordFocused
                                ? const Color(0xff00B4BF)
                                : Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02),
                        borderSide: BorderSide(
                            color: isPasswordFocused
                                ? const Color(0xff00B4BF)
                                : Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // Remember me and Forgot password row
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        activeColor: Colors.amberAccent,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          color: const Color(0xff100f0f),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: const Color(0xff8b8b8b),
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // Sign in button
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity,
                      MediaQuery.of(context).size.height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                  backgroundColor: const Color(0xff004961),
                ),
                child: Center(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: const Color(0xffffffff),
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            // Sign up text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    color: const Color(0xff8b8b8b),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                      color: const Color(0xff100f0f),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
