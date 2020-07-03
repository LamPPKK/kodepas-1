unit kprun;
interface
    uses crt, sysutils,  process,
        kpini in './ini/kpini.pas',
        native_run in 'native/native_run.pas',
        cli_run in 'cli/cli_run.pas',
        kpprint in './effect/print/kpprint',
        kpbuild in './build/kpbuild.pas';
    procedure kprun_run;
    procedure kprun_help;
implementation
    procedure kprun_help;
    begin

    end;
    procedure kprun_run;
    begin
        if (paramStr(2) = '--help') then
            begin
                kprun_help;
                exit; 
            end;
        kpbuild_run; 
        case (kpini_string('local.ini', 'CONFIG','type')) of
            'native':
                begin
                    native_run_run;
                end;
            else 
                begin
                    kpprint_error('[Fatal] Unknow to run');
                    exit;
                end;
        end;
    end;
end.