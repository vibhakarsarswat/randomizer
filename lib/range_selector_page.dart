import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  _RangeSelectorPageState createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  // Created a GlobalKey of 'type = <FormState>' to provide a Widget and its state throughout the app.
  final formKey = GlobalKey<FormState>();
  int _minValue = 0;
  int _maxValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: Form(
        key: formKey, // Added Global to key to this 'Form' widget
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: "Minimum",
                intValueSetter: (value) => _minValue = value, //Callback
              ),
              const SizedBox(height: 12),
              RangeSelectorTextFormField(
                labelText: 'Maximum',
                intValueSetter: (value) => _maxValue = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            // TODO: Navigate to the generator page
          }
        },
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
  final void Function(int value) intValueSetter;

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
