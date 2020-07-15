![alt](https://github.com/kodestudio/kodepas/blob/master/images/kodelogo.png)
**KodePas is a Software Development Kit (SDK) for Kode (from FPC and Lazarus project)**
<h1> Installation Guide </h1>
<h3> Windows Users </h3>
**Prerequisites:**
1. FPC (Free Pascal Compiler) version 3.0.4
To install FPC, download via this link: 
https://sourceforge.net/projects/freepascal/files/Win32/3.0.4/fpc-3.0.4.i386-win32.exe/download

Run the installation file after download finishes. It should be completed shortly.

2. KodePas Source Code
To get the KodePas SDK, you can manually download (normally as a Zip file), or obtain the source via Git.
Retrieve all files into a single folder then place it at a destination of your choice.

After finishing above actions, you may set the PATH directory to the SDK, by going to View Advanced System Settings > Environment Variables, then look for the 
System Variables section, search for a row titled "Path", then click Edit..

You may add the target directory by clicking the New.. Button, then filling it in the field. Finishing all of the steps then you may apply all changes.
The PATH directory should be: `<YOUR_SDK_DIR>\bin`

3. Kode Compiler (KC) - for Web development
To get the Kode Compiler (KC), click this link: https://github.com/kodestudio/kc, and download using the same method for the SDK. Remember to set the PATH directory of the compiler.

**Detailed guide:**
After you have met all of the prerequisites above, follow these steps:
1. Perfrom SDK first time setup:
   Type `kodepas setup`
   The console will ask you to fill in some required directories (SDK Location, Compiler Location)
   Since this is your first time experiencing the SDK, you can type in as below:
   For the KodePas SDK location: `<YOUR_SDK_DIR>`
   For the compiler location: `<YOUR_DIR>/FPC/3.0.4`

2. Create your first project (Native OS Project):
   Go to your folder where you want the project to be created.
   Type `kodepas create --native`
   Your project files will be automatically created after the console finishes executing.
 
3. Run the program:
   Type `kodepas run`
   Your program should run successfully.
   
   



