import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/entry_model.dart';
import '../../logic/entries_cubit.dart';
import '../dialogs.dart';
import 'like_btn.dart';

class CouponList extends StatefulWidget {
  const CouponList({Key? key}) : super(key: key);

  @override
  State<CouponList> createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntriesCubit, EntriesState>(
      builder: (context, state) {
        List<EntryModel> coupons = state.entries
            .where((element) => element.category == 'Coupon')
            .toList();

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: coupons.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: GestureDetector(
                onTap: () => Dialogs.buildHighlightSheet(
                    context: context, entry: coupons[index]),
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Image
                      Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset(
                              coupons[index].imgPath,
                              fit: BoxFit.fill,
                            ),
                          ),
                          LikeBtn(entry: coupons[index]),
                        ],
                      ),
                      const SizedBox(width: 12.0),
                      // Text
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category

                            // Title
                            Text(coupons[index].title,
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8),
                            Flexible(
                              child: Text(coupons[index].description,
                                  maxLines: 2,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),

                            Expanded(child: Container()),

                            Text(coupons[index].short,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
