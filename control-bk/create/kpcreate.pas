unit kpcreate;
interface 
    uses crt, sysutils, process,
        terminalprint in './effect/print/terminalprint',
        getos in './system/getos',
        kpget in 'get/kpget',
        kpzip in 'zip/kpzip';
    procedure kpcreate_run;
implementation
    procedure help;
    begin
        writeln('Try: kodepas create [option]');
        writeln('Options:');
        writeln('   --help: give help');
        writeln('   --desktop: create desktop project');
        writeln('   --android: create project for Android divice');
        writeln('   --game: create project with Graphics');
        writeln('   --web: create web project');
    end;
    procedure create_desktop;
    var s: ansistring;
    begin
        case getos_run of
            'linux' : 
                begin
                    writeln('[Start] Get project from KPStore: kodestudio/project-desktop');
                    kpget_download('kodestudio', 'project-desktop');
                    kpzip_unzip('project-desktop');
                    if (deleteFile('project-desktop.kpa'))then 
                        terminalprint_complete('[Done ] Clear file temp')
                    else terminalprint_error('[Error] Fail clear');
                    terminalprint_complete('[Done ] Create project complete');
                end;
            'windows':
                begin
                    writeln('[Start] Get project from KPStore: kodestudio/project-desktop');
                    kpget_download('kodestudio', 'project-desktop');
                    kpzip_unzip('project-desktop');
                    if (deleteFile('project-desktop.kpa'))then 
                        terminalprint_complete('[Done ] Clear file temp')
                    else terminalprint_error('[Error] Fail clear');
                    terminalprint_complete('[Done ] Create project complete');
                end;
            else terminalprint_error('[Error] Unknow OS');
        end;
    end;
    procedure kpcreate_run;
    begin
        case paramStr(2) of 
            '--desktop' : create_desktop;
            '--help' : help;
            else terminalprint_error('[Error] Unknow param(' + paramStr(2) + '). Try "kodepas create --help" to see help');
        end;
    end;
end.