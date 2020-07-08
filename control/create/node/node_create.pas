unit node_create;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpget in '././get/kpget.pas',
        kpzip in '././zip/kpzip.pas',
        getos in '././system/getos.pas';
    procedure node_create_run;
implementation
    procedure node_create_run;
    begin
        kpprint_process('[Start] Create Node project');
        kpget_channel('kodestudio/project-node');
        kpzip_unzip('project-web');
        if (deleteFile('project-web.kpa')) then 
            kpprint_complete('[Done ] Clear file temp')
        else kpprint_error('[Error] Fail clear');
        kpprint_complete('[Done ] Create project complete');
    end;
end.
    