import 'package:clip_cuts/src/features/sign_in_screen/presentation/sign_in_scren.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // XFile? _profileImage;
  // final ImagePicker _picker = ImagePicker();
  bool _isTermsAccepted = false;
  bool isNameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isConfirmPasswordFocused = false;
  bool isMobileFocused = false;
  bool isPasswordObsecure = true;
  bool isConfirmPasswordObsecure = true;
  String selectedGender = '';

  // Future<void> _pickImage() async {
  //   final XFile? pickedImage =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _profileImage = pickedImage;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Hi welcome there",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff100f0f),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Please create your new account",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: const Color(0xff7c7c7c),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Upload profile picture",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: const Color(0xff100f0f),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      // onTap: _pickImage,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.04,
                        backgroundColor: const Color(0xfff9f9f9),

                        // backgroundImage: _profileImage != null
                        //     ? FileImage(File(_profileImage!.path))
                        //     : null,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: MediaQuery.of(context).size.height * 0.025,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      isNameFocused = hasFocus;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isNameFocused
                          ? const Color(0xff00B4BF).withOpacity(0.1)
                          : const Color(0xfff9f9f9),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.02),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: isNameFocused
                              ? const Color(0xff00B4BF)
                              : Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.height * 0.03,
                          color: isNameFocused
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
                              color: isNameFocused
                                  ? const Color(0xff00B4BF)
                                  : Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Focus(
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      isMobileFocused = hasFocus;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isMobileFocused
                          ? const Color(0xff00B4BF).withOpacity(0.1)
                          : const Color(0xfff9f9f9),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.02),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(
                          color: isMobileFocused
                              ? const Color(0xff00B4BF)
                              : Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.call,
                          size: MediaQuery.of(context).size.height * 0.03,
                          color: isMobileFocused
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
                              color: isMobileFocused
                                  ? const Color(0xff00B4BF)
                                  : Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: const Color(0xfff9f9f9),
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        border: Border.all(
                          color: const Color(0xff100f0f),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Male",
                            style: TextStyle(
                              color: const Color(0xff100f0f),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                            ),
                          ),
                          Radio(
                            value: "Male",
                            groupValue: selectedGender,
                            activeColor: const Color(0xff00B4BF),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: const Color(0xfff9f9f9),
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        border: Border.all(
                          color: const Color(0xff100f0f),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Female",
                            style: TextStyle(
                              color: const Color(0xff100f0f),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                            ),
                          ),
                          Radio(
                            value: "Female",
                            groupValue: selectedGender,
                            activeColor: const Color(0xff00B4BF),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Focus(
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
                      obscureText: isPasswordObsecure,
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
                              isPasswordObsecure =
                                  !isPasswordObsecure; // Toggle the state
                            });
                          },
                          child: Icon(
                            isPasswordObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      isConfirmPasswordFocused = hasFocus;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isConfirmPasswordFocused
                          ? const Color(0xff00B4BF).withOpacity(0.1)
                          : const Color(0xfff9f9f9),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.02),
                    ),
                    child: TextField(
                      obscureText: isConfirmPasswordObsecure,
                      decoration: InputDecoration(
                        hintText: "Confirm password",
                        hintStyle: TextStyle(
                          color: isConfirmPasswordFocused
                              ? const Color(0xff00B4BF)
                              : Colors.grey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isConfirmPasswordObsecure =
                                  !isConfirmPasswordObsecure; // Toggle the state
                            });
                          },
                          child: Icon(
                            isConfirmPasswordObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: MediaQuery.of(context).size.height * 0.03,
                            color: isConfirmPasswordFocused
                                ? const Color(0xff00B4BF)
                                : Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.02),
                          borderSide: BorderSide(
                              color: isConfirmPasswordFocused
                                  ? const Color(0xff00B4BF)
                                  : Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.02),
                          borderSide: BorderSide(
                              color: isConfirmPasswordFocused
                                  ? const Color(0xff00B4BF)
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isTermsAccepted,
                      activeColor: Colors.amberAccent,
                      onChanged: (value) {
                        setState(() {
                          _isTermsAccepted = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "By Signing up, you agree to our Terms & Privacy Policy.",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.015),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
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
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
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
        ),
      ),
    );
  }
}
