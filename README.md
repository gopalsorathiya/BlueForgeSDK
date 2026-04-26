📦 BlueForge iOS BLE SDK

High-performance Bluetooth Low Energy (BLE) SDK for iOS with built-in:

🔗 Device connection & GATT operations
🚀 Secure OTA firmware updates
📊 Live performance monitoring
📜 Streaming logs
🔐 License-based access control
🚀 Installation (Swift Package Manager)
Step 1: Add Package

In Xcode:

File → Add Package Dependencies

Enter:

https://github.com/your-org/BlueForgeSDK
🔑 License Setup

You must provide a valid license key.

let manager = BlueForgeManager(
    licenseKey: "YOUR_LICENSE_KEY",
    autoReconnect: true
)

If license is invalid:

SDK will block all operations
Error will be logged internally
📡 Basic Usage
🔍 Scan Devices
for await devices in manager.scan() {
    print("Found:", devices)
}

Stop scan:

manager.stopScan()
🔗 Connect Device
let result = await manager.connect(deviceID)

switch result {
case .success:
    print("Connected")
case .failure(let error):
    print("Error:", error)
}
🔌 Disconnect
await manager.disconnect()
📦 GATT Operations
Read
let result = await manager.read("FFF1")

if case .success(let data) = result {
    print("Data:", data)
}
Write
let data = Data([0x01, 0x02])

await manager.write("FFF2", data: data)
Notifications
for await value in manager.notifications("FFF3") {
    print("Notify:", value)
}

Enable/Disable:

await manager.setNotification("FFF3", enabled: true)
🚀 OTA Firmware Update
let stream = manager.startOTA(
    firmwareURL: firmwareURL,
    checksum: "SHA256_CHECKSUM",
    configuration: BlueForgeOTAConfiguration(
        writeCharacteristicUUID: "FFF3",
        notifyCharacteristicUUID: "FFF4"
    )
)

for await status in stream {
    switch status {

    case .uploading(let progress):
        print("Progress:", progress)

    case .completed:
        print("Done")

    case .failed(let error):
        print("Error:", error)

    default:
        break
    }
}

Cancel OTA:

manager.cancelOTA()
📜 Logging System
Log Example
BlueForgeLogger.shared.log(
    "Device connected",
    category: .connection,
    level: .info
)
Live Logs (Streaming)
for await log in BlueForgeLogger.shared.liveLogs {
    print(log)
}
Clear Logs
BlueForgeLogger.shared.clearLogs()
Export Logs
let url = BlueForgeLogger.shared.exportLogs()
print("Logs:", url)
📊 Performance Monitoring
BlueForgeMonitor.shared.start()

BlueForgeMonitor.shared.onUpdate = { metrics in
    print("Speed:", metrics.uploadKBps)
}

Export CSV:

let url = BlueForgeMonitor.shared.exportReportCSV()

📁 Includes:

Throughput
Packet rate
Retry count
Efficiency
Bottleneck detection
🧠 Architecture Overview
BlueForgeManager → Main SDK entry
BlueForgeClient → BLE core engine
BlueForgeOTAEngine → OTA pipeline
BlueForgeLogger → Logging system
BlueForgeMonitor → Performance metrics
🔐 License Tiers
Tier    Features
Basic    Scan + Connect + Read/Write
Pro    + Notifications + Stability
Enterprise    + OTA + Monitoring + Full Access
💰 Pricing
Plan    Price (USD)
Basic    $99
Pro    $999
Enterprise    $4999

✔ One-time license
✔ Annual support optional

📞 Get License Key

To purchase a license:

📧 Email: your-email@company.com

💬 Include:

App name
Bundle ID
Use case (Basic / Pro / Enterprise)

You will receive:

License key
Integration support
OTA configuration guidance
⚠️ Important Notes
License is bundle-locked
OTA only works on Pro / Enterprise
Invalid license = SDK blocked
BLE requires proper device permissions
✅ Minimal Working Example
let manager = BlueForgeManager(
    licenseKey: "YOUR_KEY",
    autoReconnect: true
)

Task {

    for await devices in manager.scan() {

        if let device = devices.first {

            _ = await manager.connect(device.id)

            let data = await manager.read("FFF1")

            print(data)
            break
        }
    }
}
📌 Included Core Files
Manager & BLE core →
Monitoring engine →
🏁 Final Notes

This SDK is designed for:

Production BLE apps
Firmware upgrade systems
Hardware-integrated products

Focus: stability + speed + simplicity
