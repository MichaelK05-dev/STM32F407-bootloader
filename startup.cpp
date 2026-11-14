#include <cstddef>
#include <cstdint>

extern int main();
std::uintptr_t application_start = 0x08010000;
std::uintptr_t vtor_address = 0xE000ED08;
extern "C" {
extern std::uint32_t _stack_top;
extern std::uint8_t _sdata;
extern std::uint8_t _edata;
extern std::uint8_t _s_initial_data;
extern std::uint8_t _sbss;
extern std::uint8_t _ebss;
}

// Set msp directly in Assember as its a cpu register
// jump to reset handler directly as well, because the function cant return
// safely after changing the stack pointer
__attribute__((naked, noreturn)) void
StartApplication(std::uint32_t app_msp, std::uint32_t app_reset_handler) {
  asm volatile("msr msp, r0\n"
               "bx r1");
}

void JumpToApplication() {

  volatile std::uint32_t *vtor =
      reinterpret_cast<volatile std::uint32_t *>(vtor_address);
  *vtor = application_start;
  std::uint32_t app_msp =
      *reinterpret_cast<volatile std::uint32_t *>(application_start);

  std::uint32_t reset_handler_address =
      *reinterpret_cast<volatile std::uint32_t *>(application_start + 4);

  StartApplication(app_msp, reset_handler_address);
  // void (* volatile App_Reset_Handler)() = reinterpret_cast<void
  // (*)()>(reset_handler_address); App_Reset_Handler();
}

// copies .data to RAM and initializes .bss
// vector_table is created directly in assembler in startup.s
extern "C" void Reset_Handler() {
  std::uint8_t *dataFlash = &_s_initial_data;
  std::uint8_t *dataRAM = &_sdata;
  size_t i = 0;
  size_t j = 0;
  while (dataRAM + i < &_edata) {
    dataRAM[i++] = dataFlash[j++];
  }
  dataRAM = &_sbss;
  i = 0;
  while (dataRAM + i < &_ebss) { // initialize .bss section in RAM
    dataRAM[i++] = 0;
  }
  JumpToApplication();
  main();

  while (true) {
  }
}

extern "C" void Default_Handler() {
  while (true) {
    asm volatile("nop");
  }
}

extern "C" void HardFault_Handler() {
  while (true) {
    asm volatile("nop");
  }
}