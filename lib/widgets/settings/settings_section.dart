import 'package:flutter/material.dart';

class SettingsSection extends StatefulWidget {
  final List<Map<String, dynamic>> options;

  const SettingsSection({
    super.key,
    required this.options,
  });

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(34, 34, 34, 0.05),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: widget.options
            .map(
              (option) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (option['iconData'] != null)
                        Icon(
                          option['iconData'],
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        option['label'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      if (option['type'] == 'route') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => option['route']));
                      } else {
                        option['action']();
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
