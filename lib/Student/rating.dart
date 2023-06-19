import 'package:flutter/material.dart';
import 'package:student_portal/chat%20module/chatmodule.dart';

class RatingBar extends StatefulWidget {
  const RatingBar({Key? key});

  @override
  State<RatingBar> createState() => _RatingBarState();

  static RatingBarBuilder builder({
    required int minRating,
    required EdgeInsets itemPadding,
    required Widget Function(BuildContext context, int rating) itemBuilder,
    required void Function(int rating) onRatingUpdate,
    required bool updateOnDrag,
  }) {
    return RatingBarBuilder(
      minRating: minRating,
      itemBuilder: itemBuilder,
      itemPadding: itemPadding,
      onRatingUpdate: onRatingUpdate,
    );
  }
}

class _RatingBarState extends State<RatingBar> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rate Your Experience',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 40,
            ),
            buildRating(),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Chat()));
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRating() => RatingBar.builder(
        minRating: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: customRatingItemBuilder,
        updateOnDrag: true,
        onRatingUpdate: (rating) {
          setState(() {
            this.rating = rating.toDouble();
          });
        },
      );

  Widget customRatingItemBuilder(BuildContext context, int rating) {
    final Color color = rating <= this.rating ? Colors.amber : Colors.grey;
    return Icon(
      Icons.star,
      color: color,
    );
  }

  @override
  void initState() {
    super.initState();
    rating = 0;
  }
}

class RatingBarBuilder extends StatelessWidget {
  final int minRating;
  final Widget Function(BuildContext context, int rating) itemBuilder;
  final EdgeInsets itemPadding;
  final void Function(int rating) onRatingUpdate;

  const RatingBarBuilder({
    Key? key,
    required this.minRating,
    required this.itemBuilder,
    required this.itemPadding,
    required this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(minRating, (index) {
        final rating = index + 1;

        return GestureDetector(
          onTap: () => onRatingUpdate(rating),
          child: Padding(
            padding: itemPadding,
            child: itemBuilder(context, rating),
          ),
        );
      }),
    );
  }
}
