# 📦 Novyble iOS BLE SDK

> Production-grade Bluetooth Low Energy (BLE) SDK for iOS  
> Built for **speed, stability, and real-world device communication**

---

## 🚀 Why Novyble?

Most BLE SDKs fail in real production:
- unstable connections  
- poor OTA handling  
- no visibility into performance  

**Novyble solves that.**

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

https://github.com/your-org/NovybleSDK

---

## 🔑 License Integration (MANDATORY)

```swift
let manager = NovybleManager(
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

# 🚀 OTA Firmware Update

```swift
let stream = manager.startOTA(
    firmwareURL: firmwareURL,
    checksum: "SHA256_CHECKSUM",
    configuration: NovybleOTAConfiguration(
        writeCharacteristicUUID: "FFF1",
        notifyCharacteristicUUID: "FFF2",
        resumeCharacteristicUUID: "FFF3",
        controlCharacteristicUUID: "FFF4"
    )
)
```

---

# 🧠 OTA PROTOCOL (FULL)

## Flow

1. Resume check (device returns last seq)
2. Flush (reset state)
3. Start (total packets + checksum)
4. Streaming packets
5. ACK every 16 packets
6. Resume if interrupted
7. Final SHA256 verification

---

## Packet Structure

[SEQ (2)] + [PAYLOAD] + [CRC16 (2)]

---

## Validation Layers

- CRC16 → packet safety  
- Sequence → order guarantee  
- SHA256 → full firmware integrity  

---

## Error Handling

- CRC mismatch → resend  
- Sequence mismatch → correction  
- Disconnect → resume  

---

## Performance

- 40–80 KB/s
- Stable under packet loss
- Optimized BLE throughput

---

# 🧠 Architecture

- NovybleManager → Public API  
- BLE Engine → Core layer  
- OTA Engine → Transfer pipeline  
- Logger → Logging system  
- Monitor → Metrics system  

---

## 📊 Monitoring

```swift
NovybleMonitor.shared.start()

NovybleMonitor.shared.onUpdate = { metrics in
    print(metrics.uploadKBps)
}
```

Export CSV:

```swift
let url = NovybleMonitor.shared.exportReportCSV()
```

---

## 📜 Logging

### Log

```swift
NovybleLogger.shared.log("Connected")
```

### Live Stream

```swift
for await log in NovybleLogger.shared.liveLogs {
    print(log)
}
```

### Export

```swift
let url = NovybleLogger.shared.exportLogs()
```

---

## 🧠 Architecture

- NovybleManager → Public SDK API  
- NovybleClient → BLE engine  
- NovybleOTAEngine → OTA pipeline  
- NovybleLogger → Logs  
- NovybleMonitor → Metrics  

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

Novyble is built for teams who need:

- Stable BLE communication  
- Reliable OTA updates  
- Real performance insights  

**No hacks. No instability. Just production-grade BLE.**
