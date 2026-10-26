import '../models/vpn_server.dart';

class ServerService {
  static const List<VpnServer> servers = [
    VpnServer(
      id: 'jp01',
      name: 'Japan Server 01',
      country: 'Japan',
      flag: '🇯🇵',
      protocol: 'Outline',
    ),
    VpnServer(
      id: 'sg01',
      name: 'Singapore Server 01',
      country: 'Singapore',
      flag: '🇸🇬',
      protocol: 'Outline',
    ),
    VpnServer(
      id: 'us01',
      name: 'US Server 01',
      country: 'United States',
      flag: '🇺🇸',
      protocol: 'Outline',
    ),
    VpnServer(
      id: 'uk01',
      name: 'UK Server 01',
      country: 'United Kingdom',
      flag: '🇬🇧',
      protocol: 'V2Ray',
    ),
    VpnServer(
      id: 'th01',
      name: 'Thailand Server 01',
      country: 'Thailand',
      flag: '🇹🇭',
      protocol: 'V2Ray',
    ),
  ];
}
