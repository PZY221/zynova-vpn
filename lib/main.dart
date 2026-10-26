import 'package:flutter/material.dart';

void main() {
  runApp(const ZynovaApp());
}

class ZynovaApp extends StatelessWidget {
  const ZynovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZYNOVA VPN',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1023),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF38BDF8),
          brightness: Brightness.dark,
        ),
      ),
      home: const VpnHome(),
    );
  }
}

class VpnHome extends StatefulWidget {
  const VpnHome({super.key});

  @override
  State<VpnHome> createState() => _VpnHomeState();
}

class _VpnHomeState extends State<VpnHome> {
  bool connected = false;
  String selectedServer = 'Singapore';
  String selectedCode = 'SG Server 01';

  final servers = <String, String>{
    'Singapore': 'SG Server 01',
    'United States': 'US Server 01',
    'United Kingdom': 'UK Server 01',
    'Japan': 'JP Server 01',
  };

  void selectServer() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFF172447),
      builder: (sheetContext) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const ListTile(
              title: Text(
                'Select VPN Server',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            for (final entry in servers.entries)
              ListTile(
                leading: const Icon(
                  Icons.public,
                  color: Color(0xFF38BDF8),
                ),
                title: Text(entry.key),
                subtitle: Text(entry.value),
                trailing: selectedServer == entry.key
                    ? const Icon(Icons.check_circle,
                        color: Color(0xFF38BDF8))
                    : null,
                onTap: () {
                  setState(() {
                    selectedServer = entry.key;
                    selectedCode = entry.value;
                    connected = false;
                  });
                  Navigator.pop(sheetContext);
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF38BDF8);
    const muted = Color(0xFFA6B4D7);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'ZYNOVA VPN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'ZYNOVA VPN',
                applicationVersion: '1.0.0 Demo',
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 28),
              const Icon(
                Icons.shield_outlined,
                color: blue,
                size: 48,
              ),
              const SizedBox(height: 16),
              const Text(
                'SECURE YOUR CONNECTION',
                style: TextStyle(
                  color: muted,
                  letterSpacing: 2,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 48),
              GestureDetector(
                onTap: () {
                  setState(() {
                    connected = !connected;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF172447),
                    border: Border.all(
                      color: connected
                          ? Colors.greenAccent
                          : blue,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (connected
                                ? Colors.greenAccent
                                : blue)
                            .withValues(alpha: 0.20),
                        blurRadius: 35,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.power_settings_new,
                    size: 82,
                    color: connected
                        ? Colors.greenAccent
                        : blue,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Text(
                connected
                    ? 'DEMO CONNECTED'
                    : 'DISCONNECTED',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: connected
                      ? Colors.greenAccent
                      : Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                connected
                    ? 'UI simulation only - VPN is not active'
                    : 'Tap the button to preview connection',
                textAlign: TextAlign.center,
                style: const TextStyle(color: muted),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: selectServer,
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF192644),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.public,
                        color: blue,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedServer,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              selectedCode,
                              style: const TextStyle(color: muted),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: muted,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Outline + V2Ray support coming soon',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: muted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
