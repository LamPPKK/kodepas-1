unit hybrid_create;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpget in '././get/kpget.pas',
        kpzip in '././zip/kpzip.pas',
        getos in '././system/getos.pas';
    procedure hybrid_create_run;
implementation
    procedure hybrid_create_run;
    begin
        kpprint_process('[Start] Create hybrid project');
        kpget_channel('kodestudio/project-hybrid');
        kpzip_unzip('project-hybrid');
        if (deleteFile('projec-hybrid.kpa')) then 
            kpprint_complete('[Done ] Clear file temp')
        else kpprint_error('[Error] Fail clear');
        kpprint_complete('[Done ] Create project complete');
    end;
end.
    