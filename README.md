Student: Yatskiv Oleh

Group: CE-48

Subject: CSDT


Project name: Chrome Dragon Game

HW interface: SPI

Data driven format: JSON

* Play modes:
	* Man vs AI
	* Man vs Man
	* AI vs AI
* AI supports next complexity levels:
	* Random move
	* Win strategy
* Actions
	* New
	* Save
	* Load
	
Ver. 1.1

## How to build project
Project contains 4 solution
* UI (Chrome Dragon Game) — Pyton script. You need to run with Pyton IDE
* UARTServer — script to Arduino board
* UARTSPIServer — script to Arduino board
* SPIClient — script to Arduino board

## How to run project
There are two ways to start a project:
* With connection through SPI (Two Arduino boards are required)
* Without connection through SPI (One Arduino board is required)

### With connection through SPI
* Connect 2 Arduino to PC
* Open UARTSPIServer/UARTSPIServer.ino in Arudino IDE and upload script to first Arduino board
* Open SPIClient/SPIClient.ino in Arudino IDE and upload script to second Arduino board
* Connect (MOSI, MISO, SCK, SS) pins of the first Arduino with the same pins of the second Arduino board
* Change COM Port in Pyton script

### Without connection through SPI
* Connect Arduino to PC
* Open UARTServer/UARTServer.ino in Arudino IDE and upload script to Arduino board
* Change COM Port in Pyton script

## How to run tests
Open the Chrome Dragon Game folder and run automation_tests to start unit and integration tests

Manual tests are described in Manual test.pdf

### List of changes
Ver 1.1:
	+ Added AL vs AL mode
	

Ver 1.2:
	+ Added connection with DataBase

#### Created tags: 
	1) cstd-yatskivoleh-2122_1.0_5121517
	2) cstd-yatskivoleh-2122_1.1_5121517
	3) cstd-yatskivoleh-2122_1.2_5221521

