import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_todo_smriti/screens/task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _formData = TextEditingController();
  String textValue = "";

  // this list will contain all the todos
  List todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 44, 79),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Good Afternoon, Smritii",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "It's Tuesday, 18th April, 2023",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 18,
                    )),
                    // style: TextStyle(
                    //   fontSize: 20,
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _formData,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter a item",
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // textValue = _formData.text;
                    todoList.add({
                      "task": _formData.text,
                      "icon": Icons.task,
                      "checked": false,
                    });
                    _formData.text = "";
                    print(_formData.text);
                    setState(() {});
                  },
                  child: Text(
                    "Add",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 180, 179),
                            fontWeight: FontWeight.bold),
                        fontSize: 18),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    var item = todoList[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: item['checked'],
                            onChanged: (value) {
                              for (var i = 0; i < todoList.length; i++) {
                                if (todoList[i] == item) {
                                  // print(todoList[i]);
                                  setState(() {
                                    todoList[i]['checked'] =
                                        !todoList[i]['checked'];
                                  });
                                }
                              }
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              print("tap");
                              Get.to(
                                TaskScreen(),
                                transition: Transition.rightToLeft,
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => TaskScreen(),
                              //   ),
                              // );
                            },
                            child: Text(item['task']),
                          ),
                          Icon(item['icon']),
                        ],
                      ),
                    );
                  },
                ),
                // if (textValue != "")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
