import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minipro/route.dart';
import 'package:minipro/src/page/ChatPage/appointment.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var chatInputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(AppRoute.getChatPage(), color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: Container(
          padding: const EdgeInsets.only(right: 45),
          child: const Center(
            child: Text(
              'ติดต่อตัวแทน',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF161A30),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 780)),
            Column(
              children: [
                Container(
                  width: 430,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color(0xFF828181),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 8),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF161A30),
                                // borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: IconButton(
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Get.to(() => Appointment());
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 120, 119, 119)
                                    .withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 10,
                                // offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: chatInputController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                // borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      IconButton(
                        icon: const Icon(
                          Icons.send,
                          size: 40,
                          color: Color(0xFF161A30),
                        ),
                        onPressed: () {},
                      ),
                    ],
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
