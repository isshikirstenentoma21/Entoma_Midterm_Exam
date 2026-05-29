import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedVariation = 1;
  int selectedDelivery = 0;

  final List<String> variationThumbnails = const [
    'assets/images/Placeholder_01-2.png',
    'assets/images/Placeholder_01-3.png',
    'assets/images/Placeholder_01-4.png',
  ];

  final List<_ProductCardData> mostPopular = const [
    _ProductCardData(
      image: 'assets/images/Placeholder_01-11.png',
      price: '\$78.00',
      badge: 'New',
    ),
    _ProductCardData(
      image: 'assets/images/Placeholder_01-12.png',
      price: '\$78.00',
      badge: '',
    ),
    _ProductCardData(
      image: 'assets/images/Placeholder_01-13.png',
      price: '\$78.00',
      badge: 'Hot',
    ),
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
                            const SizedBox(height: 16),
                            const _SectionHeader(title: 'Specifications'),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: const [
                                _SpecChip(text: 'Cotton 95%'),
                                _SpecChip(text: 'Nylon 5%'),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: const [
                                Text(
                                  'Origin',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 12),
                                _Pill(
                                  text: 'EU',
                                  textColor: Color(0xFF111111),
                                  backgroundColor: Color(0xFFF2F2F7),
                                  trailingIcon: Icons.keyboard_arrow_down_rounded,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Size guide',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                _CircleIconButton(
                                  icon: Icons.arrow_forward_ios_rounded,
                                  background: const Color(0xFFEAF1FF),
                                  iconColor: const Color(0xFF2F67F6),
                                  onTap: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const _SectionHeader(title: 'Delivery'),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                _DeliveryOptionTile(
                                  selected: selectedDelivery == 0,
                                  title: 'Standard',
                                  subtitle: '5-7days',
                                  price: '\$3.00',
                                  onTap: () => setState(() => selectedDelivery = 0),
                                ),
                                const SizedBox(height: 10),
                                _DeliveryOptionTile(
                                  selected: selectedDelivery == 1,
                                  title: 'Express',
                                  subtitle: '1-2days',
                                  price: '\$12.00',
                                  onTap: () => setState(() => selectedDelivery = 1),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Rating & Reviews',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Text(
                                  '4/5',
                                  style: TextStyle(fontSize: 12, color: Color(0xFF8E8E93)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: List.generate(
                                5,
                                (i) => Icon(
                                  i < 4 ? Icons.star_rounded : Icons.star_border_rounded,
                                  size: 18,
                                  color: const Color(0xFFFFB800),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const _ReviewTile(
                              avatar: 'assets/images/Placeholder_01-6.png',
                              name: 'Veronika',
                              rating: 4,
                              text:
                                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua, sed...',
                            ),
                            const SizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF2F67F6),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text('View All Reviews'),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Most Popular',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF8E8E93),
                                    fontWeight: FontWeight.w700,
                                  ),
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
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 128,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: mostPopular.length,
                                separatorBuilder: (_, __) => const SizedBox(width: 12),
                                itemBuilder: (context, index) =>
                                    _SmallProductCard(data: mostPopular[index]),
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

class _SpecChip extends StatelessWidget {
  const _SpecChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _DeliveryOptionTile extends StatelessWidget {
  const _DeliveryOptionTile({
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFF2F67F6) : const Color(0xFFE5E5EA),
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF1FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF2F67F6),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({
    required this.avatar,
    required this.name,
    required this.rating,
    required this.text,
  });

  final String avatar;
  final String name;
  final int rating;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FB),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 18, backgroundImage: AssetImage(avatar)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (i) => Icon(
                          i < rating ? Icons.star_rounded : Icons.star_border_rounded,
                          size: 14,
                          color: const Color(0xFFFFB800),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: const TextStyle(fontSize: 11, height: 1.35, color: Color(0xFF8E8E93)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallProductCard extends StatelessWidget {
  const _SmallProductCard({required this.data});

  final _ProductCardData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 102,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xFFF2F2F7),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(child: Image.asset(data.image, fit: BoxFit.cover)),
                if (data.badge.isNotEmpty)
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: data.badge == 'Hot'
                            ? const Color(0xFFFFD6D6)
                            : const Color(0xFFEAF1FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        data.badge,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: data.badge == 'Hot'
                              ? const Color(0xFFE34B4B)
                              : const Color(0xFF2F67F6),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.price,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class _ProductCardData {
  const _ProductCardData({required this.image, required this.price, required this.badge});

  final String image;
  final String price;
  final String badge;
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
