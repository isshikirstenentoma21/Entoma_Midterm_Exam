import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedVariation = 1;

  final List<String> variationThumbnails = const [
    'assets/images/Placeholder_01-2.png',
    'assets/images/Placeholder_01-3.png',
    'assets/images/Placeholder_01-4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Image.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned.fill(
            top: 380,
            child: Container(color: Colors.white),
          ),
          Positioned.fill(
            child: SafeArea(
              top: false,
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 330),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 16, 18, 120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$17.00',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, primis pulvinar sapien.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          height: 1.35,
                                          color: Color(0xFF8E8E93),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                _CircleIconButton(
                                  icon: Icons.north_east,
                                  background: const Color(0xFFF6D7DD),
                                  iconColor: const Color(0xFFCC6E7C),
                                  onTap: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            _SectionHeader(
                              title: 'Variations',
                              trailing: Row(
                                children: [
                                  const _Pill(
                                    text: 'Pink',
                                    textColor: Color(0xFF8A51FF),
                                    backgroundColor: Color(0xFFF0E8FF),
                                  ),
                                  const SizedBox(width: 10),
                                  _CircleIconButton(
                                    icon: Icons.arrow_forward_ios_rounded,
                                    background: const Color(0xFFEAF1FF),
                                    iconColor: const Color(0xFF2F67F6),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 56,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: variationThumbnails.length,
                                separatorBuilder: (_, __) => const SizedBox(width: 10),
                                itemBuilder: (context, index) {
                                  final bool selected = index == selectedVariation;
                                  return GestureDetector(
                                    onTap: () => setState(() => selectedVariation = index),
                                    child: Container(
                                      width: 56,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: selected
                                              ? const Color(0xFF2F67F6)
                                              : const Color(0xFFE5E5EA),
                                          width: selected ? 2 : 1,
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.asset(
                                        variationThumbnails[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.trailingIcon,
  });

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: textColor),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 6),
            Icon(trailingIcon, size: 16, color: const Color(0xFF8E8E93)),
          ],
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.background,
    required this.iconColor,
    required this.onTap,
  });

  final IconData icon;
  final Color background;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: Icon(icon, size: 16, color: iconColor),
      ),
    );
  }
}
