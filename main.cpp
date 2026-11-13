#include <cstdint>

constexpr std::uintptr_t RCC_BASE = 0x40023800;
constexpr std::uintptr_t RCC_UART2_CLK_EN = RCC_BASE + 0x40;
constexpr std::uintptr_t RCC_GPIOA_CLK_EN = RCC_BASE + 0x30;
constexpr std::uintptr_t GPIO_MODER = 0x40020000;
constexpr std::uintptr_t GPIO_MODERA = GPIO_MODER + 0x0;
constexpr std::uintptr_t GPIOA_ODR = GPIO_MODER + 0x14;
struct GpioRegisters {
  std::uint32_t MODER;
  std::uint32_t OTYPER;
  std::uint32_t OSPEEDR;
  std::uint32_t PUPDR;
  std::uint32_t IDR;
  std::uint32_t ODR;
};

void setOutput(volatile GpioRegisters *gpio, int pin) {
  // Set generic output type
  gpio->MODER &= ~(0b11u << (2 * pin)); // set MODER to 00
  gpio->MODER |= (1u << (2 * pin));     // set MODER to 01
}

void setHigh(volatile GpioRegisters *gpio, int pin) {
  gpio->ODR |= (1u << pin);
}
void setLow(volatile GpioRegisters *gpio, int pin) {
  gpio->ODR &= ~(1u << pin);
}

// just an example implementation to be able to verify a successful boot, will be replaced later
int main() {

  auto GPIO_pointer = reinterpret_cast<volatile GpioRegisters *>(GPIO_MODER);

  // Enable RCC Clock for GPIOA
  std::uintptr_t RCC_PIN_CLK_EN = RCC_GPIOA_CLK_EN;
  auto clk_en = reinterpret_cast<volatile std::uint32_t *>(RCC_PIN_CLK_EN);
  *clk_en |= (1u);
  setOutput(GPIO_pointer, 0);
  setHigh(GPIO_pointer, 0);

  while (true) {
  }
}