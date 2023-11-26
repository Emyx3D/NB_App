import 'package:flutter/material.dart';

class ConfirmationDialogRaw extends StatefulWidget {
  final Function(String) onClose;
  final String value;
  final List<String> options;
  final String title;

  const ConfirmationDialogRaw({
    super.key,
    required this.onClose,
    required this.value,
    required this.options,
    required this.title,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ConfirmationDialogRawState createState() => _ConfirmationDialogRawState();
}

class _ConfirmationDialogRawState extends State<ConfirmationDialogRaw> {
  late String value;
  late String title;
  late List<String> listOptions;
  @override
  void initState() {
    super.initState();
    value = widget.value;
    title = widget.title;
    listOptions = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(title),
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            RadioGroup(
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue!;
                });
              },
              children: listOptions.map((option) {
                return RadioListTile(
                  activeColor: const Color(0xFF22A1FF),
                  value: option,
                  groupValue: value,
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue!;
                    });
                  },
                  title: Text(option),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onClose('');
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onClose(value);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

class RadioGroup extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;
  final List<Widget> children;

  const RadioGroup({
    super.key,
    required this.value,
    required this.onChanged,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

