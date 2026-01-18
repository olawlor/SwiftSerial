import Foundation

public enum ParityType {
	case none
	case even
	case odd
	
	#if os(Windows)
    // Windows DCB.ByteSize is a BYTE (UInt8)
    var parityValue: UInt8 {
        switch self {
        case .none: return 0 // NOPARITY
        case .odd:  return 1 // ODDPARITY
        case .even: return 2 // EVENPARITY
        }
    }
    #else
	// UNIX platforms use the termio tcflag_t
	var parityValue: tcflag_t {
		switch self {
		case .none:
			return 0
		case .even:
			return tcflag_t(PARENB)
		case .odd:
			return tcflag_t(PARENB | PARODD)
		}
	}
	#endif
}
