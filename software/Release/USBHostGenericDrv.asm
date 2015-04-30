.DATA

.WEAK	"%eax"
.WEAK	"%ebx"
.WEAK	"%ecx"
.WEAK	"%r0"
.WEAK	"%r1"
.WEAK	"%r2"
.WEAK	"%r3"
hostGenericCtx	.DW	1	0
.GLOBAL	  DO_NOT_EXPORT "hostGenericCtx"
usbhostGeneric_cb	.DB	25	?
.GLOBAL	  DO_NOT_EXPORT "usbhostGeneric_cb"




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

.WEAK	"vos_signal_semaphore"

.WEAK	"vos_gpio_wait_on_int"

.WEAK	"vos_dma_get_fifo_data"

.WEAK	"vos_iocell_get_config"

.WEAK	"vos_iomux_define_bidi"

.WEAK	"vos_gpio_set_all_mode"

.WEAK	"vos_iocell_set_config"

.WEAK	"vos_gpio_set_pin_mode"

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

.WEAK	"vos_gpio_enable_int"

.WEAK	"vos_signal_cond_var"

usbhostGeneric_init:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_init"

.FUNCTION	"usbhostGeneric_init"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$4
SP_RD8	%r0	$24
PUSH16	$14
SP_DEC	$2
CALL	vos_malloc
POP16	%eax
SP_WR16	%eax	$2
SP_INC	$2
SP_RD16	hostGenericCtx	$0
PUSH16	$14
PUSH32	$0
PUSH16	hostGenericCtx
SP_DEC	$2
CALL	memset
POP16	%eax
SP_WR16	%eax	$10
SP_INC	$8
LD16	%r1	$usbhostGeneric_cb
LD16	%r2	$24
ADD16	%r2	%r1
LD8	(%r2)	$0
LD16	%r2	$8
ADD16	%r2	%r1
LD32	%r3	$usbhostGeneric_read
CPY32	(%r2)	%r3
LD16	%r2	$12
ADD16	%r2	%r1
LD32	%r3	$usbhostGeneric_write
CPY32	(%r2)	%r3
LD16	%r2	$16
ADD16	%r2	%r1
LD32	%r3	$usbhostGeneric_ioctl
CPY32	(%r2)	%r3
LD16	%r2	$20
ADD16	%r2	%r1
LD32	(%r2)	$0
CPY16	%r2	%r1
LD32	%r3	$usbhostGeneric_open
CPY32	(%r2)	%r3
LD16	%r2	$4
ADD16	%r2	%r1
LD32	%r3	$usbhostGeneric_close
CPY32	(%r2)	%r3
PUSH16	hostGenericCtx
PUSH16	%r1
PUSH8	%r0
CALL	vos_dev_init
SP_INC	$5
LD8	%eax	$0
SP_WR8	%eax	$23
SP_INC	$4
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhostGeneric_init"

usbhostGeneric_open:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_open"

.FUNCTION	"usbhostGeneric_open"	
RTS	
.FUNC_END	"usbhostGeneric_open"

usbhostGeneric_close:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_close"

.FUNCTION	"usbhostGeneric_close"	
RTS	
.FUNC_END	"usbhostGeneric_close"

usbhostGeneric_read:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_read"

.FUNCTION	"usbhostGeneric_read"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$27
SP_RD16	%ecx	$51
SP_RD16	%ecx	$49
SP_RD16	%ecx	$47
LD16	%ecx	$0
SP_WR16	%ecx	$0
LD8	%ecx	$3
SP_WR8	%ecx	$2
SP_RD16	%r0	$53
CPY16	%r0	(%r0)
CMP16	%r0	$0
JZ	@IC1
@IC2:	
SP_STORE	%r0
INC16	%r0	$3
PUSH16	$0
PUSH16	%r0
CALL	vos_init_semaphore
SP_INC	$4
SP_STORE	%r1
INC16	%r1	$8
PUSH16	$14
PUSH32	$0
PUSH16	%r1
SP_DEC	$2
CALL	vos_memset
POP16	%eax
SP_WR16	%eax	$30
SP_INC	$8
LD16	%r2	$7
ADD16	%r2	%r1
SP_STORE	%eax
INC16	%eax	$47
CPY16	(%r2)	(%eax)
LD16	%r2	$9
ADD16	%r2	%r1
SP_STORE	%eax
INC16	%eax	$49
CPY16	(%r2)	(%eax)
CPY16	%r2	%r1
SP_STORE	%ecx
INC16	%ecx	$24
SP_STORE	%eax
INC16	%eax	$53
CPY16	(%ecx)	%eax
SP_RD16	%eax	$24
CPY16	%r3	(%eax)
INC16	%r3	$6
CPY32	%r3	(%r3)
CPY32	(%r2)	%r3
LD16	%r2	$4
ADD16	%r2	%r1
CPY16	(%r2)	%r0
LD16	%r0	$6
ADD16	%r0	%r1
LD8	(%r0)	$15
LD16	%r0	$11
ADD16	%r0	%r1
LD8	(%r0)	$66
SP_RD16	%eax	$24
CPY16	%r0	(%eax)
CPY16	%r0	(%r0)
CPY16	%r1	%r1
PUSH16	$0
PUSH16	$14
PUSH16	%r1
PUSH16	%r0
SP_DEC	$1
CALL	vos_dev_read
POP8	%eax
SP_WR8	%eax	$34
SP_INC	$8
SP_RD8	%ecx	$26
SP_WR8	%ecx	$2
SP_RD8	%ecx	$26
CMP8	%ecx	$0
JNZ	@IC4
@IC5:	
LD8	%ecx	$0
SP_WR8	%ecx	$2
SP_STORE	%r0
INC16	%r0	$8
INC16	%r0	$9
CPY16	%r0	(%r0)
SP_WR16	%r0	$0
JUMP	@IC3
@IC4:	
SP_RD8	%eax	$2
AND32	%eax	$255
LD32	%r0	$128
OR32	%r0	%eax
SP_STORE	%ecx
INC16	%ecx	$2
CPY8	(%ecx)	%r0
@IC3:	
@IC1:	
SP_RD16	%ecx	$51
CMP16	%ecx	$0
JZ	@IC8
@IC9:	
SP_RD16	%ecx	$51
SP_STORE	%eax
INC16	%eax	$0
CPY16	(%ecx)	(%eax)
@IC8:	
SP_RD8	%eax	$2
SP_WR8	%eax	$46
SP_INC	$27
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhostGeneric_read"

usbhostGeneric_write:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_write"

.FUNCTION	"usbhostGeneric_write"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$27
SP_RD16	%ecx	$51
SP_RD16	%ecx	$49
SP_RD16	%ecx	$47
LD16	%ecx	$0
SP_WR16	%ecx	$0
LD8	%ecx	$3
SP_WR8	%ecx	$2
SP_RD16	%r0	$53
CPY16	%r0	(%r0)
CMP16	%r0	$0
JZ	@IC10
@IC11:	
SP_STORE	%r0
INC16	%r0	$3
PUSH16	$14
PUSH32	$0
PUSH16	%r0
SP_DEC	$2
CALL	vos_memset
POP16	%eax
SP_WR16	%eax	$25
SP_INC	$8
SP_STORE	%r1
INC16	%r1	$19
PUSH16	$0
PUSH16	%r1
CALL	vos_init_semaphore
SP_INC	$4
LD16	%r2	$7
ADD16	%r2	%r0
SP_STORE	%eax
INC16	%eax	$47
CPY16	(%r2)	(%eax)
LD16	%r2	$9
ADD16	%r2	%r0
SP_STORE	%eax
INC16	%eax	$49
CPY16	(%r2)	(%eax)
CPY16	%r2	%r0
SP_STORE	%ecx
INC16	%ecx	$24
SP_STORE	%eax
INC16	%eax	$53
CPY16	(%ecx)	%eax
SP_RD16	%eax	$24
CPY16	%r3	(%eax)
INC16	%r3	$10
CPY32	%r3	(%r3)
CPY32	(%r2)	%r3
LD16	%r2	$4
ADD16	%r2	%r0
CPY16	(%r2)	%r1
LD16	%r1	$6
ADD16	%r1	%r0
LD8	(%r1)	$15
LD16	%r1	$11
ADD16	%r1	%r0
LD8	(%r1)	$2
SP_RD16	%eax	$24
CPY16	%r1	(%eax)
CPY16	%r1	(%r1)
CPY16	%r0	%r0
PUSH16	$0
PUSH16	$14
PUSH16	%r0
PUSH16	%r1
SP_DEC	$1
CALL	vos_dev_write
POP8	%eax
SP_WR8	%eax	$34
SP_INC	$8
SP_RD8	%ecx	$26
SP_WR8	%ecx	$2
SP_RD8	%ecx	$26
CMP8	%ecx	$0
JNZ	@IC13
@IC14:	
LD8	%ecx	$0
SP_WR8	%ecx	$2
SP_STORE	%r0
INC16	%r0	$3
INC16	%r0	$9
CPY16	%r0	(%r0)
SP_WR16	%r0	$0
JUMP	@IC12
@IC13:	
SP_RD8	%eax	$2
AND32	%eax	$255
LD32	%r0	$128
OR32	%r0	%eax
SP_STORE	%ecx
INC16	%ecx	$2
CPY8	(%ecx)	%r0
@IC12:	
@IC10:	
SP_RD16	%ecx	$51
CMP16	%ecx	$0
JZ	@IC17
@IC18:	
SP_RD16	%ecx	$51
SP_STORE	%eax
INC16	%eax	$0
CPY16	(%ecx)	(%eax)
@IC17:	
SP_RD8	%eax	$2
SP_WR8	%eax	$46
SP_INC	$27
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhostGeneric_write"

usbhostGeneric_ioctl_setup:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_ioctl_setup"

.FUNCTION	"usbhostGeneric_ioctl_setup"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$23
SP_STORE	%r0
CPY16	%r1	%r0
LD8	(%r1)	$128
LD16	%r1	$1
ADD16	%r1	%r0
LD8	(%r1)	$0
LD16	%r1	$2
ADD16	%r1	%r0
LD16	(%r1)	$0
LD16	%r1	$4
ADD16	%r1	%r0
LD16	(%r1)	$0
LD16	%r1	$6
ADD16	%r1	%r0
LD16	(%r1)	$2
SP_STORE	%r1
INC16	%r1	$8
CPY16	%r2	%r1
LD8	(%r2)	$80
LD16	%r2	$2
ADD16	%r2	%r1
CPY16	%r2	%r2
SP_STORE	%ecx
INC16	%ecx	$18
SP_STORE	%eax
INC16	%eax	$45
CPY16	(%ecx)	%eax
SP_RD16	%eax	$18
CPY16	%r3	(%eax)
INC16	%r3	$2
CPY32	%r3	(%r3)
CPY32	(%r2)	%r3
LD16	%r2	$8
ADD16	%r2	%r1
CPY16	(%r2)	%r0
LD16	%r0	$6
ADD16	%r0	%r1
SP_STORE	%r2
INC16	%r2	$20
CPY16	(%r0)	%r2
SP_RD16	%eax	$18
CPY16	%r0	(%eax)
CPY16	%r0	(%r0)
PUSH16	%r1
PUSH16	%r0
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$26
SP_INC	$4
SP_RD8	%r0	$22
SP_RD8	%ecx	$22
CMP8	%ecx	$0
JNZ	@IC19
@IC20:	
SP_RD16	%r1	$43
INC16	%r1	$3
CPY16	%r1	%r1
SP_STORE	%r2
INC16	%r2	$20
CPY8	%r2	(%r2)
CPY8	%eax	%r2
AND16	%eax	$255
CPY16	(%r1)	%eax
LD8	%eax	$0
SP_WR8	%eax	$42
SP_INC	$23
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
@IC19:	
CPY8	%eax	%r0
AND32	%eax	$255
LD32	%r1	$128
OR32	%r1	%eax
SP_STORE	%eax
INC16	%eax	$42
CPY8	(%eax)	%r1
SP_INC	$23
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhostGeneric_ioctl_setup"

usbhostGeneric_attach:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_attach"

.FUNCTION	"usbhostGeneric_attach"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$16
LD8	%ecx	$1
SP_WR8	%ecx	$0
SP_RD16	%r0	$36
INC16	%r0	$1
CPY16	%r0	(%r0)
SP_WR16	%r0	$1
SP_RD16	%r0	$38
SP_RD16	%r1	$1
CPY16	%r1	(%r1)
CPY16	(%r0)	%r1
@IC23:	
SP_STORE	%r0
INC16	%r0	$3
CPY16	%r1	%r0
LD8	(%r1)	$48
LD16	%r1	$2
ADD16	%r1	%r0
CPY16	%r1	%r1
SP_RD16	%r2	$1
INC16	%r2	$2
CPY32	%r2	(%r2)
CPY32	(%r1)	%r2
LD16	%r1	$6
ADD16	%r1	%r0
SP_STORE	%r2
INC16	%r2	$38
CPY16	%r3	(%r2)
INC16	%r3	$2
CPY16	(%r1)	%r3
CPY16	%r1	(%r2)
CPY16	%r1	(%r1)
PUSH16	%r0
PUSH16	%r1
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$17
SP_INC	$4
SP_RD8	%ecx	$13
CMP8	%ecx	$0
JZ	@IC26
@IC27:	
LD8	%ecx	$3
SP_WR8	%ecx	$0
JUMP	@IC25
@IC26:	
SP_STORE	%r0
INC16	%r0	$3
CPY16	%r1	%r0
LD8	(%r1)	$49
LD16	%r1	$2
ADD16	%r1	%r0
CPY16	%r1	%r1
SP_RD16	%r2	$1
INC16	%r2	$2
CPY32	%r2	(%r2)
CPY32	(%r1)	%r2
LD16	%r1	$6
ADD16	%r1	%r0
SP_STORE	%r2
INC16	%r2	$38
CPY16	%r3	(%r2)
INC16	%r3	$6
CPY16	(%r1)	%r3
CPY16	%r1	(%r2)
CPY16	%r1	(%r1)
PUSH16	%r0
PUSH16	%r1
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$18
SP_INC	$4
SP_RD8	%ecx	$14
CMP8	%ecx	$0
JZ	@IC30
@IC31:	
LD8	%ecx	$3
SP_WR8	%ecx	$0
JUMP	@IC25
@IC30:	
SP_STORE	%r0
INC16	%r0	$3
CPY16	%r1	%r0
LD8	(%r1)	$50
LD16	%r1	$2
ADD16	%r1	%r0
CPY16	%r1	%r1
SP_RD16	%r2	$1
INC16	%r2	$2
CPY32	%r2	(%r2)
CPY32	(%r1)	%r2
LD16	%r1	$6
ADD16	%r1	%r0
SP_STORE	%r2
INC16	%r2	$38
CPY16	%r3	(%r2)
INC16	%r3	$10
CPY16	(%r1)	%r3
CPY16	%r1	(%r2)
CPY16	%r1	(%r1)
PUSH16	%r0
PUSH16	%r1
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$19
SP_INC	$4
SP_RD8	%ecx	$15
CMP8	%ecx	$0
JZ	@IC34
@IC35:	
LD8	%ecx	$3
SP_WR8	%ecx	$0
JUMP	@IC25
@IC34:	
LD8	%ecx	$0
SP_WR8	%ecx	$0
@IC24:	
LD8	%ecx	$0
CMP8	%ecx	$0
JNZ	@IC23
@IC25:	
SP_RD8	%eax	$0
SP_WR8	%eax	$35
SP_INC	$16
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhostGeneric_attach"

usbhostGeneric_detach:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_detach"

.FUNCTION	"usbhostGeneric_detach"	
PUSH32	%r0
PUSH32	%r1
SP_STORE	%r0
INC16	%r0	$11
CPY16	%r1	(%r0)
LD16	(%r1)	$0
CPY16	%r1	(%r0)
INC16	%r1	$2
LD32	(%r1)	$0
CPY16	%r1	(%r0)
INC16	%r1	$6
LD32	(%r1)	$0
CPY16	%r0	(%r0)
INC16	%r0	$10
LD32	(%r0)	$0
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhostGeneric_detach"

usbhostGeneric_ioctl:	
.GLOBAL	 DO_NOT_EXPORT  "usbhostGeneric_ioctl"

.FUNCTION	"usbhostGeneric_ioctl"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_DEC	$2
SP_RD16	%ecx	$18
SP_RD16	%r0	$20
LD8	%r1	$1
JUMP	@IC40
@IC39:	
PUSH16	%r0
SP_RD16	%eax	$20
PUSH16	%eax
SP_DEC	$1
CALL	usbhostGeneric_ioctl_setup
POP8	%eax
SP_WR8	%eax	$4
SP_INC	$4
SP_STORE	%eax
CPY8	%r1	(%eax)
JUMP	@IC38
@IC41:	
PUSH16	%r0
SP_RD16	%eax	$20
PUSH16	%eax
SP_DEC	$1
CALL	usbhostGeneric_attach
POP8	%eax
SP_WR8	%eax	$5
SP_INC	$4
SP_RD8	%r1	$1
JUMP	@IC38
@IC43:	
PUSH16	%r0
CALL	usbhostGeneric_detach
SP_INC	$2
LD8	%r1	$0
JUMP	@IC38
@IC45:	
JUMP	@IC38
@IC40:	
SP_RD16	%r2	$18
CPY8	%r2	(%r2)
CMP8	%r2	$3
JZ	@IC39
@IC42:	
CMP8	%r2	$1
JZ	@IC41
@IC44:	
CMP8	%r2	$2
JZ	@IC43
@IC46:	
@IC38:	
SP_STORE	%eax
INC16	%eax	$17
CPY8	(%eax)	%r1
SP_INC	$2
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhostGeneric_ioctl"

