unit packnative_create;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpget in '././get/kpget.pas',
        kpzip in '././zip/kpzip.pas',
        getos in '././system/getos.pas';
    procedure packnative_create_run;
implementation
    procedure packnative_create_run;
    begin
        kpprint_process('[Start] Create pack native project');
        kpget_channel('kodestudio/project-packnative');
        kpzip_unzip('project-packnative');
        if (deleteFile('project-packnative.kpa')) then 
            kpprint_complete('[Done ] Clear file temp')
        else kpprint_error('[Error] Fail clear');
        kpprint_complete('[Done ] Create project complete');
    end;
end.
    