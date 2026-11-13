.syntax unified
.thumb

.section .vector_table, "a", %progbits
.word _stack_top
.word Reset_Handler
