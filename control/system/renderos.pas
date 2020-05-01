unit renderos;
interface 
    uses crt, sysutils,
    kpini in './file/kpini',
    getos in 'getos';
    procedure renderos_run;
implementation
    procedure renderos_run;
    begin
        if (not fileExists('local.ini')) then
            exit;
        case getos_run of
            'linux': 
                kpini_xml('local.ini', '\', '/');
            'windows':
                kpini_xml('local.ini', '/', '\');
        end;
    end;
end.