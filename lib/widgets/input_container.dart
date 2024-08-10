import 'package:flutter/material.dart';

class Input_Container extends StatefulWidget {
  final Function addtx;
  Input_Container({required this.addtx});

  @override
  State<Input_Container> createState() => _Input_ContainerState();
}

class _Input_ContainerState extends State<Input_Container> {
  TextEditingController nameController = TextEditingController();

  TextEditingController amountController = TextEditingController();
  void submitData() {
    final text;
    final amt;
    text = nameController.text;
    amt = double.parse(amountController.text);
    if (text.isEmpty || amt <= 0) {
      return;
    }
    widget.addtx(text, amountController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: submitData,
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
