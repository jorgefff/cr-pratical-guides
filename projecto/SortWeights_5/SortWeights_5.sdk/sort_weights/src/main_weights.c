/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdlib.h>
#include "xil_printf.h"
#include "platform.h"
#include "xparameters.h"
#include "xgpio.h"


//declare an XGpio and XGpio instance
XGpio GPIO_0;
XGpio_Config GPIO_0_conf;

int main()
{
	GPIO_0_conf.BaseAddress = XPAR_AXI_GPIO_0_BASEADDR;
	GPIO_0_conf.DeviceId 	= XPAR_GPIO_0_DEVICE_ID;
	GPIO_0_conf.IsDual 		= XPAR_GPIO_0_IS_DUAL;

	//Initialize the XGpio instance
	XGpio_CfgInitialize(&GPIO_0, &GPIO_0_conf, GPIO_0_conf.BaseAddress);

	init_platform();

	//XGpio_DiscreteWrite(&GPIO_0, 1, 0xD1234567);

	//xil_printf("HW_0 = %d\n",XGpio_DiscreteRead(&GPIO_0, 0));
	//xil_printf("GPIO_CH1 = %d\n\r",XGpio_DiscreteRead(&GPIO_0, 1));
	//xil_printf("GPIO_CH2 = %d\n\r",XGpio_DiscreteRead(&GPIO_0, 2));

	const unsigned int NUM_VALUES = 100;
	const unsigned int DATA_BITS = 24;
	const unsigned int ADDR_BITS = 7;

	const unsigned int READ_WEIGHTS = 0;
	const unsigned int READ_SORTED = 128;
	const unsigned int FILTER_READ_READY = 32;
	const unsigned int FILTER_READ = 31;
	const unsigned int IS_READY = 32;

	unsigned int ready;

	unsigned int values[NUM_VALUES];
	unsigned int weights[NUM_VALUES];
	unsigned int sortedWeights[NUM_VALUES];

	unsigned int value = 0;

	/*
	 * PART 1 - Send 100 values of 24 bits to the hardware
	 */
	// To send: WriteEnable(1)  ADDR(6:0)  DATA(23:0)
	// message = [WE(31)][ADDR(30:24)][DATA(23:0)]
	for(int i = 0; i < 99; i++)
	{
		unsigned int msg;

		msg = 1; 					// Write Enable bit

		msg = msg << ADDR_BITS;		// Addr bits
		msg = msg + i;

		msg = msg << DATA_BITS;		// Data bits
		msg = msg + value;
		values[i] = value;

		if (value == 16777215)
		{
			value = 0;
		}
		else
		{
			value = value << 1;
			value = value +1;
		}

		XGpio_DiscreteWrite (&GPIO_0, 2, msg); 	// Send value
	}
	XGpio_DiscreteWrite (&GPIO_0, 2, 0);			// Send signal to start circuit


	/*
	 * PART 2 - Read the weight of the values sent
	 */
	xil_printf("Waiting for weights to be ready...\n\r");
	XGpio_DiscreteWrite(&GPIO_0, 1, READ_WEIGHTS);
	do
	{
		ready = XGpio_DiscreteRead (&GPIO_0, 1) & FILTER_READ_READY;
	}
	while(ready != IS_READY);

	xil_printf("Getting weights:\n\r");
	for (int i = 0; i < 99; i++)
	{
		unsigned int weight;
		XGpio_DiscreteWrite(&GPIO_0, 1, READ_WEIGHTS+i);
		weight = XGpio_DiscreteRead (&GPIO_0, 1) & FILTER_READ;
		weights[i] = weight;
		xil_printf("%d\n\r", weight);
	}


	/*
	 * PART 3 - Read the weights after sorting
	 */
	xil_printf("Waiting for weights to be sorted...\n\r");
	XGpio_DiscreteWrite(&GPIO_0, 1, READ_SORTED);
	do
	{
		ready = XGpio_DiscreteRead (&GPIO_0, 1) & FILTER_READ_READY;
	}
	while(ready != IS_READY);

	xil_printf("Getting weights:\n\r");
	for (int i = 0; i < 99; i++)
	{
		unsigned int weight;
		XGpio_DiscreteWrite(&GPIO_0, 1, READ_SORTED+i);
		weight = XGpio_DiscreteRead (&GPIO_0, 1) & FILTER_READ;
		sortedWeights[i] = weight;
		xil_printf("%d\n\r", weight);
	}


	/*
	 * PART 4 - Side by side comparison
	 */
	xil_printf("-----------------\n\r");
	xil_printf("Printing results \n\r");
	xil_printf("  i      Val    Wei Sor\n\r");
	for (int i = 0; i < 99; i++)
	{
		xil_printf("%3d: %9d  %2d  %2d\n\r",i,values[i],weights[i], sortedWeights[i]);
	}


	xil_printf("-----------------\n\r");
	cleanup_platform();
	return 0;
}
