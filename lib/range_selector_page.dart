import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:randomizer/randomizer_page.dart';
import 'package:randomizer/range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  // Created a GlobalKey of 'type = <FormState>' to provide a Widget and its state throughout the app.
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final minNum = useState<int>(0);
    final maxNum = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (value) => minNum.value = value, //Callback
        maxValueSetter: (value) => maxNum.value = value, //Callback
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
                  min: minNum.value,
                  max: minNum.value,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
