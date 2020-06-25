unit kpcreate;
interface
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas',
        kpget in './get/kpget.pas',
        kpzip in './zip/kpzip.pas',
        getos in './system/getos.pas',
        native_create in 'native/native_create.pas',
        web_create in 'web/web_create.pas',
        hibrid_create in 'hibrid/hibrid_create.pas',
        cli_create in 'cli/cli_create.pas',
        packnative_create in 'pack/packnative_create.pas';
    procedure kpcreate_run;
    procedure kpcreate_help;
implementation
    procedure kpcreate_run;
    begin
        if (paramCount >1 ) then
            begin
                case (paramStr(2)) of
                    '--help': kpcreate_help;
                    '--native': native_create_run;
                    '--web': web_create_run;
                    '--hibrid': hibrid_create_run;
                    '--cli': cli_create_run;
                    '--packnative': packnative_create_run;
                    else kpprint_error('[Error] Unknow param ('+ paramStr(2) + '). Try "kodepas create --help" to see more');
                end;
            end
        else 
            begin
                kpcreate_help;
            end;
    end;
    procedure kpcreate_help;
    begin
        writeln('Try: kodepas create [--options]');
        writeln('Options:');
        writeln('   --native: create native application project');
        writeln('   --web: create web application project');
        writeln('   --hibrid: create hibrid application project');
        writeln('   --cli: create CLI project');
        writeln('   --packnative: create packnative project');
        writeln('   --help: give help of Kode create');
    end;
end.