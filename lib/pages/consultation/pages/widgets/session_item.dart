import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import '../../data/models/statistics_model.dart';

class SessionItem extends StatefulWidget {
  final List<SessionDynamic> sessionsDynamic;

  const SessionItem({super.key, required this.sessionsDynamic});

  @override
  _SessionItemState createState() => _SessionItemState();
}

class _SessionItemState extends State<SessionItem> {
  int maxClients = 1; // Eng katta client soni
  double maxBarRenderWidth = 0.0; // Bar maksimal eni

  @override
  void initState() {
    super.initState();
    // Post-frame callback orqali MediaQuery ishlatamiz
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateMaxValues();
      if (mounted) setState(() {});
    });
  }

  /// Ekran o‘lchami va maxClients hisoblanadi
  void _calculateMaxValues() {
    final sessions = widget.sessionsDynamic;

    if (sessions.isNotEmpty) {
      maxClients =
          sessions.map((e) => e.clients).reduce((a, b) => a > b ? a : b);
    }

    final screenWidth = MediaQuery.of(context).size.width;
    maxBarRenderWidth = screenWidth * 0.68; // 50% qismi bar uchun
  }

  /// Eni hisoblash funksiyasi – maxClients bilan
  double calculateBarWidth(int value) {
    if (maxClients == 0) return 0.0;
    return (value / maxClients) * maxBarRenderWidth;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.sessionsDynamic.length,
      itemBuilder: (context, index) {
        final session = widget.sessionsDynamic[index];
        final clientsWidth = calculateBarWidth(session.clients);

        final diffInt = int.tryParse(session.diff);
        final diffWidth =
            diffInt != null ? calculateBarWidth(diffInt.abs()) : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  // Session label (chap taraf)
                  SizedBox(
                    width: context.width * 0.18,
                    height: 32,
                    child: FittedBox(
                      child: Text(
                        '${session.sessions} сессия',
                        style: context.textStyle.s14w500Manrope
                            .copyWith(fontSize: 12, height: 1.55),
                      ),
                    ),
                  ),
                  10.wGap,
                  // Clients bar (asosiy bar)
                  Container(
                    width: clientsWidth,
                    height: 32,
                    decoration: BoxDecoration(
                      color: context.color.secondary200.withAlpha(150),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${session.clients}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),

                  // Diff bar (agar mavjud bo‘lsa)
                  if (diffInt != null)
                    Container(
                      width: diffWidth,
                      height: 32,
                      decoration: BoxDecoration(
                        color: context.color.secondary200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                    ),
                ],
              ),
              if (diffInt != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    diffInt.toString(),
                    // '${diffInt?? ''}${diffInt != '' && diffInt! > 0 ? '+' : ''}$diffInt',
                    style:
                        context.textStyle.s14w500Manrope.copyWith(fontSize: 12),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
