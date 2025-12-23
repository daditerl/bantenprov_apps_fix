import 'package:flutter/material.dart';

class OpsiLainBottomSheet extends StatelessWidget {
  const OpsiLainBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 20,
        right: 20,
        bottom: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====== JUDUL ======
          const Text(
            'OPSI LAIN',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2A6B),
            ),
          ),

          const SizedBox(height: 12),
          const Divider(thickness: 1),

          // ====== ITEM ======
          _buildItem(
            icon: Icons.bookmark_border,
            text: 'Simpan Berita',
            onTap: () {
              Navigator.pop(context);
            },
          ),

          _buildItem(
            icon: Icons.link,
            text: 'Salin Tautan',
            onTap: () {
              Navigator.pop(context);
            },
          ),

          _buildItem(
            icon: Icons.flag_outlined,
            text: 'Laporkan ini',
            onTap: () {
              Navigator.pop(context);
            },
          ),

          _buildItem(
            icon: Icons.chat_bubble_outline,
            text: 'Kirimkan Masukan',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: const Color(0xFF1F2A6B)),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF1F2A6B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
