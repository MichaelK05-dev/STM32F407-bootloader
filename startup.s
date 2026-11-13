.syntax unified
.thumb

.section .vector_table, "a", %progbits

.word _stack_top
.word Reset_Handler
.word Default_Handler     @ NMI @ (See documentation about the vector table entries in the reference manual)
@ Rn every interrupt is defaulted to Default_Handler besides HardFault, I will implement some custom interrupt handlers in the future when necessary
.word HardFault_Handler   @ HardFault
.word Default_Handler     @ MemManage
.word Default_Handler     @ BusFault
.word Default_Handler     @ UsageFault
.word 0                   @ Reserved
.word 0                   @ Reserved
.word 0                   @ Reserved
.word 0                   @ Reserved
.word Default_Handler     @ SVCall
.word Default_Handler     @ Debug Monitor
.word 0                   @ Reserved
.word Default_Handler     @ PendSV
.word Default_Handler     @ SysTick
.word Default_Handler     @ IRQ 0  WWDG
.word Default_Handler     @ IRQ 1  PVD
.word Default_Handler     @ IRQ 2  TAMP_STAMP
.word Default_Handler     @ IRQ 3  RTC_WKUP
.word Default_Handler     @ IRQ 4  FLASH
.word Default_Handler     @ IRQ 5  RCC
.word Default_Handler     @ IRQ 6  EXTI0
.word Default_Handler     @ IRQ 7  EXTI1
.word Default_Handler     @ IRQ 8  EXTI2
.word Default_Handler     @ IRQ 9  EXTI3
.word Default_Handler     @ IRQ 10 EXTI4
.word Default_Handler     @ IRQ 11 DMA1_Stream0
.word Default_Handler     @ IRQ 12 DMA1_Stream1
.word Default_Handler     @ IRQ 13 DMA1_Stream2
.word Default_Handler     @ IRQ 14 DMA1_Stream3
.word Default_Handler     @ IRQ 15 DMA1_Stream4
.word Default_Handler     @ IRQ 16 DMA1_Stream5
.word Default_Handler     @ IRQ 17 DMA1_Stream6
.word Default_Handler     @ IRQ 18 ADC
.word Default_Handler     @ IRQ 19 CAN1_TX
.word Default_Handler     @ IRQ 20 CAN1_RX0
.word Default_Handler     @ IRQ 21 CAN1_RX1
.word Default_Handler     @ IRQ 22 CAN1_SCE
.word Default_Handler     @ IRQ 23 EXTI9_5
.word Default_Handler     @ IRQ 24 TIM1_BRK_TIM9
.word Default_Handler     @ IRQ 25 TIM1_UP_TIM10
.word Default_Handler     @ IRQ 26 TIM1_TRG_COM_TIM11
.word Default_Handler     @ IRQ 27 TIM1_CC
.word Default_Handler     @ IRQ 28 TIM2
.word Default_Handler     @ IRQ 29 TIM3
.word Default_Handler     @ IRQ 30 TIM4
.word Default_Handler     @ IRQ 31 I2C1_EV
.word Default_Handler     @ IRQ 32 I2C1_ER
.word Default_Handler     @ IRQ 33 I2C2_EV
.word Default_Handler     @ IRQ 34 I2C2_ER
.word Default_Handler     @ IRQ 35 SPI1
.word Default_Handler     @ IRQ 36 SPI2
.word Default_Handler     @ IRQ 37 USART1
.word Default_Handler     @ IRQ 38 USART2
.word Default_Handler     @ IRQ 39 USART3
.word Default_Handler     @ IRQ 40 EXTI15_10
.word Default_Handler     @ IRQ 41 RTC_Alarm
.word Default_Handler     @ IRQ 42 OTG_FS_WKUP
.word Default_Handler     @ IRQ 43 TIM8_BRK_TIM12
.word Default_Handler     @ IRQ 44 TIM8_UP_TIM13
.word Default_Handler     @ IRQ 45 TIM8_TRG_COM_TIM14
.word Default_Handler     @ IRQ 46 TIM8_CC
.word Default_Handler     @ IRQ 47 DMA1_Stream7
.word Default_Handler     @ IRQ 48 FSMC
.word Default_Handler     @ IRQ 49 SDIO
.word Default_Handler     @ IRQ 50 TIM5
.word Default_Handler     @ IRQ 51 SPI3
.word Default_Handler     @ IRQ 52 UART4
.word Default_Handler     @ IRQ 53 UART5
.word Default_Handler     @ IRQ 54 TIM6_DAC
.word Default_Handler     @ IRQ 55 TIM7
.word Default_Handler     @ IRQ 56 DMA2_Stream0
.word Default_Handler     @ IRQ 57 DMA2_Stream1
.word Default_Handler     @ IRQ 58 DMA2_Stream2
.word Default_Handler     @ IRQ 59 DMA2_Stream3
.word Default_Handler     @ IRQ 60 DMA2_Stream4
.word Default_Handler     @ IRQ 61 ETH
.word Default_Handler     @ IRQ 62 ETH_WKUP
.word Default_Handler     @ IRQ 63 CAN2_TX
.word Default_Handler     @ IRQ 64 CAN2_RX0
.word Default_Handler     @ IRQ 65 CAN2_RX1
.word Default_Handler     @ IRQ 66 CAN2_SCE
.word Default_Handler     @ IRQ 67 OTG_FS
.word Default_Handler     @ IRQ 68 DMA2_Stream5
.word Default_Handler     @ IRQ 69 DMA2_Stream6
.word Default_Handler     @ IRQ 70 DMA2_Stream7
.word Default_Handler     @ IRQ 71 USART6
.word Default_Handler     @ IRQ 72 I2C3_EV
.word Default_Handler     @ IRQ 73 I2C3_ER
.word Default_Handler     @ IRQ 74 OTG_HS_EP1_OUT
.word Default_Handler     @ IRQ 75 OTG_HS_EP1_IN
.word Default_Handler     @ IRQ 76 OTG_HS_WKUP
.word Default_Handler     @ IRQ 77 OTG_HS
.word Default_Handler     @ IRQ 78 DCMI
.word Default_Handler     @ IRQ 79 CRYP
.word Default_Handler     @ IRQ 80 HASH_RNG
.word Default_Handler     @ IRQ 81 FPU
