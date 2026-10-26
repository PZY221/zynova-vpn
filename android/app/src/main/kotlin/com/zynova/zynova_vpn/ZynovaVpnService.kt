package com.zynova.zynova_vpn

import android.net.VpnService
import android.os.ParcelFileDescriptor

class ZynovaVpnService : VpnService() {

    private var vpnInterface: ParcelFileDescriptor? = null

    override fun onDestroy() {
        vpnInterface?.close()
        vpnInterface = null
        super.onDestroy()
    }
}
