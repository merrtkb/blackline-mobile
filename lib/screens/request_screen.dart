import 'package:flutter/material.dart';
import '../models/car.dart';
import '../business/request_service.dart';
import '../business/user_session.dart';
import '../models/vehicle_request.dart';

class RequestScreen extends StatefulWidget {
  final Car car;

  const RequestScreen({super.key, required this.car});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final RequestService requestService = RequestService();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    print("FULLNAME = ${UserSession.fullName}");
    print("EMAIL = ${UserSession.email}");

    nameController.text = UserSession.fullName ?? "";
    emailController.text = UserSession.email ?? "";
  }

  bool isLoading = false;

  Future<void> sendRequest() async {
    if (phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Phone number is required")));
      return;
    }
    setState(() {
      isLoading = true;
    });

    try {
      await requestService.addRequest(
        VehicleRequest(
          userEmail: UserSession.email ?? "",
          carId: widget.car.id,
          carName: widget.car.name,
          phone: phoneController.text,
          message: messageController.text,
          status: "Pending",
        ),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Request submitted successfully")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    messageController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white38),
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white24),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white54),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),

      appBar: AppBar(
        backgroundColor: const Color(0xFF050505),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 10),

                const Text(
                  "Request Vehicle",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                const SizedBox(height: 40),

                Text(
                  widget.car.name,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),

                const SizedBox(height: 6),

                Text(
                  "\$${widget.car.price}",
                  style: const TextStyle(color: Colors.white54, fontSize: 18),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: nameController,
                  readOnly: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputStyle("Full Name"),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: emailController,
                  readOnly: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputStyle("Email"),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputStyle("Phone Number"),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: messageController,
                  maxLines: 6,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputStyle("Message (Optional)"),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    onPressed: isLoading ? null : sendRequest,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: Colors.white38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),

                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "SUBMIT REQUEST",
                            style: TextStyle(letterSpacing: 2, fontSize: 14),
                          ),
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
