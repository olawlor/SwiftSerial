import Foundation

public enum DataBitsSize {
	case bits5
	case bits6
	case bits7
	case bits8
	
	#if os(Windows)
    // Windows DCB.ByteSize is a BYTE (UInt8)
    var flagValue: UInt8 {
        switch self {
        case .bits5: return 5
        case .bits6: return 6
        case .bits7: return 7
        case .bits8: return 8
        }
    }
    #else
	// UNIX platforms use the termio tcflag_t
	var flagValue: tcflag_t {
		switch self {
		case .bits5:
			return tcflag_t(CS5)
		case .bits6:
			return tcflag_t(CS6)
		case .bits7:
			return tcflag_t(CS7)
		case .bits8:
			return tcflag_t(CS8)
		}
	}
	#endif
}
