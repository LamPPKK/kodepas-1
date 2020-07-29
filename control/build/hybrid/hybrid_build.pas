unit hybrid_build;
interface 
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpini in './ini/kpini.pas',
        getos in './system/getos.pas',
        kplog in '././log/kplog.pas',
        web_build in './web/web_build.pas';
    procedure hybrid_build_run;
implementation
    procedure hybrid_build_run;
    begin
        //chạy build trên wen trước
        web_build_run;
    end;
end.    