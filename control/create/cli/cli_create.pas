unit cli_create;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpget in '././get/kpget.pas',
        kpzip in '././zip/kpzip.pas',
        getos in '././system/getos.pas';
    procedure cli_create_run;
implementation
    procedure cli_create_run;
    begin
        writeln('[Start] Create CLI project');
        kpget_channel('kodestudio/project-cli');
        kpzip_unzip('project-cli');
        if (deleteFile('project-cli.kpa')) then 
            kpprint_complete('[Done ] Clear file temp')
        else kpprint_error('[Error] Fail clear');
        kpprint_complete('[Done ] Create project complete');
    end;
end.
    