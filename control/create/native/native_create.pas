unit native_create;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpget in '././get/kpget.pas',
        kpzip in '././zip/kpzip.pas',
        getos in '././system/getos.pas';
    procedure native_create_run;
implementation
    procedure native_create_run;
    begin
        kpprint_process('[Start] Create native project');
        kpget_channel('kodestudio/project-native');
        kpzip_unzip('project-native');
        if (deleteFile('project-native.kpa')) then 
            kpprint_complete('[Done ] Clear file temp')
        else kpprint_error('[Error] Fail clear');
        kpprint_complete('[Done ] Create project complete');
    end;
end.
    