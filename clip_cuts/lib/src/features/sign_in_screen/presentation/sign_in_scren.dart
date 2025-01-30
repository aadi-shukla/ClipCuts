import 'dart:convert';

import 'package:clip_cuts/src/features/home_screen/presentation/home_screen.dart';
import 'package:clip_cuts/src/features/sign_up_screen/presentation/sign_up_screen.dart';
import 'package:clip_cuts/src/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('https://www.theaxelapps.in/dev/veerent/api/V1/login');

    var request = http.MultipartRequest('POST', url)
      ..fields['push_token'] =
          "8AB9DDD04B7AA4B5FCAD57D3369B3BA4394576813F2628ADE4B1B2B0EA66CB90"
      ..fields['device_id'] = "8ECB6CC4-D436-4C19-9350-6BCC6A1F8BC1s"
      ..fields['device_type'] = "ios"
      ..fields['email'] = _emailController.text
      ..fields['password'] = _passwordController.text;

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);
        // print('Login Success: $data');
        setState(() {
          loading = false;
        });
        ToastMessage.showToast("Login Success");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        print('Login Failed: ${response.statusCode}');
        setState(() {
          loading = false;
        });
        ToastMessage.showToast("Login Failed");
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.275,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
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
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
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
                                borderSide:
                                    const BorderSide(color: Colors.grey),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                          child: TextFormField(
                            obscureText: isObscure,
                            controller: _passwordController,
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'Password is required';
                              }
                              if (password.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
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
                                    isObscure = !isObscure;
                                  });
                                },
                                child: Icon(
                                  isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size:
                                      MediaQuery.of(context).size.height * 0.03,
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
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
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
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            await loginUser();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          }
                        },
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
                          child: loading
                              ? const CircularProgressIndicator(
                                  color: Color(0xffffffff),
                                )
                              : Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: const Color(0xffffffff),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.015,
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
                            "Sign Up",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.015,
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
            ],
          ),
        ),
      ),
    );
  }
}
