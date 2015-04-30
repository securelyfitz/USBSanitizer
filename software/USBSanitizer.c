/*
** Filename: USBSanitizer.c
**
** Automatically created by Application Wizard 2.0.2
** 
** Part of solution USBSanitizer in project USBSanitizer
**
** Comments: 
**
** Important: Sections between markers "FTDI:S*" and "FTDI:E*" will be overwritten by
** the Application Wizard
*/

#include "USBSanitizer.h"
#include "USBHostGenericDrv.h"

/* FTDI:STP Thread Prototypes */
vos_tcb_t *tcbFIRMWARE;

void firmware();
/* FTDI:ETP */

/* FTDI:SDH Driver Handles */
VOS_HANDLE hUSBHOST_1; // USB Host Port 1
VOS_HANDLE hGPIO_PORT_A; // GPIO Port A Driver
/* FTDI:EDH */

VOS_HANDLE hUSBHOSTGENERIC;            // USB Host Generic Driver (Additional Device)
extern usbhostGeneric_context_t *hostGenericCtx;

/* Declaration for IOMUx setup function */
void iomux_setup(void);

/* Main code - entry point to firmware */
void main(void)
{
	/* FTDI:SDD Driver Declarations */
	// GPIO Port A configuration context
	gpio_context_t gpioContextA;
	// USB Host configuration context
	usbhost_context_t usbhostContext;
	/* FTDI:EDD */

	/* FTDI:SKI Kernel Initialisation */
	vos_init(50, VOS_TICK_INTERVAL, VOS_NUMBER_DEVICES);
	vos_set_clock_frequency(VOS_48MHZ_CLOCK_FREQUENCY);
	vos_set_idle_thread_tcb_size(512);
	/* FTDI:EKI */

	iomux_setup();

	/* FTDI:SDI Driver Initialisation */
	// Initialise GPIO A
	gpioContextA.port_identifier = GPIO_PORT_A;
	gpio_init(VOS_DEV_GPIO_PORT_A,&gpioContextA);
	
	
	// Initialise USB Host
	usbhostContext.if_count = 8;
	usbhostContext.ep_count = 16;
	usbhostContext.xfer_count = 2;
	usbhostContext.iso_xfer_count = 2;
	usbhost_init(VOS_DEV_USBHOST_1, -1, &usbhostContext);
	/* FTDI:EDI */

	usbhostGeneric_init(VOS_DEV_USBHOSTGENERIC);
	
	/* FTDI:SCT Thread Creation */
	tcbFIRMWARE = vos_create_thread_ex(20, 4096, firmware, "Application", 0);
	/* FTDI:ECT */

	vos_start_scheduler();

main_loop:
	goto main_loop;
}

/* FTDI:SSP Support Functions */

unsigned char usbhost_connect_state(VOS_HANDLE hUSB)
{
	unsigned char connectstate = PORT_STATE_DISCONNECTED;
	usbhost_ioctl_cb_t hc_iocb;

	if (hUSB)
	{
		hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_GET_CONNECT_STATE;
		hc_iocb.get        = &connectstate;
		vos_dev_ioctl(hUSB, &hc_iocb);

    // repeat if connected to see if we move to enumerated
		if (connectstate == PORT_STATE_CONNECTED)
		{
			vos_dev_ioctl(hUSB, &hc_iocb);
		}
	}
	return connectstate;
}

/* FTDI:ESP */

void open_drivers(void)
{
        /* Code for opening and closing drivers - move to required places in Application Threads */
        /* FTDI:SDA Driver Open */
        hUSBHOST_1 = vos_dev_open(VOS_DEV_USBHOST_1);
        hGPIO_PORT_A = vos_dev_open(VOS_DEV_GPIO_PORT_A);
        /* FTDI:EDA */
		
		hUSBHOSTGENERIC = vos_dev_open(VOS_DEV_USBHOSTGENERIC);

}

void attach_drivers(void)
{
        /* FTDI:SUA Layered Driver Attach Function Calls */
        /* FTDI:EUA */
}

void close_drivers(void)
{
        /* FTDI:SDB Driver Close */
        vos_dev_close(hUSBHOST_1);
        vos_dev_close(hGPIO_PORT_A);
        /* FTDI:EDB */
		
		vos_dev_close(hUSBHOSTGENERIC);

}



void writeString(VOS_HANDLE hDev, char *str)
{
	vos_dev_write(hDev, (unsigned char *) str, strlen(str), NULL);
}

void writeShort(VOS_HANDLE hDev, unsigned short val)
{
	char str[4];
	unsigned char ch;

	ch = val >> 12;
	ch = ch & 0x0f;

	if (ch > 9)
		str[0] = 'A' - 10 + ch;
	else
		str[0] = '0' + ch;

	ch = val >> 8;
	ch = ch & 0x0f;

	if (ch > 9)
		str[1] = 'A' - 10 + ch;
	else
		str[1] = '0' + ch;

	ch = val >> 4;
	ch = ch & 0x0f;

	if (ch > 9)
		str[2] = 'A' - 10 + ch;
	else
		str[2] = '0' + ch;

	ch = val & 0x0f;

	if (ch > 9)
		str[3] = 'A' - 10 + ch;
	else
		str[3] = '0' + ch;

	vos_dev_write(hDev, (unsigned char *) str, 4, NULL);
}
	
unsigned short send_cbw(boms_cbw_t *cbw)
{
	unsigned short num_written=0;
//	unsigned char status;
//	char *byteMsg = " Bytes written to device\r\n";

	usbhostGeneric_write((void*)cbw, sizeof(boms_cbw_t), &num_written, hostGenericCtx);
/*
	writeShort(hUART, (short)status);
	writeShort(hUART, num_written);
	writeString(hUART, byteMsg);		
*/
	return num_written;
}

unsigned short receive_data(void* buffer, unsigned short expected)
{
	unsigned short num_read;
//	unsigned char status;

//	char *byteMsg = " Bytes of read from device\r\n";

	usbhostGeneric_read(buffer, expected, &num_read, hostGenericCtx);
/*	
	writeShort(hUART, (short)status);
	writeShort(hUART, num_read);
	writeString(hUART, byteMsg);		
*/
	return num_read;
}
	
unsigned short receive_csw(boms_csw_t *csw)
{
	unsigned short num_read;

//	char *byteMsg = " Bytes of csw from device\r\n";

	usbhostGeneric_read((void*)csw, 13, &num_read, hostGenericCtx);
/*
	writeShort(hUART, num_read);
	writeString(hUART, byteMsg);		
*/
	return num_read;
}

void erase_block(unsigned long block_num)
{
	long deviceCapacity=0;
	short blockSize;
	unsigned short num_written=0;
	unsigned short num_data_written=0;
	unsigned short num_csw_read;
	boms_cbw_t cbw;
	boms_csw_t csw;
	unsigned char zeros[512];

	memset(cbw, 0, sizeof(boms_cbw_t));
	memset(cbw.cb.formated, 0, 16);
	memset(zeros, 0x41, 512);

	cbw.sig[0] = 'U'; //"USBS"
	cbw.sig[1] = 'S';
	cbw.sig[2] = 'B';
	cbw.sig[3] = 'S';
	cbw.tag = 0x0;
	cbw.dataTransferLength=0X100;
	cbw.flags=0x00;
	cbw.res1=0;
	cbw.lun=0;
	cbw.res2=0;
	cbw.cbLength=0x0A;
	cbw.cb.formated.command=0x2A;
	cbw.cb.raw[4]=block_num;
	cbw.cb.raw[8]=1;
	

	// send cbw to device
	usbhostGeneric_write((void*)&cbw, sizeof(boms_cbw_t), &num_written, hostGenericCtx);
	// send write data to device
	usbhostGeneric_write((void*)zeros, 512, &num_data_written, hostGenericCtx);
	// receive csw from device
	usbhostGeneric_read((void*)csw, 13, &num_csw_read, hostGenericCtx);

}
	
long get_read_capacity()
{
	long deviceCapacity=0;
	short blockSize;
	unsigned short num_written=0;
	unsigned short num_data_read;
	unsigned short num_csw_read;
	boms_cbw_t cbw;
	boms_csw_t csw;
	unsigned char buffer[8];	
	
	memset(cbw, 0, sizeof(boms_cbw_t));
	memset(cbw.cb.formated, 0, 16);
	memset(buffer, 0, sizeof(char)*8);

	cbw.sig[0] = 'U'; //"USBS"
	cbw.sig[1] = 'S';
	cbw.sig[2] = 'B';
	cbw.sig[3] = 'S';
	cbw.tag = 0x0;
	cbw.dataTransferLength=8;
	cbw.flags=0x80;
	cbw.res1=0;
	cbw.lun=0;
	cbw.res2=0;
	cbw.cbLength=0x0A;
	cbw.cb.formated.command=0x25;

	// send cbw to device
	usbhostGeneric_write((void*)&cbw, sizeof(boms_cbw_t), &num_written, hostGenericCtx);
	// receive response from device
	usbhostGeneric_read((void*)&buffer[0], 8, &num_data_read, hostGenericCtx);
	// receive csw from device
	usbhostGeneric_read((void*)csw, 13, &num_csw_read, hostGenericCtx);

	if (num_data_read==8)
	{
		deviceCapacity = buffer[0]*16777216 + buffer[1]*65536 + buffer[2]*256 +buffer[3];
		blockSize = buffer[4]*16777216 + buffer[5]*65536 + buffer[6]*256 +buffer[7];
	}
	return deviceCapacity;
}
	

void good_Light(unsigned int val)
{
	int i;
//	for (i=0;i<val;i++)
//	{
		vos_gpio_write_pin(GOOD, 1);
//		vos_delay_msecs(125);
		vos_gpio_write_pin(GOOD, 0);
//		vos_delay_msecs(125);
//	}
//	vos_delay_msecs(125);
}
	
void bad_Light(unsigned int val)
{
	int i;
	vos_gpio_write_pin(BAD, 1);
	while(1)
	{
		for (i=0;i<val;i++)
		{
			vos_gpio_write_pin(BAD, 1);
			vos_delay_msecs(166);
			vos_gpio_write_pin(BAD, 0);
			vos_delay_msecs(166);
		}
		vos_delay_msecs(500);
	}
}
	
/* Application Threads */

void firmware()
{
	unsigned long i;
	unsigned char status;
	unsigned char buf[64];
	unsigned short num_read;
	unsigned long block_count;
	char *readyMsg = "Ready!\r\n";
	char *colonMsg = ":";
	char *classMsg = "Class : ";
	char *crMsg = "\r\n";
	usbhostGeneric_ioctl_t generic_iocb;
	usbhostGeneric_ioctl_cb_attach_t genericAtt;
	usbhost_device_handle_ex ifDev;
	usbhost_device_handle_ex ifDev2;
	usbhost_ioctl_cb_t hc_iocb;
	usbhost_ioctl_cb_class_t hc_iocb_class;
	
	unsigned char portData;
	
	open_drivers();

	//set GPIO to OUT
	vos_gpio_set_port_mode(GPIO_PORT_A, 0xFF);
		
	//READY
	//flash until connect...
	do
	{
		vos_delay_msecs(125);
		vos_gpio_write_pin(READY, 0);
		vos_delay_msecs(125);
		vos_gpio_write_pin(READY, 1);
	}
	while ((usbhost_connect_state(hUSBHOST_1) != PORT_STATE_ENUMERATED));

		
	//device detected ready light on. count devices
	hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_NEXT_HANDLE;
	hc_iocb.handle.dif = NULL;
	hc_iocb.set = NULL;
	hc_iocb.get = &ifDev;

	if (vos_dev_ioctl(hUSBHOST_1, &hc_iocb) != USBHOST_OK)
	{
		bad_Light(1);
	}

	//look for second device. if it exists, then BAD
	hc_iocb.handle.dif = ifDev;
	hc_iocb.get = &ifDev2;
	if (vos_dev_ioctl(hUSBHOST_1, &hc_iocb) == USBHOST_OK)
	{
		bad_Light(2);
	}

	//only one device. What device class?
	hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_CLASS_INFO;
	hc_iocb.handle.dif = ifDev;
	hc_iocb.get = &hc_iocb_class;
	if (vos_dev_ioctl(hUSBHOST_1, &hc_iocb) != USBHOST_OK)
	{
		bad_Light(3);
	}

	if ((hc_iocb_class.dev_class != 0x08)||(hc_iocb_class.dev_subclass != 0x06)||(hc_iocb_class.dev_protocol != 0x50))
	{
		bad_Light(4);
	}

	// only one MSC. Connect
	genericAtt.hc_handle = hUSBHOST_1;
	genericAtt.ifDev = ifDev;
	generic_iocb.ioctl_code = VOS_IOCTL_USBHOSTGENERIC_ATTACH;
	generic_iocb.set.att = &genericAtt;
	if (vos_dev_ioctl(hUSBHOSTGENERIC, &generic_iocb) != USBHOSTGENERIC_OK)
	{
		bad_Light(5);
	}

	//connected. Get Capacity

	block_count=get_read_capacity();
	if (block_count==0)
	{
		bad_Light(6);
	}

	//connected. got capacity. write 0's
	for (i=0;i<=block_count;i++)
	{
		vos_gpio_write_pin(READY, (i+1)%2);
		vos_gpio_write_pin(ERASE, i%2);
		erase_block(i);
	}	

	//all done. turn off ready light. flash green then wait...
	vos_gpio_write_pin(READY, 0);
	for (i=0;i<10;i++)
	{
		vos_gpio_write_pin(ERASE, i%2);
		vos_gpio_write_pin(GOOD, i%2);
		vos_delay_msecs(50);
	}
	
	while ((usbhost_connect_state(hUSBHOST_1) == PORT_STATE_ENUMERATED))
	{
		vos_gpio_write_pin(GOOD, 1);
	}
}

