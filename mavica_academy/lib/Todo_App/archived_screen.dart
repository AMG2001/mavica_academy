import 'package:flutter/material.dart';


class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
child: Center(child: Text("Archived Screen")),
    );
  }
}


/**
 *   showModalBottomSheet(
              isScrollControlled: true, // first in code to make it Scrolable
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    // padding in bottom with the height of the keyboard
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          topLeft: Radius.circular(28),
                        ),
                      ),
                      width: Get.width,
                      height: Get.height * .5,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            /**
                     * top space 
                     */
                            SizedBox(
                              height: 16,
                            ),
                            /**
                     * Slide gray shift 
                     */
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey,
                              ),
                              width: MediaQuery.of(context).size.width * .1,
                              height: MediaQuery.of(context).size.height * .005,
                            ),
                            /**
                     * Space between slide shift and post Title TF
                     */
                            SizedBox(
                              height: 24,
                            ),
                            /**
                     * Task Title TF
                     */
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.all(16),
                              child: TextFormField(
                                controller: _taskTitleController,
                                decoration: InputDecoration(
                                  labelText: "Task Title",
                                  prefixIcon: Icon(Icons.title),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            /**
                   * Task Time TF
                   */
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.all(16),
                              child: TextFormField(
                                controller: _taskTimeController,
                                decoration: InputDecoration(
                                  labelText: "Task Title",
                                  prefixIcon: Icon(Icons.access_alarm_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            /**
                   *  Task Date TF
                   */
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.all(16),
                              child: TextFormField(
                                controller: _taskDateController,
                                decoration: InputDecoration(
                                  labelText: "Task Title",
                                  prefixIcon: Icon(Icons.title),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
      
 */