unit kpbuild;
interface 
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas',
        kpini in './ini/kpini.pas',
        getos in './system/getos.pas';
    procedure kpbuild_run;
    procedure kpbuild_help;
implementation
    
end.