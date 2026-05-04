import 'package:flutter/material.dart';
import 'package:cupertino_native_better/cupertino_native_better.dart';

class DialogDemoPage extends StatefulWidget {
  const DialogDemoPage({super.key});

  @override
  State<DialogDemoPage> createState() => _DialogDemoPageState();
}

class _DialogDemoPageState extends State<DialogDemoPage> {
  String _result = 'No dialog shown yet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Dialog Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Result:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _result,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showSimpleDialog,
              child: const Text('Simple Dialog (OK/Cancel)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _showThreeButtonDialog,
              child: const Text('Three Button Dialog'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _showDestructiveDialog,
              child: const Text('Destructive Action Dialog'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _showPreferredActionDialog,
              child: const Text('Dialog with Preferred Action'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _showMessageOnlyDialog,
              child: const Text('Message Only Alert'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showSimpleDialog() async {
    final result = await CNDialog.show(
      title: 'Simple Dialog',
      message: 'Do you want to proceed?',
      primaryButtonText: 'OK',
      secondaryButtonText: 'Cancel',
    );
    
    setState(() {
      if (result == CNDialogAction.primary) {
        _result = 'You pressed: OK';
      } else if (result == CNDialogAction.secondary) {
        _result = 'You pressed: Cancel';
      } else if (result == CNDialogAction.cancel) {
        _result = 'You pressed: Cancel button';
      } else {
        _result = 'Dialog was dismissed';
      }
    });
  }

  Future<void> _showThreeButtonDialog() async {
    final result = await CNDialog.show(
      title: 'Choose an Option',
      message: 'Please select an option below:',
      primaryButtonText: 'Option A',
      secondaryButtonText: 'Option B',
      cancelButtonText: 'Cancel',
    );
    
    setState(() {
      switch (result) {
        case CNDialogAction.primary:
          _result = 'You selected: Option A';
          break;
        case CNDialogAction.secondary:
          _result = 'You selected: Option B';
          break;
        case CNDialogAction.cancel:
          _result = 'You selected: Cancel';
          break;
        default:
          _result = 'Dialog was dismissed';
      }
    });
  }

  Future<void> _showDestructiveDialog() async {
    final result = await CNDialog.show(
      title: 'Delete Item',
      message: 'Are you sure you want to delete this item? This action cannot be undone.',
      primaryButtonText: 'Delete',
      secondaryButtonText: 'Cancel',
      primaryButtonStyle: CNDialogActionStyle.destructive, // Red button on iOS
    );
    
    setState(() {
      if (result == CNDialogAction.primary) {
        _result = 'Item deleted!';
      } else if (result == CNDialogAction.secondary) {
        _result = 'Deletion cancelled';
      } else {
        _result = 'Dialog was dismissed';
      }
    });
  }

  Future<void> _showPreferredActionDialog() async {
    final result = await CNDialog.show(
      title: 'Save Changes',
      message: 'You have unsaved changes. Do you want to save them?',
      primaryButtonText: 'Save',
      cancelButtonText: 'Cancel',
      preferredAction: CNDialogAction.primary, 
    );
    
    setState(() {
      switch (result) {
        case CNDialogAction.primary:
          _result = 'Changes saved';
          break;
        case CNDialogAction.secondary:
          _result = 'Changes discarded';
          break;
        case CNDialogAction.cancel:
          _result = 'Action cancelled';
          break;
        default:
          _result = 'Dialog was dismissed';
      }
    });
  }

  Future<void> _showMessageOnlyDialog() async {
    final result = await CNDialog.show(
      title: 'Information',
      message: 'This is a simple message dialog with only an OK button.',
      primaryButtonText: 'Got it',
      cancelButtonText: null, // No cancel button
    );
    
    setState(() {
      if (result == CNDialogAction.primary) {
        _result = 'User acknowledged the message';
      } else {
        _result = 'Dialog closed';
      }
    });
  }
}