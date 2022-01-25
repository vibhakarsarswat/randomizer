import 'package:flutter/material.dart';
import 'package:randomizer/randomizer_page.dart';
import 'package:randomizer/range_selector_form.dart';

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
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (value) => _minValue = value, //Callback
        maxValueSetter: (value) => _maxValue = value, //Callback
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            // TODO: Navigate to the generator page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizerPage(
                  min: _minValue,
                  max: _maxValue,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
