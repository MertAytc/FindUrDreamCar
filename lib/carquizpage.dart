import 'package:flutter/material.dart';
import 'resultpage.dart';

class CarQuizPage extends StatefulWidget {
  const CarQuizPage({super.key});

  @override
  State<CarQuizPage> createState() => _CarQuizPageState();
}

class _CarQuizPageState extends State<CarQuizPage> {
  String? question1;
  String? question2;
  String? question3;
  String? question4;
  String? question5;
  String? question6;
  String? question7;
  String? question8;

  Widget buildQuestion(
    String title,
    List<String> options,
    String? groupValue,
    Function(String?) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade50, Colors.blue.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.deepPurple.shade200, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F1F1F),
              ),
            ),
            const SizedBox(height: 12),
            ...options.map(
              (option) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: groupValue == option
                          ? Colors.deepPurple
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    color: groupValue == option
                        ? Colors.deepPurple.shade100
                        : Colors.white,
                  ),
                  child: RadioListTile(
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: 15,
                        color: groupValue == option
                            ? Colors.deepPurple.shade900
                            : Colors.black87,
                        fontWeight: groupValue == option
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                    value: option,
                    groupValue: groupValue,
                    onChanged: onChanged,
                    activeColor: Colors.deepPurple,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade900, Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                pinned: true,
                expandedHeight: 140,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple.shade900,
                          Colors.blue.shade700,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "🚗 Rüya Arabanı Bul",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Senin hayalini bulmamıza yardım et",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                    child: Column(
                      children: [
                        buildQuestion(
                          "Araba ne için kullanılacak?",
                          [
                            "Günlük şehir içi",
                            "Performans & hız keyfi",
                            "Aile kullanımı",
                            "Off-road / zorlu yollar",
                          ],
                          question1,
                          (val) => setState(() => question1 = val),
                        ),
                        buildQuestion(
                          "Bütçeniz ne kadar?",
                          [
                            "150.000 TL altı",
                            "150.000 - 250.000 TL",
                            "250.000 - 500.000 TL",
                            "500.000 TL üstü",
                          ],
                          question2,
                          (val) => setState(() => question2 = val),
                        ),
                        buildQuestion(
                          "Yakıt tercihiniz nedir?",
                          ["Benzin", "Dizel", "Elektrik", "Hibrit"],
                          question3,
                          (val) => setState(() => question3 = val),
                        ),
                        buildQuestion(
                          "Hangi marka arabaları tercih edersiniz?",
                          ["Toyota", "BMW", "Mercedes", "Volkswagen", "Diğer"],
                          question4,
                          (val) => setState(() => question4 = val),
                        ),
                        buildQuestion(
                          "Vites tipi tercihiniz?",
                          ["Manuel", "Otomatik", "Yarı otomatik"],
                          question5,
                          (val) => setState(() => question5 = val),
                        ),
                        buildQuestion(
                          "Renk tercihiniz nedir?",
                          ["Siyah", "Beyaz", "Gri", "Kırmızı", "Mavi", "Diğer"],
                          question6,
                          (val) => setState(() => question6 = val),
                        ),
                        buildQuestion(
                          "Motor gücü tercihiniz?",
                          [
                            "1.0-1.5L (Ekonomik)",
                            "1.6-2.0L (Orta)",
                            "2.0L+ (Güçlü)",
                          ],
                          question7,
                          (val) => setState(() => question7 = val),
                        ),
                        buildQuestion(
                          "Güvenlik özellikleri önceliğiniz nedir?",
                          [
                            "Temel güvenlik",
                            "Gelişmiş sürücü destek sistemleri",
                            "Premium güvenlik paketi",
                          ],
                          question8,
                          (val) => setState(() => question8 = val),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple.shade600,
                                Colors.blue.shade600,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepPurple.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                      answers: [
                                        question1,
                                        question2,
                                        question3,
                                        question4,
                                        question5,
                                        question6,
                                        question7,
                                        question8,
                                      ],
                                    ),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(14),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Sonucu Gör",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
        ),
      ),
    );
  }
}
