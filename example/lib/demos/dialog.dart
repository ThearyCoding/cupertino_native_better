import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/cupertino.dart';

class DialogDemoPage extends StatefulWidget {
  const DialogDemoPage({super.key});

  @override
  State<DialogDemoPage> createState() => _DialogDemoPageState();
}

enum _PreferredActionOption { none, primary, secondary, cancel }

class _DialogDemoPageState extends State<DialogDemoPage> {
  String _lastAction = 'None';
  bool _destructivePrimary = false;
  bool _includeSecondary = true;
  _PreferredActionOption _preferredAction = _PreferredActionOption.primary;

  CNDialogAction? get _preferredDialogAction {
    switch (_preferredAction) {
      case _PreferredActionOption.primary:
        return CNDialogAction.primary;
      case _PreferredActionOption.secondary:
        return CNDialogAction.secondary;
      case _PreferredActionOption.cancel:
        return CNDialogAction.cancel;
      case _PreferredActionOption.none:
        return null;
    }
  }

  Future<void> _showSimpleDialog() async {
    final action = await CNDialog.show(
      title: 'Native Dialog',
      message: 'This dialog is rendered by UIKit/AppKit.',
      primaryButtonText: 'OK',
      cancelButtonText: 'Cancel',
      primaryButtonStyle: _destructivePrimary
          ? CNDialogActionStyle.destructive
          : CNDialogActionStyle.normal,
      preferredAction: _preferredDialogAction,
    );
    setState(() => _lastAction = action?.name ?? 'Dismissed');
  }

  Future<void> _showTwoActionDialog() async {
    final action = await CNDialog.show(
      title: 'Delete File?',
      message: 'This action cannot be undone.',
      primaryButtonText: 'Delete',
      secondaryButtonText: _includeSecondary ? 'Archive' : null,
      cancelButtonText: 'Cancel',
      primaryButtonStyle: _destructivePrimary
          ? CNDialogActionStyle.destructive
          : CNDialogActionStyle.normal,
      secondaryButtonStyle: CNDialogActionStyle.normal,
      preferredAction: _preferredDialogAction,
    );
    setState(() => _lastAction = action?.name ?? 'Dismissed');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Native Dialog'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
           
            const SizedBox(height: 12),
            CupertinoListTile(
              title: const Text('Destructive Primary'),
              trailing: CupertinoSwitch(
                value: _destructivePrimary,
                onChanged: (value) {
                  setState(() => _destructivePrimary = value);
                },
              ),
            ),
            CupertinoListTile(
              title: const Text('Include Secondary Button'),
              trailing: CupertinoSwitch(
                value: _includeSecondary,
                onChanged: (value) {
                  setState(() => _includeSecondary = value);
                },
              ),
            ),
            CupertinoSlidingSegmentedControl<_PreferredActionOption>(
              groupValue: _preferredAction,
              children: const {
                _PreferredActionOption.none: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('None'),
                ),
                _PreferredActionOption.primary: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Primary'),
                ),
                _PreferredActionOption.secondary: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Secondary'),
                ),
                _PreferredActionOption.cancel: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Cancel'),
                ),
              },
              onValueChanged: (value) {
                if (value == null) return;
                setState(() => _preferredAction = value);
              },
            ),
            const SizedBox(height: 16),
            CNButton(
              label: 'Show Simple Dialog',
              onPressed: _showSimpleDialog,
              config: const CNButtonConfig(style: CNButtonStyle.filled),
            ),
            const SizedBox(height: 12),
            CNButton(
              label: 'Show 3-Button Dialog',
              onPressed: _showTwoActionDialog,
              config: const CNButtonConfig(style: CNButtonStyle.bordered),
            ),
            const SizedBox(height: 24),
            Text(
              'Last action: $_lastAction',
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
