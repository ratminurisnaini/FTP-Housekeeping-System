# FTP-Housekeeping-System
This ETL system is designed to clean up data in the FTP folder by removing unused files or folders with names containing specific dates that match the configurations of date ranges and date patterns in the parameter table.

For example, removing files with a file name pattern ‘my_file_dd-mm-yyyy.xlsx’ with ‘dd-mm-yyyy’ is a date more than 18 days ago. Or removing folders with a folder name pattern ‘yyyy-mm_my_folder’ with ‘yyyy-mm’ is a date more than six months ago.

The date patterns supported in this system are:
*	yyyymmdd
*	yyyy-mm-dd
*	ddmmyyyy
*	dd-mm-yyyy
*	yyyymm
*	yyyy-mm
*	mmyyyy
*	mm-yyyy

## System Flowchart
<img width="2514" alt="Flowchart" src="https://github.com/user-attachments/assets/64b7d329-17cb-4c3d-ae67-fb18368f577c">

The table used in this system is konfig_ftp (located in the 'Table' folder) to store all parameters related to the FTP housekeeping process.

## Parameter Table Preview (konfig_ftp)
<img width="603" alt="konfig_ftp (1)" src="https://github.com/user-attachments/assets/c77f3961-9b7e-4a4c-aa45-46b8b61d2e00"> **. . .**

<img width="502" alt="konfig_ftp (2)" src="https://github.com/user-attachments/assets/f22bb9bb-0e9a-4d3e-a9e8-0fd04af44abf">

**Field descriptions**
| No | Field Name | Data Type | Description |
| --- | --- | --- | --- |
| 1 |	id |	int |	Unique id number of konfig_ftp table |
| 2 |	day_reference |	int |	The date reference (in days) for deleting files/folders. For example, if this field is filled with ‘18’, it means to delete files/folders with dates more than 18 days ago. |
| 3 |	week_reference |	int |	The date reference (in weeks) for deleting files/folders. For example, if this field is filled with ‘2’, it means to delete files/folders with dates more than 2 weeks ago. |
| 4 |	month_reference |	int |	The date reference (in months) for deleting files/folders. For example, if this field is filled with ‘24’, it means to delete files/folders with dates more than 24 months ago. |
| 5 |	date_format |	varchar |	Date patterns. For example ‘yyyy-mm-dd’. |
| 6 |	flag_aktif |	int |	Flag to activate or deactivate current id. |
| 7 |	flag_ftp |	varchar | <p>Object to be removed<br>Values: file \| folder</p> |
| 8 |	nama_file |	varchar |	File name |
| 9 |	extension |	varchar |	Extension of the file. Filled with *null* if flag_ftp is ‘folder’. |
| 10 |	Protocol |	varchar | <p>Protocol type<br>Value: FTP</p> |
| 11 |	IP_Address |	varchar |	IP address of FTP |
| 12 |	Server_Port |	varchar |	FTP port |
| 13 |	Username |	varchar |	FTP username |
| 14 |	Password |	varchar |	Encrypted FTP password |
| 15 |	Remote_directory |	varchar |	FTP folder to connect |
| 16 |	Wildcard |	varchar |	File/folder name pattern |

Note:
*	day_reference, week_reference, and month_reference can only be filled one of them.
*	The encrypted ftp password is encrypted using the fnEncrypt function and then will be decrypted using the fnDecrypt function in the ETL system. These functions are not included in this repository, so if you want to execute the ETL system you must create your own fnEncrypt and fnDecrypt functions.

## Example Results
The system was executed on September 2, 2024

Before<br>
<img width="350" alt="Before" src="https://github.com/user-attachments/assets/ff1fdc3d-77e3-4779-8ed7-dab304b5a312">

Process<br>
<img width="428" alt="Process" src="https://github.com/user-attachments/assets/a0f6beda-fdc1-4778-a138-a1777414d0ee">

After<br>
<img width="349" alt="After" src="https://github.com/user-attachments/assets/932fd3db-efe8-4467-b0df-a6fa3bc86c04">
