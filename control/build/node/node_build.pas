unit node_build;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpini in './ini/kpini.pas',
        getos in './system/getos.pas',
        kplog in '././log/kplog.pas';
    procedure node_build_run;
implementation
    procedure node_build_run;
    var cmdout: ansistring;
    begin
        kpprint_process('[Start] Render data form local.ini to project');
        kpini_xml(kpini_string('local.ini', 'CONFIG', 'run'), 'bin\project', kpini_string('local.ini', 'CONFIG', 'bin'));
        kpini_xml(kpini_string('local.ini', 'CONFIG', 'run'), 'compiled\$(TargetCPU)-$(TargetOS)', kpini_string('local.ini', 'CONFIG', 'compiled'));
        kpprint_complete('[Done ] Render complete');
        //kết nối với Kernel và bắt đầu build
        case (getos_run) of
            'windows':
                begin
                    kpprint_process('[Start] Connect to Kernel (Windows) and build');
                    if (runcommand('kodepaskernel --build-all ' + kpini_string('local.ini', 'CONFIG','run'), cmdout)) then
                        begin
                            kpprint_process('[Start] Write log');
                            kplog_run(cmdout);
                            kpprint_complete('[Done ] Write complete');
                            kpprint_complete('[Done ] Build complete');
                        end
                    else 
                        begin
                            kpprint_process('[Start] Write log');
                            kplog_run(cmdout);
                            kpprint_complete('[Done ] Write log complete');
                            kpprint_error('[Error] Cannot build');
                            writeln('[Log  ]');
                            writeln(cmdout);
                            kpprint_error('[Fatal] Build project stop');
                            exit;
                        end;     
                end;
            'linux':
                begin
                    kpprint_process('[Start] Connect to Kernel (Linux) and build');
                    if (runcommand('kodepaskernel --build-all ' + kpini_string('local.ini', 'CONFIG','run'), cmdout)) then
                        begin
                            kpprint_process('[Start] Write log');
                            kplog_run(cmdout);
                            kpprint_complete('[Done ] Write complete');
                            kpprint_complete('[Done ] Build complete');
                        end
                    else 
                        begin
                            kpprint_process('[Start] Write log');
                            kplog_run(cmdout);
                            kpprint_complete('[Done ] Write log complete');
                            kpprint_error('[Error] Cannot build');
                            writeln('[Log  ]');
                            writeln(cmdout);
                            kpprint_error('[Fatal] Build project stop');
                            exit;
                        end;     
                end;
            'macos':
                begin
                    kpprint_process('[Start] Connect to Kernel (MacOS) and build');
                    if (runcommand('kodepaskernel --build-all ' + kpini_string('local.ini', 'CONFIG','run'), cmdout)) then
                        begin
                            kpprint_process('[Start] Write log');
                            kplog_run(cmdout);
                            kpprint_complete('[Done ] Write complete');
                            kpprint_complete('[Done ] Build complete');
                        end
                    else 
                        begin
                            kpprint_process('[Start] Write log');
                            kplog_run(cmdout);
                            kpprint_complete('[Done ] Write log complete');
                            kpprint_error('[Error] Cannot build');
                            writeln('[Log  ]');
                            writeln(cmdout);
                            kpprint_error('[Fatal] Build project stop');
                            exit;
                        end;     
                end;
        end;
        //Xóa bỏ render và file tạm
        kpini_xml(kpini_string('local.ini', 'CONFIG', 'run'), kpini_string('local.ini', 'CONFIG', 'bin'), 'bin\project');
        kpini_xml(kpini_string('local.ini', 'CONFIG', 'run'), kpini_string('local.ini', 'CONFIG', 'compiled'), 'compiled\$(TargetCPU)-$(TargetOS)');
    end;
end.