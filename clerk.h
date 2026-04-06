#ifndef clerklevel3
#define clerklevel3

// es always meant.
#include "./standard.h"
static const source clerk_syscall_code_entrees[107] = {"Success", "Operation not permitted", "No such file or directory", "No such process", "Interrupted system call", "Input/output error", "No such device or address", "Argument list too long", "Exec format error", "Bad file descriptor", "No child processes", "Cannot allocate memory", "Permission denied", "Bad address", "Block device required", "Device or resource busy", "File exists", "Invalid cross-device link", "No such device", "Not a directory", "Is a directory", "Invalid argument", "Too many open files in system", "Too many open files", "Text file busy", "File too large", "No space left on device", "Illegal seek", "Read-only file system", "Too many links", "Broken pipe", "Numerical result out of range", "Resource deadlock avoided", "File name too long", "No locks available", "Function not implemented", "Directory not empty", "No message of desired type", "Identifier removed", "Channel number out of range", "Level 2 not synchronized", "Level 3 halted", "Level 3 reset", "Link number out of range", "Protocol driver not attached", "No CSI structure available", "Level 2 halted", "Invalid exchange", "Invalid request descriptor", "Exchange full", "No anode", "Invalid request code", "Invalid slot", "Bad font file format", "Device not a stream", "No data available", "Timer expired", "Out of streams resources", "Machine is not on the network", "Package not installed", "Object is remote", "Link has been severed", "Advertise error", "Srmount error", "Communication error on send", "Protocol error", "Multihop attempted", "RFS specific error", "Bad message", "Name not unique on network", "File descriptor in bad state", "Remote address changed", "Streams pipe error", "Too many users", "Destination address required", "Message too long", "Protocol not available", "Protocol not supported", "Socket type not supported", "Operation not supported", "Protocol family not supported", "Address already in use", "Network is down", "Network is unreachable", "Connection reset by peer", "No buffer space available", "Connection timed out", "Connection refused", "Host is down", "No route to host", "Operation already in progress", "Operation now in progress", "Stale file handle", "Structure needs cleaning", "Not a XENIX named type file", "No XENIX semaphores available", "Is a named type file", "Remote I/O error", "Disk quota exceeded", "No medium found", "Wrong medium type", "Operation canceled", "Required key not available", "Key has expired", "Key has been revoked", "Key was rejected by service", "Owner died"};
static const quadrant clerk_syscall_code_entrees_naof_secs[107] = {7, 23, 25, 15, 23, 18, 25, 22, 17, 19, 18, 22, 17, 11, 21, 23, 11, 25, 14, 15, 14, 16, 29, 19, 14, 14, 23, 12, 21, 14, 11, 29, 25, 18, 18, 24, 19, 26, 18, 27, 24, 14, 13, 24, 28, 26, 14, 16, 26, 13, 8, 20, 12, 20, 19, 17, 13, 24, 29, 21, 16, 21, 15, 13, 27, 14, 18, 18, 11, 26, 28, 22, 18, 14, 28, 16, 22, 22, 25, 23, 29, 22, 15, 22, 24, 25, 20, 18, 12, 16, 29, 25, 17, 24, 27, 29, 20, 16, 19, 15, 17, 18, 26, 15, 20, 27, 10};
#define naof_clerk_space_secs 0x10000

#define print_clerk_code_entree(code) { \
	syscall(unix_write, 1, clerk_syscall_code_entrees[code], clerk_syscall_code_entrees_naof_secs[code]); \
}

#define naof_chart_elements(index) (index[2] - 1)
#define chart_index_at(index, site) ((index + 3) + ((site + 1) * 2))

#define naof_clerk_header_secs 0x18
#define clerk_header_naof_secs_site 0
#define clerk_header_space_site 1
#define clerk_header_space_site_site 2

#endif
