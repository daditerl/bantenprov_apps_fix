import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 420,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====== HEADER ======
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // ICON LINK
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.link,
                    size: 20,
                    color: Color(0xFF1F2A6B),
                  ),
                ),

                const SizedBox(width: 12),

                // TEXT LINK
                const Expanded(
                  child: Text(
                    'https://www.imdb.com/title/tt1757678/',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF1F2A6B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // COPY BUTTON
                ElevatedButton(
                  onPressed: () {
                    // TODO: Clipboard copy
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D8BBA),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Copy',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ====== SHARE GRID ======
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _shareItem('assets/images/drive.png', 'Drive'),
                _shareItem('assets/images/instagram.png', 'Instagram'),
                _shareItem('assets/images/wa.png', 'WhatsApp'),
                _shareItem('assets/images/gmail.png', 'Gmail'),
                _shareItem('assets/images/facebook.png', 'Facebook'),
                _shareItem('assets/images/line.png', 'Line'),
                _shareItem('assets/images/onedrive.png', 'OneDrive'),
                _shareItem('assets/images/zoom.png', 'Zoom'),
                _shareItem('assets/images/chrome.png', 'Chrome'),
                _shareItem('assets/images/telegram.png', 'Telegram'),
                _shareItem('assets/images/teams.png', 'Teams'),
                _shareItem('assets/images/twitter.png', 'X'),
              ],
            ),
          ),

          // ====== INDICATOR ======
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.circle, size: 8, color: Colors.grey),
              SizedBox(width: 6),
              Icon(Icons.circle, size: 8, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shareItem(String iconPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 56,
          width: 56,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(iconPath),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
