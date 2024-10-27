import 'package:flutter/material.dart';
import 'package:malahi_app/core/widgets/small_button.dart';
import 'package:malahi_app/features/core/presentation/widgets/pack.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/packs/presentation/pages/pack_details_page.dart';
import 'package:malahi_app/features/tickets/presentation/pages/ticket_details_page.dart';

class PackWidget extends StatelessWidget {
  final List<PackModel> packs;

  const PackWidget({Key? key, required this.packs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of cards per row
          childAspectRatio: 10 / 10, // Aspect ratio of each card
          crossAxisSpacing: 8.0, // Space between cards
          mainAxisSpacing: 8.0, // Space between rows
        ),
        itemCount: packs.length,
        itemBuilder: (context, index) {
          return PackCoreWidget(
            pack: packs[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PackDetailsPage(
                    pack: packs[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
