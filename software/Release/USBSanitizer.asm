.DATA

.WEAK	"%eax"
.WEAK	"%ebx"
.WEAK	"%ecx"
.WEAK	"%r0"
.WEAK	"%r1"
.WEAK	"%r2"
.WEAK	"%r3"
hUSBHOSTGENERIC	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "hUSBHOSTGENERIC"
hUSBHOST_1	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "hUSBHOST_1"
tcbFIRMWARE	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "tcbFIRMWARE"
hGPIO_PORT_A	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "hGPIO_PORT_A"
Str@0	.ASCIIZ	"Application"
.WEAK	"hostGenericCtx"




.TEXT


.WEAK	"vos_dma_get_fifo_flow_control"

.WEAK	"vos_start_scheduler"

.WEAK	"vos_gpio_write_port"

.WEAK	"vos_signal_semaphore_from_isr"

.WEAK	"vos_malloc"

.WEAK	"vos_create_thread_ex"

.WEAK	"vos_memcpy"

.WEAK	"vos_memset"

.WEAK	"vos_get_kernel_clock"

.WEAK	"vos_gpio_disable_int"

.WEAK	"vos_get_package_type"

.WEAK	"vos_dma_get_fifo_data_register"

.WEAK	"usbhostGeneric_write"

.WEAK	"vos_signal_semaphore"

.WEAK	"vos_gpio_wait_on_int"

.WEAK	"vos_dma_get_fifo_data"

.WEAK	"vos_iocell_get_config"

.WEAK	"vos_iomux_define_bidi"

.WEAK	"vos_gpio_set_all_mode"

.WEAK	"vos_iocell_set_config"

.WEAK	"vos_gpio_set_pin_mode"

.WEAK	"iomux_setup"

.WEAK	"vos_get_chip_revision"

.WEAK	"vos_wait_semaphore_ex"

.WEAK	"vos_enable_interrupts"

.WEAK	"vos_dev_read"

.WEAK	"vos_dev_open"

.WEAK	"vos_halt_cpu"

.WEAK	"vos_dev_init"

.WEAK	"vos_dma_get_fifo_count"

.WEAK	"usbhost_init"

.WEAK	"vos_reset_kernel_clock"

.WEAK	"vos_gpio_set_port_mode"

.WEAK	"vos_iomux_define_input"

.WEAK	"vos_disable_interrupts"

.WEAK	"vos_get_idle_thread_tcb"

.WEAK	"vos_dma_reset"

.WEAK	"vos_dev_close"

.WEAK	"vos_wdt_clear"

.WEAK	"vos_heap_size"

.WEAK	"vos_dev_ioctl"

.WEAK	"vos_dev_write"

.WEAK	"vos_get_clock_frequency"

.WEAK	"vos_set_clock_frequency"

.WEAK	"vos_dma_enable"

.WEAK	"vos_reset_vnc2"

.WEAK	"vos_heap_space"

.WEAK	"vos_iomux_define_output"

.WEAK	"vos_wdt_enable"

.WEAK	"vos_dma_wait_on_complete"

.WEAK	"vos_lock_mutex"

.WEAK	"vos_power_down"

.WEAK	"vos_init_mutex"

.WEAK	"vos_gpio_wait_on_any_int"

.WEAK	"vos_get_priority_ceiling"

.WEAK	"vos_dma_disable"

.WEAK	"vos_set_priority_ceiling"

.WEAK	"vos_dma_release"

.WEAK	"vos_iomux_disable_output"

.WEAK	"vos_dma_acquire"

.WEAK	"vos_delay_msecs"

.WEAK	"vos_stack_usage"

.WEAK	"vos_get_profile"

.WEAK	"vos_gpio_wait_on_all_ints"

.WEAK	"memset"

.WEAK	"memcpy"

.WEAK	"vos_delay_cancel"

.WEAK	"strcat"

.WEAK	"strlen"

.WEAK	"strcmp"

.WEAK	"strcpy"

.WEAK	"vos_dma_retained_configure"

.WEAK	"vos_unlock_mutex"

.WEAK	"vos_gpio_read_all"

.WEAK	"vos_create_thread"

.WEAK	"strncmp"

.WEAK	"vos_gpio_read_pin"

.WEAK	"vos_dma_configure"

.WEAK	"strncpy"

.WEAK	"vos_init_cond_var"

.WEAK	"vos_wait_cond_var"

.WEAK	"vos_stop_profiler"

.WEAK	"vos_trylock_mutex"

.WEAK	"vos_free"

.WEAK	"vos_init"

.WEAK	"vos_gpio_read_port"

.WEAK	"vos_gpio_write_all"

.WEAK	"vos_set_idle_thread_tcb_size"

.WEAK	"vos_init_semaphore"

.WEAK	"vos_wait_semaphore"

.WEAK	"vos_gpio_write_pin"

.WEAK	"vos_start_profiler"

.WEAK	"usbhostGeneric_read"

.WEAK	"gpio_init"

.WEAK	"vos_gpio_enable_int"

.WEAK	"usbhostGeneric_init"

.WEAK	"vos_signal_cond_var"

main:	
.GLOBAL	 DO_NOT_EXPORT  "main"

.FUNCTION	"main"	
PUSH32	%r0
PUSH32	%r1
SP_DEC	$10
PUSH8	$3
PUSH16	$1
PUSH8	$50
CALL	vos_init
SP_INC	$4
PUSH8	$0
CALL	vos_set_clock_frequency
SP_INC	$1
PUSH16	$512
CALL	vos_set_idle_thread_tcb_size
SP_INC	$2
CALL	iomux_setup
SP_STORE	%r0
CPY16	%r1	%r0
LD8	(%r1)	$0
PUSH16	%r0
PUSH8	$1
SP_DEC	$1
CALL	gpio_init
POP8	%eax
SP_WR8	%eax	$4
SP_INC	$3
SP_STORE	%r0
INC16	%r0	$2
CPY16	%r1	%r0
LD8	(%r1)	$8
LD16	%r1	$1
ADD16	%r1	%r0
LD8	(%r1)	$16
LD16	%r1	$2
ADD16	%r1	%r0
LD8	(%r1)	$2
LD16	%r1	$3
ADD16	%r1	%r0
LD8	(%r1)	$2
PUSH16	%r0
PUSH8	$-1
PUSH8	$0
SP_DEC	$1
CALL	usbhost_init
POP8	%eax
SP_WR8	%eax	$10
SP_INC	$4
PUSH8	$2
SP_DEC	$1
CALL	usbhostGeneric_init
POP8	%eax
SP_WR8	%eax	$8
SP_INC	$1
LD32	%r0	$firmware
LD32	%r1	$Str@0
PUSH16	$0
PUSH16	%r1
PUSH32	%r0
PUSH16	$4096
PUSH8	$20
SP_DEC	$2
CALL	vos_create_thread_ex
POP16	%eax
SP_WR16	%eax	$19
SP_INC	$11
SP_RD16	tcbFIRMWARE	$8
CALL	vos_start_scheduler
@fl1main_loop:	
JUMP	@fl1main_loop
SP_INC	$10
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"main"

usbhost_connect_state:	
.GLOBAL	 DO_NOT_EXPORT  "usbhost_connect_state"

.FUNCTION	"usbhost_connect_state"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$13
SP_RD16	%r0	$33
LD8	%ecx	$0
SP_WR8	%ecx	$0
CMP16	%r0	$0
JZ	@IC1
@IC2:	
SP_STORE	%r1
INC16	%r1	$1
CPY16	%r2	%r1
LD8	(%r2)	$16
LD16	%r2	$6
ADD16	%r2	%r1
SP_STORE	%r3
CPY16	(%r2)	%r3
PUSH16	%r1
PUSH16	%r0
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$15
SP_INC	$4
SP_STORE	%ecx
CMP8	(%ecx)	$1
JNZ	@IC3
@IC4:	
SP_STORE	%r1
INC16	%r1	$1
PUSH16	%r1
PUSH16	%r0
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$16
SP_INC	$4
@IC3:	
@IC1:	
SP_RD8	%eax	$0
SP_WR8	%eax	$32
SP_INC	$13
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhost_connect_state"

open_drivers:	
.GLOBAL	 DO_NOT_EXPORT  "open_drivers"

.FUNCTION	"open_drivers"	
SP_DEC	$6
PUSH8	$0
SP_DEC	$2
CALL	vos_dev_open
POP16	%eax
SP_WR16	%eax	$1
SP_INC	$1
SP_RD16	hUSBHOST_1	$0
PUSH8	$1
SP_DEC	$2
CALL	vos_dev_open
POP16	%eax
SP_WR16	%eax	$3
SP_INC	$1
SP_RD16	hGPIO_PORT_A	$2
PUSH8	$2
SP_DEC	$2
CALL	vos_dev_open
POP16	%eax
SP_WR16	%eax	$5
SP_INC	$1
SP_RD16	hUSBHOSTGENERIC	$4
SP_INC	$6
RTS	
.FUNC_END	"open_drivers"

attach_drivers:	
.GLOBAL	 DO_NOT_EXPORT  "attach_drivers"

.FUNCTION	"attach_drivers"	
RTS	
.FUNC_END	"attach_drivers"

close_drivers:	
.GLOBAL	 DO_NOT_EXPORT  "close_drivers"

.FUNCTION	"close_drivers"	
PUSH16	hUSBHOST_1
CALL	vos_dev_close
SP_INC	$2
PUSH16	hGPIO_PORT_A
CALL	vos_dev_close
SP_INC	$2
PUSH16	hUSBHOSTGENERIC
CALL	vos_dev_close
SP_INC	$2
RTS	
.FUNC_END	"close_drivers"

writeString:	
.GLOBAL	 DO_NOT_EXPORT  "writeString"

.FUNCTION	"writeString"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_DEC	$3
SP_RD16	%r2	$18
SP_RD16	%r0	$20
CPY16	%r1	%r0
PUSH16	%r0
SP_DEC	$2
CALL	strlen
POP16	%eax
SP_WR16	%eax	$2
SP_INC	$2
PUSH16	$0
SP_RD16	%eax	$2
PUSH16	%eax
PUSH16	%r1
PUSH16	%r2
SP_DEC	$1
CALL	vos_dev_write
POP8	%eax
SP_WR8	%eax	$10
SP_INC	$8
SP_INC	$3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"writeString"

writeShort:	
.GLOBAL	 DO_NOT_EXPORT  "writeShort"

.FUNCTION	"writeShort"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$6
SP_RD16	%ecx	$25
SP_RD16	%ecx	$27
SP_RD16	%eax	$27
AND32	%eax	$65535
LD32	%ebx	$12
SHR32	%r1	%eax	%ebx
CPY8	%r1	%r1
CPY8	%eax	%r1
AND32	%eax	$255
LD32	%r2	$15
AND32	%r2	%eax
CPY8	%r1	%r2
CMP8	%r1	$9
JLE	@IC8
@IC9:	
SP_STORE	%r2
CPY8	%ebx	%r1
AND16	%ebx	$255
LD32	%eax	$55
ADD32	%r3	%eax	%ebx
CPY8	(%r2)	%r3
JUMP	@IC7
@IC8:	
SP_STORE	%r2
CPY8	%ebx	%r1
AND16	%ebx	$255
LD32	%eax	$48
ADD32	%r3	%eax	%ebx
CPY8	(%r2)	%r3
@IC7:	
SP_RD16	%eax	$27
AND32	%eax	$65535
LD32	%ebx	$8
SHR32	%r0	%eax	%ebx
CPY8	%r0	%r0
CPY8	%eax	%r0
AND32	%eax	$255
LD32	%r2	$15
AND32	%r2	%eax
CPY8	%r0	%r2
CMP8	%r0	$9
JLE	@IC13
@IC14:	
SP_STORE	%r1
INC16	%r1	$1
CPY8	%ebx	%r0
AND16	%ebx	$255
LD32	%eax	$55
ADD32	%r2	%eax	%ebx
CPY8	(%r1)	%r2
JUMP	@IC12
@IC13:	
SP_STORE	%r1
INC16	%r1	$1
CPY8	%ebx	%r0
AND16	%ebx	$255
LD32	%eax	$48
ADD32	%r2	%eax	%ebx
CPY8	(%r1)	%r2
@IC12:	
SP_RD16	%eax	$27
AND32	%eax	$65535
LD32	%ebx	$4
SHR32	%r1	%eax	%ebx
SP_STORE	%ecx
INC16	%ecx	$4
CPY8	(%ecx)	%r1
SP_RD8	%eax	$4
AND32	%eax	$255
LD32	%r1	$15
AND32	%r1	%eax
SP_STORE	%ecx
INC16	%ecx	$4
CPY8	(%ecx)	%r1
SP_STORE	%ecx
INC16	%ecx	$4
CMP8	(%ecx)	$9
JLE	@IC18
@IC19:	
SP_STORE	%r0
INC16	%r0	$0
INC16	%r0	$2
SP_RD8	%ebx	$4
AND32	%ebx	$255
LD32	%eax	$55
ADD32	%r1	%eax	%ebx
CPY8	(%r0)	%r1
JUMP	@IC17
@IC18:	
SP_STORE	%r0
INC16	%r0	$0
INC16	%r0	$2
SP_RD8	%ebx	$4
AND32	%ebx	$255
LD32	%eax	$48
ADD32	%r1	%eax	%ebx
CPY8	(%r0)	%r1
@IC17:	
SP_RD16	%eax	$27
AND32	%eax	$65535
LD32	%r0	$15
AND32	%r0	%eax
SP_STORE	%ecx
INC16	%ecx	$4
CPY8	(%ecx)	%r0
SP_STORE	%ecx
INC16	%ecx	$4
CMP8	(%ecx)	$9
JLE	@IC23
@IC24:	
SP_STORE	%r0
INC16	%r0	$0
INC16	%r0	$3
SP_RD8	%ebx	$4
AND32	%ebx	$255
LD32	%eax	$55
ADD32	%r1	%eax	%ebx
CPY8	(%r0)	%r1
JUMP	@IC22
@IC23:	
SP_STORE	%r0
INC16	%r0	$0
INC16	%r0	$3
SP_RD8	%ebx	$4
AND32	%ebx	$255
LD32	%eax	$48
ADD32	%r1	%eax	%ebx
CPY8	(%r0)	%r1
@IC22:	
SP_STORE	%r0
INC16	%r0	$0
PUSH16	$0
PUSH16	$4
PUSH16	%r0
SP_RD16	%eax	$31
PUSH16	%eax
SP_DEC	$1
CALL	vos_dev_write
POP8	%eax
SP_WR8	%eax	$13
SP_INC	$8
SP_INC	$6
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"writeShort"

send_cbw:	
.GLOBAL	 DO_NOT_EXPORT  "send_cbw"

.FUNCTION	"send_cbw"	
PUSH32	%r0
PUSH32	%r1
SP_DEC	$3
SP_RD16	%r0	$16
LD16	%ecx	$0
SP_WR16	%ecx	$0
CPY16	%r0	%r0
SP_STORE	%r1
INC16	%r1	$0
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH16	$31
PUSH16	%r0
SP_DEC	$1
CALL	usbhostGeneric_write
POP8	%eax
SP_WR8	%eax	$10
SP_INC	$8
SP_STORE	%eax
SP_STORE	%ecx
INC16	%ecx	$14
CPY16	(%ecx)	(%eax)
SP_INC	$3
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"send_cbw"

receive_data:	
.GLOBAL	 DO_NOT_EXPORT  "receive_data"

.FUNCTION	"receive_data"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_DEC	$3
SP_RD16	%r2	$20
SP_RD16	%r1	$22
SP_STORE	%r0
INC16	%r0	$0
PUSH16	hostGenericCtx
PUSH16	%r0
PUSH16	%r1
PUSH16	%r2
SP_DEC	$1
CALL	usbhostGeneric_read
POP8	%eax
SP_WR8	%eax	$10
SP_INC	$8
SP_STORE	%eax
SP_STORE	%ecx
INC16	%ecx	$18
CPY16	(%ecx)	(%eax)
SP_INC	$3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"receive_data"

receive_csw:	
.GLOBAL	 DO_NOT_EXPORT  "receive_csw"

.FUNCTION	"receive_csw"	
PUSH32	%r0
PUSH32	%r1
SP_DEC	$3
SP_RD16	%r0	$16
CPY16	%r0	%r0
SP_STORE	%r1
INC16	%r1	$0
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH16	$13
PUSH16	%r0
SP_DEC	$1
CALL	usbhostGeneric_read
POP8	%eax
SP_WR8	%eax	$10
SP_INC	$8
SP_STORE	%eax
SP_STORE	%ecx
INC16	%ecx	$14
CPY16	(%ecx)	(%eax)
SP_INC	$3
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"receive_csw"

erase_block:	
.GLOBAL	 DO_NOT_EXPORT  "erase_block"

.FUNCTION	"erase_block"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$255
SP_DEC	$255
SP_DEC	$63
SP_STORE	%ecx
ADD16	%ecx	$592
SP_STORE	%eax
ADD16	%eax	$592
CPY32	(%ecx)	(%eax)
LD16	%ecx	$0
SP_WR16	%ecx	$0
LD16	%ecx	$0
SP_WR16	%ecx	$2
PUSH16	$31
PUSH32	$0
SP_STORE	%eax
INC16	%eax	$10
SP_STORE	%ecx
INC16	%ecx	$2
CPYMEM	(%ecx)	(%eax)	$2
SP_DEC	$2
SP_DEC	$2
CALL	memset
POP16	%eax
SP_WR16	%eax	$43
SP_INC	$8
SP_STORE	%r0
INC16	%r0	$4
LD16	%r1	$15
ADD16	%r1	%r0
PUSH16	$16
PUSH32	$0
PUSH16	%r1
SP_DEC	$2
CALL	memset
POP16	%eax
SP_WR16	%eax	$45
SP_INC	$8
SP_STORE	%ecx
ADD16	%ecx	$551
SP_STORE	%eax
ADD16	%eax	$39
CPY16	(%ecx)	%eax
PUSH16	$512
PUSH32	$65
SP_STORE	%eax
ADD16	%eax	$557
PUSH16	(%eax)
SP_DEC	$2
CALL	memset
SP_STORE	%eax
ADD16	%eax	$563
POP16	(%eax)
SP_INC	$8
CPY16	%r2	%r0
INC16	%r2	$0
LD8	(%r2)	$85
CPY16	%r2	%r0
INC16	%r2	$1
LD8	(%r2)	$83
CPY16	%r2	%r0
INC16	%r2	$2
LD8	(%r2)	$66
CPY16	%r2	%r0
INC16	%r2	$3
LD8	(%r2)	$83
LD16	%r2	$4
ADD16	%r2	%r0
LD32	(%r2)	$0
LD16	%r2	$8
ADD16	%r2	%r0
LD32	(%r2)	$256
LD16	%r2	$12
ADD16	%r2	%r0
LD8	(%r2)	$0
LD16	%r2	$13
ADD16	%r2	%r0
CPY8	%r3	(%r2)
AND8	%r3	$240
LD8	%eax	$0
OR8	%r3	%eax
CPY8	(%r2)	%r3
CPY8	%r3	(%r2)
AND8	%r3	$15
LD8	%eax	$0
OR8	%r3	%eax
CPY8	(%r2)	%r3
LD16	%r2	$14
ADD16	%r2	%r0
CPY8	%r3	(%r2)
AND8	%r3	$248
LD8	%eax	$0
OR8	%r3	%eax
CPY8	(%r2)	%r3
CPY8	%r3	(%r2)
AND8	%r3	$7
LD8	%eax	$80
OR8	%r3	%eax
CPY8	(%r2)	%r3
CPY16	%r2	%r1
LD8	(%r2)	$42
CPY16	%r2	%r1
INC16	%r2	$4
SP_STORE	%eax
ADD16	%eax	$592
CPY8	(%r2)	(%eax)
CPY16	%r1	%r1
INC16	%r1	$8
LD8	(%r1)	$1
CPY16	%r0	%r0
SP_STORE	%r1
ADD16	%r1	$0
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH16	$31
PUSH16	%r0
SP_DEC	$1
CALL	usbhostGeneric_write
SP_STORE	%eax
ADD16	%eax	$564
POP8	(%eax)
SP_INC	$8
SP_STORE	%eax
ADD16	%eax	$551
CPY16	%r0	(%eax)
SP_STORE	%r1
ADD16	%r1	$2
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH16	$512
PUSH16	%r0
SP_DEC	$1
CALL	usbhostGeneric_write
SP_STORE	%eax
ADD16	%eax	$565
POP8	(%eax)
SP_INC	$8
SP_STORE	%eax
ADD16	%eax	$557
CPY16	%r0	(%eax)
SP_STORE	%r1
ADD16	%r1	$570
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH16	$13
PUSH16	%r0
SP_DEC	$1
CALL	usbhostGeneric_read
SP_STORE	%eax
ADD16	%eax	$581
POP8	(%eax)
SP_INC	$8
SP_INC	$255
SP_INC	$255
SP_INC	$63
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"erase_block"

get_read_capacity:	
.GLOBAL	 DO_NOT_EXPORT  "get_read_capacity"

.FUNCTION	"get_read_capacity"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$73
LD32	%ecx	$0
SP_WR32	%ecx	$0
LD16	%ecx	$0
SP_WR16	%ecx	$4
PUSH16	$31
PUSH32	$0
SP_STORE	%eax
INC16	%eax	$12
SP_STORE	%ecx
INC16	%ecx	$2
CPYMEM	(%ecx)	(%eax)	$2
SP_DEC	$2
SP_DEC	$2
CALL	memset
POP16	%eax
SP_WR16	%eax	$45
SP_INC	$8
SP_STORE	%r0
INC16	%r0	$6
LD16	%r1	$15
ADD16	%r1	%r0
PUSH16	$16
PUSH32	$0
PUSH16	%r1
SP_DEC	$2
CALL	memset
POP16	%eax
SP_WR16	%eax	$47
SP_INC	$8
SP_STORE	%ecx
INC16	%ecx	$49
SP_STORE	%eax
INC16	%eax	$41
CPY16	(%ecx)	%eax
PUSH16	$8
PUSH32	$0
SP_RD16	%eax	$55
PUSH16	%eax
SP_DEC	$2
CALL	memset
POP16	%eax
SP_WR16	%eax	$59
SP_INC	$8
CPY16	%r2	%r0
LD8	(%r2)	$85
CPY16	%r2	%r0
INC16	%r2	$1
LD8	(%r2)	$83
CPY16	%r2	%r0
INC16	%r2	$2
LD8	(%r2)	$66
CPY16	%r2	%r0
INC16	%r2	$3
LD8	(%r2)	$83
LD16	%r2	$4
ADD16	%r2	%r0
LD32	(%r2)	$0
LD16	%r2	$8
ADD16	%r2	%r0
LD32	(%r2)	$8
LD16	%r2	$12
ADD16	%r2	%r0
LD8	(%r2)	$128
LD16	%r2	$13
ADD16	%r2	%r0
CPY8	%r3	(%r2)
AND8	%r3	$240
LD8	%eax	$0
OR8	%r3	%eax
CPY8	(%r2)	%r3
CPY8	%r3	(%r2)
AND8	%r3	$15
LD8	%eax	$0
OR8	%r3	%eax
CPY8	(%r2)	%r3
LD16	%r2	$14
ADD16	%r2	%r0
CPY8	%r3	(%r2)
AND8	%r3	$248
LD8	%eax	$0
OR8	%r3	%eax
CPY8	(%r2)	%r3
CPY8	%r3	(%r2)
AND8	%r3	$7
LD8	%eax	$80
OR8	%r3	%eax
CPY8	(%r2)	%r3
CPY16	%r1	%r1
LD8	(%r1)	$37
CPY16	%r0	%r0
SP_STORE	%r1
INC16	%r1	$4
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH16	$31
PUSH16	%r0
SP_DEC	$1
CALL	usbhostGeneric_write
POP8	%eax
SP_WR8	%eax	$61
SP_INC	$8
SP_RD16	%r0	$49
INC16	%r0	$0
CPY16	%r0	%r0
SP_STORE	%r1
INC16	%r1	$54
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH16	$8
PUSH16	%r0
SP_DEC	$1
CALL	usbhostGeneric_read
POP8	%eax
SP_WR8	%eax	$64
SP_INC	$8
SP_RD16	%r0	$57
SP_STORE	%r1
INC16	%r1	$70
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH16	$13
PUSH16	%r0
SP_DEC	$1
CALL	usbhostGeneric_read
POP8	%eax
SP_WR8	%eax	$80
SP_INC	$8
SP_RD16	%ecx	$54
CMP16	%ecx	$8
JNZ	@IC27
@IC28:	
SP_STORE	%r0
INC16	%r0	$41
LD16	%r1	$0
ADD16	%r1	%r0
CPY8	%r1	(%r1)
CPY8	%eax	%r1
AND32	%eax	$255
LD32	%ebx	$24
SHL32	%r1	%eax	%ebx
LD16	%r2	$1
ADD16	%r2	%r0
CPY8	%r2	(%r2)
CPY8	%eax	%r2
AND32	%eax	$255
LD32	%ebx	$16
SHL32	%r2	%eax	%ebx
ADD32	%r1	%r2
LD16	%r2	$2
ADD16	%r2	%r0
CPY8	%r2	(%r2)
CPY8	%eax	%r2
AND32	%eax	$255
LD32	%ebx	$8
SHL32	%r2	%eax	%ebx
ADD32	%r1	%r2
INC16	%r0	$3
CPY8	%r0	(%r0)
AND32	%r0	$255
ADD32	%r0	%r1
SP_STORE	%ecx
INC16	%ecx	$0
CPY32	(%ecx)	%r0
@IC27:	
SP_STORE	%eax
SP_STORE	%ecx
INC16	%ecx	$92
CPY32	(%ecx)	(%eax)
SP_INC	$73
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"get_read_capacity"

good_Light:	
.GLOBAL	 DO_NOT_EXPORT  "good_Light"

.FUNCTION	"good_Light"	
SP_DEC	$2
PUSH8	$1
PUSH8	$2
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$2
SP_INC	$2
PUSH8	$0
PUSH8	$2
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$3
SP_INC	$2
SP_INC	$2
RTS	
.FUNC_END	"good_Light"

bad_Light:	
.GLOBAL	 DO_NOT_EXPORT  "bad_Light"

.FUNCTION	"bad_Light"	
PUSH32	%r0
PUSH32	%r1
SP_DEC	$6
SP_RD32	%r1	$17
PUSH8	$1
PUSH8	$3
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$2
SP_INC	$2
@IC31:	
LD8	%ecx	$1
CMP8	%ecx	$0
JZ	@IC32
@IC33:	
LD32	%r0	$0
@IC34:	
CMP32	%r0	%r1
JGES	@IC35
@IC36:	
PUSH8	$1
PUSH8	$3
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$3
SP_INC	$2
PUSH16	$166
SP_DEC	$1
CALL	vos_delay_msecs
POP8	%eax
SP_WR8	%eax	$4
SP_INC	$2
PUSH8	$0
PUSH8	$3
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$5
SP_INC	$2
PUSH16	$166
SP_DEC	$1
CALL	vos_delay_msecs
POP8	%eax
SP_WR8	%eax	$6
SP_INC	$2
@IC37:	
INC32	%r0	$1
JUMP	@IC34
@IC35:	
PUSH16	$500
SP_DEC	$1
CALL	vos_delay_msecs
POP8	%eax
SP_WR8	%eax	$7
SP_INC	$2
JUMP	@IC31
@IC32:	
SP_INC	$6
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"bad_Light"

firmware:	
.GLOBAL	 DO_NOT_EXPORT  "firmware"

.FUNCTION	"firmware"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$58
CALL	open_drivers
PUSH8	$255
PUSH8	$0
SP_DEC	$1
CALL	vos_gpio_set_port_mode
POP8	%eax
SP_WR8	%eax	$2
SP_INC	$2
@IC40:	
PUSH16	$125
SP_DEC	$1
CALL	vos_delay_msecs
POP8	%eax
SP_WR8	%eax	$3
SP_INC	$2
PUSH8	$0
PUSH8	$0
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$4
SP_INC	$2
PUSH16	$125
SP_DEC	$1
CALL	vos_delay_msecs
POP8	%eax
SP_WR8	%eax	$5
SP_INC	$2
PUSH8	$1
PUSH8	$0
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$6
SP_INC	$2
@IC41:	
PUSH16	hUSBHOST_1
SP_DEC	$1
CALL	usbhost_connect_state
POP8	%eax
SP_WR8	%eax	$7
SP_INC	$2
SP_STORE	%ecx
INC16	%ecx	$5
CMP8	(%ecx)	$17
JNZ	@IC40
JZ	@IC42
@IC42:	
SP_STORE	%r1
INC16	%r1	$6
CPY16	%r2	%r1
LD8	(%r2)	$33
LD16	%r2	$2
ADD16	%r2	%r1
CPY16	%r2	%r2
LD32	(%r2)	$0
LD16	%r2	$8
ADD16	%r2	%r1
LD16	(%r2)	$0
LD16	%r2	$6
ADD16	%r2	%r1
SP_STORE	%r3
INC16	%r3	$16
CPY16	(%r2)	%r3
PUSH16	%r1
PUSH16	hUSBHOST_1
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$24
SP_INC	$4
SP_STORE	%ecx
INC16	%ecx	$20
CMP8	(%ecx)	$0
JZ	@IC45
@IC46:	
PUSH32	$1
CALL	bad_Light
SP_INC	$4
@IC45:	
SP_STORE	%r1
INC16	%r1	$6
LD16	%r2	$2
ADD16	%r2	%r1
CPY16	%r2	%r2
SP_STORE	%eax
INC16	%eax	$16
CPY32	(%r2)	(%eax)
LD16	%r2	$6
ADD16	%r2	%r1
SP_STORE	%r3
INC16	%r3	$21
CPY16	(%r2)	%r3
PUSH16	%r1
PUSH16	hUSBHOST_1
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$29
SP_INC	$4
SP_STORE	%ecx
INC16	%ecx	$25
CMP8	(%ecx)	$0
JNZ	@IC49
@IC50:	
PUSH32	$2
CALL	bad_Light
SP_INC	$4
@IC49:	
SP_STORE	%r1
INC16	%r1	$6
CPY16	%r2	%r1
LD8	(%r2)	$37
LD16	%r2	$2
ADD16	%r2	%r1
CPY16	%r2	%r2
SP_STORE	%eax
INC16	%eax	$16
CPY32	(%r2)	(%eax)
LD16	%r2	$6
ADD16	%r2	%r1
SP_STORE	%r3
INC16	%r3	$26
CPY16	(%r2)	%r3
PUSH16	%r1
PUSH16	hUSBHOST_1
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$33
SP_INC	$4
SP_STORE	%ecx
INC16	%ecx	$29
CMP8	(%ecx)	$0
JZ	@IC53
@IC54:	
PUSH32	$3
CALL	bad_Light
SP_INC	$4
@IC53:	
SP_STORE	%r1
INC16	%r1	$26
CPY8	%r1	(%r1)
CMP8	%r1	$8
JNZ	@IC58
JZ	@IC60
@IC60:	
SP_STORE	%r1
INC16	%r1	$26
INC16	%r1	$1
CPY8	%r1	(%r1)
CMP8	%r1	$6
JNZ	@IC58
JZ	@IC59
@IC59:	
SP_STORE	%r1
INC16	%r1	$26
INC16	%r1	$2
CPY8	%r1	(%r1)
CMP8	%r1	$80
JZ	@IC57
@IC58:	
PUSH32	$4
CALL	bad_Light
SP_INC	$4
@IC57:	
SP_STORE	%r1
INC16	%r1	$30
CPY16	(%r1)	hUSBHOST_1
LD16	%r2	$2
ADD16	%r2	%r1
SP_STORE	%eax
INC16	%eax	$16
CPY32	(%r2)	(%eax)
SP_STORE	%r2
INC16	%r2	$36
CPY16	%r3	%r2
LD8	(%r3)	$1
LD16	%r3	$1
ADD16	%r3	%r2
CPY16	(%r3)	%r1
PUSH16	%r2
PUSH16	hUSBHOSTGENERIC
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$45
SP_INC	$4
SP_STORE	%ecx
INC16	%ecx	$41
CMP8	(%ecx)	$0
JZ	@IC67
@IC68:	
PUSH32	$5
CALL	bad_Light
SP_INC	$4
@IC67:	
SP_DEC	$4
CALL	get_read_capacity
POP32	%eax
SP_WR32	%eax	$42
SP_RD32	%ecx	$42
SP_WR32	%ecx	$46
SP_RD32	%ecx	$46
CMP32	%ecx	$0
JNZ	@IC71
@IC72:	
PUSH32	$6
CALL	bad_Light
SP_INC	$4
@IC71:	
LD32	%r0	$0
@IC75:	
SP_STORE	%eax
INC16	%eax	$46
CMP32	%r0	(%eax)
JGT	@IC76
@IC77:	
LD32	%r1	$1
ADD32	%r1	%r0
LD32	%ebx	$2
REM32	%r1	%r1	%ebx
PUSH8	%r1
PUSH8	$0
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$52
SP_INC	$2
LD32	%ebx	$2
REM32	%r1	%r0	%ebx
PUSH8	%r1
PUSH8	$1
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$53
SP_INC	$2
PUSH32	%r0
CALL	erase_block
SP_INC	$4
@IC78:	
INC32	%r0	$1
JUMP	@IC75
@IC76:	
PUSH8	$0
PUSH8	$0
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$54
SP_INC	$2
LD32	%r0	$0
@IC81:	
CMP32	%r0	$10
JGE	@IC82
@IC83:	
LD32	%ebx	$2
REM32	%r1	%r0	%ebx
PUSH8	%r1
PUSH8	$1
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$55
SP_INC	$2
PUSH8	%r1
PUSH8	$2
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$56
SP_INC	$2
PUSH16	$50
SP_DEC	$1
CALL	vos_delay_msecs
POP8	%eax
SP_WR8	%eax	$57
SP_INC	$2
@IC84:	
INC32	%r0	$1
JUMP	@IC81
@IC82:	
@IC87:	
PUSH16	hUSBHOST_1
SP_DEC	$1
CALL	usbhost_connect_state
POP8	%eax
SP_WR8	%eax	$58
SP_INC	$2
SP_STORE	%ecx
INC16	%ecx	$56
CMP8	(%ecx)	$17
JNZ	@IC88
@IC89:	
PUSH8	$1
PUSH8	$2
SP_DEC	$1
CALL	vos_gpio_write_pin
POP8	%eax
SP_WR8	%eax	$59
SP_INC	$2
JUMP	@IC87
@IC88:	
SP_INC	$58
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"firmware"

