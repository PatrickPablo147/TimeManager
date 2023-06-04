import 'package:flutter/material.dart';
import '../Theme/app_style.dart';
import 'package:gap/gap.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({Key? key,
    required this.titleText,
    required this.valueText,
    required this.iconSection,
    required this.onTap}) : super(key: key);

  final String titleText;
  final String valueText;
  final IconData iconSection;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText, style: AppStyle.heading1,),
          const Gap(6),
          Material(
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)
              ),
              child: InkWell(
                onTap: onTap ,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(iconSection, color: Colors.black54,),
                      const Gap(12),
                      Text(valueText)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
