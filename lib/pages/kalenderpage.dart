import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class KalenderPage extends StatefulWidget {
  const KalenderPage({super.key});

  @override
  State<KalenderPage> createState() => _KalenderPageState();
}

class _KalenderPageState extends State<KalenderPage> {
  late DateTime selectedDate;
  late DateTime focusedMonth;

  Timer? _midnightTimer;

  final Color primaryColor = const Color(0xff1A4892);

  /// ================== DUMMY DATA BERITA ==================
  final Map<String, List<Map<String, String>>> beritaByDate = {
    "2025-10-26": [
      {
        "title": "Pameran Seni Dan Budaya Dalam Rangka Ulang Tahun Banten 2026",
        "location": "Alun-Alun Serang",
        "image": "assets/images/event.png",
      },
      {
        "title": "Pameran Seni Dan Budaya Dalam Rangka Ulang Tahun Banten 2026",
        "location": "Alun-Alun Serang",
        "image": "assets/images/event.png",
      },
    ],
    "2025-10-20": [
      {
        "title": "Festival UMKM Provinsi Banten",
        "location": "Kota Serang",
        "image": "assets/images/event.png",
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _setToday();
    _scheduleMidnightUpdate();
  }

  void _setToday() {
    final now = DateTime.now();
    setState(() {
      selectedDate = DateTime(now.year, now.month, now.day);
      focusedMonth = DateTime(now.year, now.month);
    });
  }

  @override
  void dispose() {
    _midnightTimer?.cancel();
    super.dispose();
  }

  void _scheduleMidnightUpdate() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final duration = tomorrow.difference(now);

    _midnightTimer = Timer(duration, () {
      _setToday();
      _scheduleMidnightUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateUtils.getDaysInMonth(focusedMonth.year, focusedMonth.month);

    final firstWeekday =
        DateTime(focusedMonth.year, focusedMonth.month, 1).weekday % 7;

    final selectedKey = DateFormat('yyyy-MM-dd').format(selectedDate);
    final beritaList = beritaByDate[selectedKey] ?? [];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundkalender.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ================= HEADER =================
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SizedBox(
                  height: 48,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Tombol back di kiri
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),

                      // Logo di tengah
                      Image.asset(
                        'assets/images/Logobantenataskanan.png',
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),

              // ================= TITLE =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kalender Banten",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ================= MONTH PICKER =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tombol sebelumnya
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          setState(() {
                            final prev = DateTime(
                                focusedMonth.year, focusedMonth.month - 1);
                            if (prev.year >= 2020) {
                              focusedMonth = prev;

                              selectedDate = DateTime(
                                focusedMonth.year,
                                focusedMonth.month,
                                1,
                              );
                            }
                          });
                        },
                      ),

                      // Bulan & Tahun
                      Text(
                        DateFormat('MMMM yyyy').format(focusedMonth),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),

                      // Tombol selanjutnya
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () {
                          setState(() {
                            final next = DateTime(
                                focusedMonth.year, focusedMonth.month + 1);
                            if (next.year <= 2030) {
                              focusedMonth = next;

                              selectedDate = DateTime(
                                focusedMonth.year,
                                focusedMonth.month,
                                1,
                              );
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ================= CALENDAR =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      // Day names
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          "Sun",
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat"
                        ]
                            .map(
                              (e) => Expanded(
                                child: Center(
                                  child: Text(
                                    e,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 12),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: daysInMonth + firstWeekday,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          if (index < firstWeekday) {
                            return const SizedBox();
                          }

                          final day = index - firstWeekday + 1;
                          final date = DateTime(
                              focusedMonth.year, focusedMonth.month, day);

                          final isSelected =
                              DateUtils.isSameDay(date, selectedDate);
                          final isToday =
                              DateUtils.isSameDay(date, DateTime.now());

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blue
                                    : isToday
                                        ? Colors.blue.withOpacity(0.15)
                                        : Colors.transparent,
                                shape: BoxShape.circle,
                                border: isToday && !isSelected
                                    ? Border.all(color: Colors.blue, width: 1.5)
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "$day",
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : isToday
                                          ? Colors.blue
                                          : primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ================= BERITA =================
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hari ini, ${DateFormat('dd MMMM yyyy').format(selectedDate)}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: beritaList.isEmpty
                            ? const Center(
                                child: Text("Tidak ada berita"),
                              )
                            : ListView.builder(
                                itemCount: beritaList.length,
                                itemBuilder: (context, index) {
                                  final berita = beritaList[index];
                                  return _beritaCard(berita);
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
    );
  }

  /// ================== CARD BERITA ==================
  Widget _beritaCard(Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            child: const Icon(Icons.image),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["title"] ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data["location"] ?? "",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
