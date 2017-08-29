#define FRAM_FIRST_BUNDLE_SEG (FRAM_END+1 - (2*(TOPOFSTACK+1 - STARTOFDATA)))
#define FRAM_SECOND_BUNDLE_SEG (FRAM_FIRST_BUNDLE_SEG + (TOPOFSTACK+1 - STARTOFDATA) - 1)

void __mementos_checkpoint (void);
void __mementos_restore (unsigned int);
unsigned int __mementos_locate_next_bundle (void);
unsigned int __mementos_find_active_bundle (void);
void __mementos_fram_clear(unsigned long);
unsigned int __mementos_bundle_in_range (unsigned int);
void __mementos_atboot_cleanup (void);
void __mementos_inactive_cleanup (unsigned int active_bundle_addr);

#define REGISTER_BYTES (sizeof(unsigned)) // bytes in a register
#define BUNDLE_SIZE_REGISTERS 30// (15 * REGISTER_BYTES)
