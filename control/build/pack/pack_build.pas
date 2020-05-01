unit pack_build;
interface 
    uses crt, sysutils, process, DateUtils, 
        terminalprint in './effect/print/terminalprint',
        kpini in './file/kpini',
        getos in 'system/getos',
        kplog in './log/kplog',
        kptime in './time/kptime';
    procedure pack_build_run;
implementation
    procedure pack_build_run;
    var f_project, f_compiled : string;
        s: ansistring;
        t_start, t_end : TDateTime;
    begin
        {   [CONFIG]
            run=project.lpk
            type=package
            compiled=compiled/$(TargetCPU)-$(TargetOS)
            sdk=kodepas
        }
        t_start := now;
        f_project := kpini_string('local.ini', 'CONFIG', 'run');
        f_compiled := kpini_string('local.ini', 'CONFIG', 'compiled');
         writeln('[Start] Render from local.ini to project');
        kpini_xml(getCurrentDir + '/' + f_project, 'compiled\$(TargetCPU)-$(TargetOS)', f_compiled);
        terminalprint_complete('[Done ] Render complete');
        case getos_run of
            'linux':
                begin
                    writeln('[Start] Call KodePas Kernel to build');
                    if (RunCommand('kodepaskernel --build-all ' + f_project, s)) then
                        begin
                            t_end := now;
                            terminalprint_complete('[Done ] Build complete');
                            kplog_write(s);
                            kpini_xml(getCurrentDir + '/' + f_project, f_compiled, 'compiled\$(TargetCPU)-$(TargetOS)');
                        end
                    else 
                        begin
                            kplog_write(s);
                            terminalprint_error('[Error] Build fail. Try "kodepas log" to see log');
                        end;
                end;
            'windows':
                begin
                    writeln('[Start] Call KodePas Kernel to build');
                    if (RunCommand('kodepaskernel --build-all ' + f_project, s)) then
                        begin
                            terminalprint_complete('[Done ] Build complete');
                            kplog_write(s);
                            kpini_xml(getCurrentDir + '/' + f_project, f_compiled, 'compiled\$(TargetCPU)-$(TargetOS)');
                        end
                    else 
                        begin
                            kplog_write(s);
                            terminalprint_error('[Error] Build fail. Try "kodepas log" to see log');
                        end;
                end;
            else terminalprint_error('[Error] Unknow OS');
        end;
    end;
end.