unit renderos;
interface
    uses crt, sysutils, process,
        kpini in './ini/kpini.pas',
        getos in 'getos.pas';
    procedure renderos_run;
implementation
    procedure renderos_run;
    begin
        if (not fileExists('local.ini')) then exit;
        case (getos_run) of
            'linux': kpini_xml('local.ini', '\', '/');
            'windows': kpini_xml('local.ini', '/', '\');
            'macos': kpini_xml('local.ini', '\', '/');
        end;
    end;
end.