unit hibrid_create;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpget in '././get/kpget.pas',
        kpzip in '././zip/kpzip.pas',
        getos in '././system/getos.pas';
    procedure hibrid_create_run;
implementation
    procedure hibrid_create_run;
    begin
        kpprint_process('[Start] Create hibrid project');
        kpget_channel('kodestudio/project-hibrid');
        kpzip_unzip('project-hibrid');
        if (deleteFile('projec-hibrid.kpa')) then 
            kpprint_complete('[Done ] Clear file temp')
        else kpprint_error('[Error] Fail clear');
        kpprint_complete('[Done ] Create project complete');
    end;
end.
    