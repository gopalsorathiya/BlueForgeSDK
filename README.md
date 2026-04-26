# 📦 BlueForge iOS BLE SDK

> Production-grade Bluetooth Low Energy (BLE) SDK for iOS  
> Built for **speed, stability, and real-world device communication**

---

## 🚀 Why BlueForge?

Most BLE SDKs fail in real production:
- unstable connections  
- poor OTA handling  
- no visibility into performance  

**BlueForge solves that.**

✔ Reliable BLE pipeline  
✔ High-speed OTA engine  
✔ Real-time monitoring  
✔ Built-in logging system  
✔ License-controlled distribution  

---

## ✨ Core Features

### 🔗 BLE Core
- Scan, connect, disconnect
- Service discovery
- Read / Write / Notify
- Auto reconnect support

### 🚀 OTA Engine
- Secure firmware validation (SHA256)
- Streaming upload pipeline
- Retry & failure handling
- Progress tracking

### 📊 Performance Monitoring
- Throughput (KB/s)
- Packet rate
- Retry count
- Efficiency %
- Bottleneck detection

### 📜 Logging System
- Async log streaming
- File persistence
- Export logs

### 🔐 Licensing System
- Bundle-locked keys
- Tier-based access
- Runtime validation

---

## 📦 Installation

### Swift Package Manager

Add:

https://github.com/your-org/BlueForgeSDK

---

## 🔑 License Integration (MANDATORY)

```swift
let manager = BlueForgeManager(
    licenseKey: "YOUR_LICENSE_KEY",
    autoReconnect: true
)
```

If license is invalid:
- SDK will block all operations
- Error will be logged internally

---

## 📡 BLE Usage

### Scan

```swift
for await devices in manager.scan() {
    print(devices)
}
```

Stop:

```swift
manager.stopScan()
```

---

### Connect

```swift
let result = await manager.connect(deviceID)
```

---

### Disconnect

```swift
await manager.disconnect()
```

---

## 📦 GATT Operations

### Read

```swift
let result = await manager.read("FFF1")
```

### Write

```swift
await manager.write("FFF2", data: Data([0x01]))
```

### Notifications

```swift
for await value in manager.notifications("FFF3") {
    print(value)
}
```

---

## 🚀 OTA Firmware Update

```swift
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
        print(progress)

    case .completed:
        print("Done")

    case .failed(let error):
        print(error)

    default:
        break
    }
}
```

Cancel:

```swift
manager.cancelOTA()
```

---

## 📊 Monitoring

```swift
BlueForgeMonitor.shared.start()

BlueForgeMonitor.shared.onUpdate = { metrics in
    print(metrics.uploadKBps)
}
```

Export CSV:

```swift
let url = BlueForgeMonitor.shared.exportReportCSV()
```

---

## 📜 Logging

### Log

```swift
BlueForgeLogger.shared.log("Connected")
```

### Live Stream

```swift
for await log in BlueForgeLogger.shared.liveLogs {
    print(log)
}
```

### Export

```swift
let url = BlueForgeLogger.shared.exportLogs()
```

---

## 🧠 Architecture

- BlueForgeManager → Public SDK API  
- BlueForgeClient → BLE engine  
- BlueForgeOTAEngine → OTA pipeline  
- BlueForgeLogger → Logs  
- BlueForgeMonitor → Metrics  

---

## 🔐 License Tiers

| Tier        | Features |
|------------|--------|
| Basic      | Scan, Connect, Read/Write |
| Pro        | + Notifications + OTA |
| Enterprise | + OTA + Monitoring |

---

## 💰 Pricing

| Plan        | Price |
|------------|------|
| Basic      | $99 |
| Pro        | $999 |
| Enterprise | $4999 |

✔ One-time purchase  
✔ Optional yearly support  

---

## 📞 Get License Key

Email: gopalsorathiya@gmail.com  

Include:
- App name  
- Bundle ID  
- Tier (Basic / Pro / Enterprise)  

---

## ⚠️ Important

- License is required  
- Bundle ID locked  
- OTA only for Pro / Enterprise  
- Designed for production apps  

---

## 🏁 Summary

BlueForge is built for teams who need:

- Stable BLE communication  
- Reliable OTA updates  
- Real performance insights  

**No hacks. No instability. Just production-grade BLE.**
