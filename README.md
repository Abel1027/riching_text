# <div align="center">RichingText</div>

<div align="center">
    Build a rich text and highlight actionable words/phrases within.
</div>

## Motivation

Sometimes we need to create a `RichText` containing many `TextSpan` depending on
the different styles we would like to apply to each substring. To do so, we need
to create all the substrings separately which does not make much sense
independently.

Therefore, `RichingText` is a new way of creating rich text by specifying the
whole meaningful text. Then, create a list of words or phrases you would like
to highlight within the main text. Furthermore, you can specify the style for
both the whole text and the highlighted word/phrase. Additionally, you can
make the highlighted text actionable so you can execute an action when the
word/phrase is pressed.

[![coverage][coverage_badge]][coverage_badge]

## Usage

```dart
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(title: const Text('RichingText')),
        body: RichingText(
          highlights: [
            const ActionableText(
              text: 'RichingText example',
              style: TextStyle(color: Colors.pink),
            ),
            ActionableText(
              text: 'here',
              style: const TextStyle(
                color: Colors.green,
                decoration: TextDecoration.lineThrough,
              ),
              action: () {
                // Execute action
              },
            ),
          ],
          text: 'RichingText example available here',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
```

## Gallery

<p align="center">
  <img width="538" height="588" src="https://github.com/Abel1027/riching_text/raw/main/gallery/riching_text.jpg">
</p>

## Author

- [Abel Rodríguez](https://github.com/Abel1027)

[coverage_badge]: https://github.com/Abel1027/riching_text/raw/main/gallery/coverage_badge.svg
