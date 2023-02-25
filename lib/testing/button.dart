import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        icon: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        label: Text(
          'Add',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            // isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Form(
                key: key,
                child: SingleChildScrollView(
                  child: AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.decelerate,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            maxLines: 2,
                            minLines: 2,
                            decoration: InputDecoration(
                                hintText: "Add Note", border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
