import Cocoa

enum Device {
    
    case iPad13(displaySize: CGSize, isIpad: Bool)
    case iPad11(displaySize: CGSize, isIpad: Bool)
    case iPad12(displaySize: CGSize, isIpad: Bool)
    case iPhone16(displaySize: CGSize, isIpad: Bool)
    case iPhone15(displaySize: CGSize, isIpad: Bool)
    case iPhone14(displaySize: CGSize, isIpad: Bool)
    case iPhone13(displaySize: CGSize, isIpad: Bool)
    case iPhone12(displaySize: CGSize, isIpad: Bool)
    case iPhone11(displaySize: CGSize, isIpad: Bool)
    
}


extension Device: CustomStringConvertible {
    var description: String {
        switch self {
            case .iPad13(let displaySize, let isIpad): return "iPad 13: \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
            case .iPad11(let displaySize, let isIpad): return "iPad 11 \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
            case .iPad12(let displaySize, let isIpad): return "iPad 12 \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
            case .iPhone16(let displaySize, let isIpad): return "iPhone 16 \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
            case .iPhone15(let displaySize, let isIpad): return "iPhone 15 \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
            case .iPhone14(let displaySize, let isIpad): return "iPhone 14 \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
            case .iPhone13(let displaySize, let isIpad): return "iPhone 13 \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
            case .iPhone12(let displaySize, let isIpad): return "iPhone 12 \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
            case .iPhone11(let displaySize, let isIpad): return "iPhone 11 \(displaySize.width)x\(displaySize.height), isIpad - \(isIpad)"
        }
    }
}

let iPhone16 = Device.iPhone16(displaySize: CGSize(width: 1179, height: 2556), isIpad: false)
let iPhone16Pro = Device.iPhone16(displaySize: CGSize(width: 1206, height: 2622), isIpad: false)
let iPhone16ProMax = Device.iPhone16(displaySize: CGSize(width: 1320, height: 2868), isIpad: false)

let iPad13 = Device.iPad13(displaySize: CGSize(width: 2752, height: 2064), isIpad: true)
let iPad12 = Device.iPad12(displaySize: CGSize(width: 2732, height: 2048), isIpad: true)
let iPad11 = Device.iPad11(displaySize: CGSize(width: 2388, height: 1668), isIpad: true)

print(iPhone16)
print(iPhone16Pro)
print(iPhone16ProMax)
print(iPad11)
print(iPad12)
print(iPad13)

