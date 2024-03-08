import 'package:flutter/material.dart';
import 'package:phuchung_63130476/widgets/wrapper_data.dart';

class MyDropdownButton extends StatefulWidget {
  final List<String> labels;
  final StringWrapper value;
  final Widget Function(String label)? itemBuilder;
  const MyDropdownButton({required this.labels, required this.value, this.itemBuilder,
    super.key});

  @override
  State<MyDropdownButton> createState() => MyDropdownButtonState();
}

class MyDropdownButtonState extends State<MyDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
        value: widget.value.value,
        items: widget.labels.map((label) => DropdownMenuItem(
            value: label,
            child: widget.itemBuilder != null ?
                widget.itemBuilder!(label) : 
                Text(label)
            )
        ).toList(),
        onChanged: (value){
          setState(() {
            widget.value.value = value;
          });
        },
    );
  }
}
