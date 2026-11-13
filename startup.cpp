#include <cstddef>
#include <cstdint>


extern int main();

// copies .data to RAM and initializes .bss
// vector_table is created directly in assembler in startup.s
extern "C" void Reset_Handler() {
  std::uint8_t _sdata;
  std::uint8_t _edata;
  std::uint8_t _s_initial_data;

  std::uint8_t *dataFlash = &_s_initial_data;
  std::uint8_t *dataRAM = &_sdata;
  size_t i = 0;
  size_t j = 0;
  while (dataRAM + i < &_edata) {
    dataRAM[i++] = dataFlash[j++];
  }
  main();

  while (true) {
  }
}