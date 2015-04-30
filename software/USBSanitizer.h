/*
** Filename: USBSanitizer.h
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

#ifndef _USBSanitizer_H_
#define _USBSanitizer_H_

#include "vos.h"
#include "BomsDefs.h"

#define READY GPIO_A_0
#define ERASE GPIO_A_1
#define GOOD GPIO_A_2
#define BAD GPIO_A_3


/* FTDI:SHF Header Files */
#include "USB.h"
#include "USBHost.h"
#include "GPIO.h"
#include "string.h"
#include "errno.h"
/* FTDI:EHF */

/* FTDI:SDC Driver Constants */
#define VOS_DEV_USBHOST_1 0
#define VOS_DEV_GPIO_PORT_A 1

#define VOS_NUMBER_DEVICES 3
/* FTDI:EDC */

// Additional Device Driver
#define VOS_DEV_USBHOSTGENERIC 2

/* FTDI:SXH Externs */
/* FTDI:EXH */

#endif /* _USBSanitizer_H_ */
