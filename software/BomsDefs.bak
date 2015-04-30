#ifndef _BOMS_DEFS_H_
#define _BOMS_DEFS_H_

// define the Command Block Wrapper for BOMS
typedef struct _boms_cbw_t {
	unsigned char sig[4]; // "USBC"
	unsigned long tag; // used to associate CBW with CSW
	unsigned long dataTransferLength; // bytes for data transport phase
	unsigned char flags; // b7=0 OUT, b7=1 IN, all others zero
	unsigned char res1:4; // reserved must be zero
	unsigned char lun:4;
	unsigned char res2:3; // reserved must be zero
	unsigned char cbLength:5; //bytes in CB that actually mean anything
	union
	{
		unsigned char raw[16];
		struct {
			unsigned char command;
			unsigned char parameters[15];
		} formated;
	} cb;
} boms_cbw_t;

// define the Command Status Wrapper for BOMS
typedef struct _boms_csw_t {
	unsigned char sig[4]; //"USBS"
	unsigned long tag;
	unsigned long residue;
	unsigned char status; // 0x00=success 0x01=failure 0x02=phase error
} boms_csw_t;

typedef union  {
	unsigned char raw[18];
	struct
	{
		unsigned char responseCode:7; //0x70 current error
		unsigned char valid:1; // 1=INFORMATION field valid
		unsigned char obsolete;
		unsigned char senseKey:4; // 0x05 for illegal request
		unsigned char resvered:1;
		unsigned char ili:1; // incorrect length indicator
		unsigned char eom:1; // end of media for streaming devices
		unsigned char filemark:1; // for streaming devices
		unsigned long information; // device specific info
		unsigned char addSenseLen; // additional bytes that follow 244 max
		unsigned long cmdSpecInfo; // command specific info
		unsigned char asc; // additional sense code 0x20 for illegal command
		unsigned char ascq; // additional sense code qualifier 0-unused
		unsigned char fruc; // field replaceable unit code set to 0
		unsigned char senseKeySpecific[3]; //senses key spec info if b7=1
	} formated;
} request_sense_response_t;



#endif
