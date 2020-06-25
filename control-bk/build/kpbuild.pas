unit kpbuild;
interface 
    uses crt, sysutils, process, DateUtils, 
        terminalprint in './effect/print/terminalprint',
        kpini in './file/kpini',
        getos in 'system/getos',
        kplog in './log/kplog',
        kptime in './time/kptime',
        desktop_build in 'desktop/desktop_build',
        pack_build in 'pack/pack_build',
        kppath in './path/kppath';
    procedure kpbuild_now;
    procedure kpbuild_run;
    procedure kpbuild_clear;
implementation
    procedure help;
    begin
        writeln('Try: kodepas build [option]');
        writeln('Options: ');
        writeln('   --clear: clear temp and build');
    end;
    procedure kpbuild_clear;
    var f_bin, f_compiled : string;
    begin
        writeln('[Start] Clear project temp file');
         if (FileExists(getCurrentDir + '/local.ini')) then terminalprint_complete('[Done ] Local.ini found')
        else    
            begin
                terminalprint_error('[Stop ] File local.ini not found. try "kodepas init --local" to create it');
                exit;
            end;
        if (kpini_string('local.ini', 'CONFIG', 'type') = 'desktop') then
        begin
            f_bin := kpini_string('local.ini', 'CONFIG', 'filebin');
            if (DeleteFile(getCurrentDir + '/' + f_bin)) then ;
        end;
        f_compiled := kpini_string('local.ini', 'CONFIG','compiled');
        removedir(kppath_getparent(f_compiled));
        terminalprint_complete('[Done ] Clear done');
    end;
    procedure kpbuild_now;
    var f_project, f_bin, f_compiled , p_type: string;
        s: ansistring;
        t_start, t_end : TDateTime;
    begin
        terminalprint_process('[Run  ] Build project');
        {kiểm tra xem local.ini có không}
        writeln('[Start] Check file local.ini');
        if (FileExists(getCurrentDir + '/local.ini')) then terminalprint_complete('[Done ] Local.ini found')
        else    
            begin
                terminalprint_error('[Stop ] File local.ini not found. try "kodepas init --local" to create it');
                exit;
            end;
        {lấy dữ liệu ở local.ini}
        p_type := kpini_string('local.ini', 'CONFIG', 'type');
        case p_type of
            'desktop': desktop_build_run;
            'package': pack_build_run;
            else terminalprint_error('[Error] Unknow type build');
        end;        
    end;

    procedure kpbuild_run;
    begin
        if (paramCount = 1) then kpbuild_now
        else 
            case paramStr(2) of
                '--help': help;
                '--clear':
                    begin
                        kpbuild_clear;
                        kpbuild_now;
                    end;
                else terminalprint_error('[Error] Unknow param (' + paramStr(2) + '). Try "kodepas build --help" to see param can use');
            end;
    end;
end.