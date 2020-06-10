config 'wifi-device'    'radio0'
    option 'type'       'mac80211'
    option 'phy'        "${WIFI_PHY0}"
    option 'hwmode'     "${WIFI_HW_MODE_0}"
    option 'htmode'     "${WIFI_HT_MODE_0}"
    option 'channel'    "${WIFI_CHANNEL_0}"
	
config 'wifi-device'    'radio1'
    option 'type'       'mac80211'
    option 'phy'        "${WIFI_PHY1}"
    option 'hwmode'     "${WIFI_HW_MODE_1}"
    option 'htmode'     "${WIFI_HT_MODE_1}"
    option 'channel'    "${WIFI_CHANNEL_1}"	

config 'wifi-iface'     "${WIFI_IFACE_0}"
    option 'device'     'radio0'
    option 'network'    'lan'
    option 'mode'       'ap'
    option 'ifname'     "${WIFI_IFACE_0}"
    option 'ssid'       "${WIFI_SSID_0}"
    option 'encryption' "${WIFI_ENCRYPTION_0}"
    option 'key'        "${WIFI_KEY_0}"
    option 'disassoc_low_ack' '0'
	
config 'wifi-iface'     "${WIFI_IFACE_1}"
    option 'device'     'radio1'
    option 'network'    'lan'
    option 'mode'       'ap'
    option 'ifname'     "${WIFI_IFACE_1}"
    option 'ssid'       "${WIFI_SSID_1}"
    option 'encryption' "${WIFI_ENCRYPTION_1}"
    option 'key'        "${WIFI_KEY_1}"
    option 'disassoc_low_ack' '0'