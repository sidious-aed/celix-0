#include "../standard.h"

unsigned long main() {
	printf("sizeof(dev_t) | %lu\n", sizeof(dev_t));
	printf("sizeof(ino_t) | %lu\n", sizeof(ino_t));
	printf("sizeof(mode_t) | %lu\n", sizeof(mode_t));
	printf("sizeof(nlink_t) | %lu\n", sizeof(nlink_t));
	printf("sizeof(uid_t) | %lu\n", sizeof(uid_t));
	return 0;
}
