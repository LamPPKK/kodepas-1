unit web_run;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpini in '././ini/kpini.pas';
    procedure web_run_run;
implementation
    //lấy đường dẫn mẹ
    function GetParent(input:string):string;
        begin
            exit(extractFileName(ExtractFileDir(input)));
        end;
    //lấy đường dẫn con
    function GetChild(input:string):string;
        begin
            exit(extractFileName(input));
        end;
    procedure web_run_run;
    begin
        writeln('[Warn ] Web project not support to run');
    end;
end.