unit desktop_build;
interface 
    uses crt, sysutils, process, DateUtils, 
        terminalprint in './effect/print/terminalprint',
        kpini in './file/kpini',
        getos in 'system/getos',
        kplog in './log/kplog',
        kptime in './time/kptime';
    procedure desktop_build_run;
implementation
    procedure desktop_build_run;
        var f_project, f_bin, f_compiled , p_type: string;
        s: ansistring;
        t_start, t_end : TDateTime;
    begin
        t_start := now;
        {lấy dữ liệu ở local.ini}
        writeln('[Start] Get data in local.ini');
        p_type := kpini_string('local.ini', 'CONFIG', 'type');
        f_project := kpini_string('local.ini', 'CONFIG', 'run');
        f_bin := kpini_string('local.ini', 'CONFIG', 'filebin');
        f_compiled := kpini_string('local.ini', 'CONFIG','compiled');
        {chuyển từ .ini sang .xml}
        terminalprint_complete('[Done ] Get data done');
        writeln('[Start] Render from local.ini to project');
        kpini_xml(f_project, 'bin\project', f_bin);
        kpini_xml(f_project, 'compiled\$(TargetCPU)-$(TargetOS)', f_compiled);
        terminalprint_complete('[Done ] Render complete');
        {Xóa tệp chạy cũ}
        if (FileExists(getCurrentDir + '/' + f_bin)) then    
                if (DeleteFile(getCurrentDir + '/' + f_bin)) then ;
        {kết nối kodepaskernel và build}
        case getos_run of
            'linux':
                begin
                    writeln('[Start] Call KodePas Kernel (Linux) to compiler and build');
                    if (runcommand('kodepaskernel --build-all ' + f_project, s)) then
                        begin
                            t_end := now;
                            terminalprint_complete('[Done ] Called Kernel and build done');
                            kpini_xml(getCurrentDir + '/' + f_project,f_bin,  'bin\project');
                            kpini_xml(getCurrentDir + '/' + f_project, f_compiled, 'compiled\$(TargetCPU)-$(TargetOS)');
                            kplog_write(s);
                        end
                    else 
                        begin
                            terminalprint_error('[Error] Build error. Try: "kodepas log" to see error code');
                            kplog_write(s);
                            terminalprint_error('[Stop ] Stop build project');
                            exit;
                        end;
                end;
            'windows':
                begin
                    writeln('[Start] Call KodePas Kernel (Windows) to compiler and build');
                    if (runcommand('kodepaskernel --build-all ' + f_project, s)) then
                        begin
                            terminalprint_complete('[Done ] Called Kernel and build done');
                            kpini_xml(getCurrentDir + '/' + f_project,f_bin,  'bin\project');
                            kpini_xml(getCurrentDir + '/' + f_project, f_compiled, 'compiled\$(TargetCPU)-$(TargetOS)');
                            kplog_write(s);
                        end
                    else 
                        begin
                            terminalprint_error('[Error] Build error. Try: "kodepas log" to see error code');
                            terminalprint_error('[Stop ] Stop build project');
                            exit;
                        end;
                end;
            else terminalprint_error('[Error] Unknow OS');
        end;
    end;
end.