unit kpbuild;
interface 
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas',
        kpini in './ini/kpini.pas',
        getos in './system/getos.pas';
    procedure kpbuild_run;
    procedure kpbuild_help;
implementation
    procedure kpbuild_help;
    begin
        
    end;
    procedure kpbuild_run;
    begin
        if (ParamStr(2) = '--help') then
            begin
                kpbuild_help;
                exit;
            end;
        writeln('[Start] Build project');
        writeln('[Check] Project cofig');
        //Kiểm tra tệp local.ini còn không.
        //Nếu còn thì đi tiếp còn mất thì báo lỗi đồng thời thoát khỏi kpbuild_run
        if (not FileExists('local.ini')) then
            begin
                kpprint_error('[Error] Local.ini not found in project. Try "kodepas init --local" to create it');
                kpprint_error('[Fatal] Build project stoped');
                exit;
            end;
    end;
end.