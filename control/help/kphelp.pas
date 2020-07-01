unit kphelp;
interface 
    uses crt;
    procedure kphelp_run;
implementation
    procedure kphelp_run;
    begin
        writeln('Welcome to Kode.');
        writeln('Try: kodepas [option-main] [--option-brand] [value]');
        writeln('To see help of [Options Main], try: "kodepas [options main] --help');
        writeln('Options Main: ');
        writeln('   setup: setup Kode');
        writeln('   help: give how to use Kode CLI');
        writeln('   build: build your project');
        writeln('   import: import lib, code, from more programing language');
        writeln('   run: build and run project at debug');
        writeln('   get: download and install packages from KPStore');
        writeln('   pack: pack all folder to KodePack: *.kpa');
        writeln('   init: create some default file in Kode');
        writeln('   create: create new project/packages in Kode');
        writeln('   legend: show all coder of KodeSpace');
        writeln('   doctor: check Kode in your local computer');
        writeln('   upgrade: upgrade all system packages in Kode (at KPA)');
        writeln('   update: update all Kode from Kode Server (at Git)');
        writeln('   license: read license of Kode project');
        writeln('   render: render resource, images, database,... to Kode project at KPS');
        writeln('   version: view version of Kode');
        writeln('   start: run Kode Live');
        writeln('See more info of Kode CLI at');
        writeln('   Website: https://kodelang.dev/cli');
        writeln('   GitHub: https://www.github.com/kodestudio/kodepas');
        writeln('   Forums: https://www.github.com/kodestudio/kodepas/issues');
    end;
end.