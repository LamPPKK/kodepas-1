unit kpupdates;
interface 
    uses crt, sysutils,
    kpzip in './zip/kpzip',
    kpget in './get/kpget',
    terminalprint in './effect/print/terminalprint';
    procedure kpupdates_run;
implementation
    procedure kpupdates_run;
    begin
        writeln('[Start ] Get LCL');
        kpget_download('kodestudio', 'lasted/lcl');
        kpzip_updates('lcl');
        if (deleteFile('lcl.kpa')) then ;
        terminalprint_complete('[Done ] Updates LCL complete');


        writeln('[Start ] Get packager');
        kpget_download('kodestudio', 'lasted/packager');
        kpzip_updates('packager');
        if (deleteFile('packager.kpa')) then ;
        terminalprint_complete('[Done ] Updates Packager complete');


        writeln('[Start ] Get component');
        kpget_download('kodestudio', 'lasted/components');
        kpzip_updates('component');
        if (deleteFile('components.kpa')) then ;
        terminalprint_complete('[Done ] Updates Components complete');
        terminalprint_complete('[Done ] Updates done');
    end;
end.