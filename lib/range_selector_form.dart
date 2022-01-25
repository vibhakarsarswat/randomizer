import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, // Added Global to key to this 'Form' widget
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: "Minimum",
              intValueSetter: minValueSetter,
            ),
            const SizedBox(height: 12),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: minValueSetter,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: true),

      // Validate the Value present in 'TextFormField', if it returns NULL all is fine (i.e. no error)
      // TtyParse: (unlike like 'parse'), if output is not an 'int', it will not throw a format exception, but return a 'NULL'
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        } else {
          return null;
        }
      },

      // Take the Value present in 'TextFormField' and pass it to 'intValueSetter' callback
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
