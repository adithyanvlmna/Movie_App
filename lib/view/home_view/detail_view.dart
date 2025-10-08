import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailView extends StatefulWidget {
  static const String routeName = "detailView";
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _AvengersBookingScreenState();
}

class _AvengersBookingScreenState extends State<DetailView> {
  int selectedDateIndex = 2;
  String? selectedTime;

  List<String> showTimes = [
    '08:40 AM',
    '09:40 AM',
    '10:40 AM',
    '01:40 PM',
    '03:40 PM',
  ];

  List<DateTime> dates =
      List.generate(7, (i) => DateTime.now().add(Duration(days: i)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      body: Column(
        children: [
        
          Stack(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/detail_img.png'),
                    
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.85)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
          
            ],
          ),

      
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Avengers: End Game',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'UA16+  •  English  •  2 hr 18 min',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildTag('Action'),
                      const SizedBox(width: 8),
                      _buildTag('Sci Fi'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'After The Devastating Events Of Avengers: Infinity War (2018), The Universe Is In Ruins. With The Help Of Remaining Allies, The Avengers Assemble Once More In Order To Reverse Thanos\' Actions And Restore Balance To The Universe.',
                    style: TextStyle(color: Colors.white70, height: 1.3),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _personChip('Robert Downey Jr.'),
                      const SizedBox(width: 12),
                      _personChip('Scarlett Johansson'),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _buildDateSelector(),
                  const SizedBox(height: 16),
                  const Text(
                    'Showtimes',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: showTimes.map((time) {
                      final selected = selectedTime == time;
                      return GestureDetector(
                        onTap: () => setState(() => selectedTime = time),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color:
                                selected ? Colors.red : const Color(0xFF1B1B1E),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            time,
                            style: TextStyle(
                                color:
                                    selected ? Colors.white : Colors.white70),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: selectedTime == null
                        ? null
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Booked $selectedTime on ${DateFormat.yMMMd().format(dates[selectedDateIndex])}',
                                ),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'BOOK NOW',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final d = dates[index];
          final day = DateFormat('EEE').format(d);
          final date = DateFormat('d').format(d);
          final month = DateFormat('MMM').format(d);
          final selected = index == selectedDateIndex;

          return GestureDetector(
            onTap: () => setState(() => selectedDateIndex = index),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: selected ? Colors.white : const Color(0xFF1B1B1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(day,
                          style: TextStyle(
                              color: selected ? Colors.black : Colors.white70,
                              fontSize: 12)),
                      const SizedBox(height: 6),
                      Text(date,
                          style: TextStyle(
                              color: selected ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(month,
                    style: const TextStyle(color: Colors.white70, fontSize: 12))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white70)),
    );
  }

  Widget _personChip(String name) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 120,
          child: Text(name,
              style: const TextStyle(color: Colors.white70),
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
