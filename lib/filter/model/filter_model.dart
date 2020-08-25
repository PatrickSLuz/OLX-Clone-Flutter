enum OrderBy { DATE, PRICE }

// bit flag
const VENDOR_TYPE_PARTICULAR = 1 << 0; // 0001
const VENDOR_TYPE_PROFESSIONAL = 1 << 1; // 0010

// VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL = 0011