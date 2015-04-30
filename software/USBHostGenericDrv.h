/*
** USBHostGenericDrv.h
**
** Copyright © 2010-2011 Future Technology Devices International Limited
**
** Company Confidential
**
** Header file containing definitions for Vinculum II Host Generic Driver
** Used internally by the Generic driver only
**
** Author: FTDI
** Project: Vinculum II
** Module: Vinculum II USB Host Generic Driver
** Requires: VOS
** Comments:
**
** History:
**  1 – Initial version
**
*/

#ifndef USBHOSTGENERICDRV_H
#define USBHOSTGENERICDRV_H

enum USBHOSTGENERIC_STATUS {
	USBHOSTGENERIC_OK = 0,
	USBHOSTGENERIC_INVALID_PARAMETER,
	USBHOSTGENERIC_ERROR,
	USBHOSTGENERIC_NOT_FOUND,
	USBHOSTGENERIC_USBHOST_ERROR = 0x80
};

// USBHostGeneric Context
//
// Holds a context structure required by each instance of the driver
typedef struct _usbhostGeneric_context_t
{
	// host controller handle
	VOS_HANDLE			 hc;

	// endpoint handles
	usbhost_ep_handle_ex epCtrl;
	usbhost_ep_handle_ex epBulkIn;
	usbhost_ep_handle_ex epBulkOut;
} usbhostGeneric_context_t;

#define VOS_IOCTL_USBHOSTGENERIC_ATTACH 1
#define VOS_IOCTL_USBHOSTGENERIC_DETACH 2
#define VOS_IOCTL_USBHOSTGENERIC_STATUS 3

// USBHostGeneric IOCTL attach structure
typedef struct _usbhostGeneric_ioctl_cb_attach_t
{
	VOS_HANDLE				 hc_handle;
	usbhost_device_handle_ex ifDev;
} usbhostGeneric_ioctl_cb_attach_t;

// USBHostGeneric IOCTL structure
typedef struct _usbhostGeneric_ioctl_t {
	unsigned char ioctl_code;
	union
	{
		unsigned char					 *data;
		usbhostGeneric_ioctl_cb_attach_t *att;
	} set;
	union
	{
		unsigned char *data;
	} get;
} usbhostGeneric_ioctl_t;

unsigned char usbhostGeneric_init(unsigned char vos_dev_num);

	
// read function
unsigned char usbhostGeneric_read(
	char *xfer,
	unsigned short num_to_read,
	unsigned short *num_read,
	usbhostGeneric_context_t *ctx);

// write function
unsigned char usbhostGeneric_write(
	char *xfer,
	unsigned short num_to_write,
	unsigned short *num_written,
	usbhostGeneric_context_t *ctx);

#endif                                 /* USBHOSTGENERICDRV_H */

