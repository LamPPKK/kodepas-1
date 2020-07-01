{
    This program to run visual in Windows
    Note: Only Windows
}
program koderunvisual;
uses 
    //thư viện mặc định
    crt, sysutils, process,
    //Setup Kode
    kpsetup in 'setup/kpsetup.pas',
    //Lấy thông tin về hệ điều hành
    getos in 'system/getos.pas',
    //In ra màn hình kết quả đã được định dạng
    kpprint in 'effect/print/kpprint.pas',
    //Một số hiệu ứng
    kpmagic in 'effect/magic/kpmagic.pas',
    //Hiển thị hướng dẫn
    kphelp in 'help/kphelp.pas',
    //Lấy gói từ máy chủ
    kpget in 'get/kpget.pas',
    //Xử lí file nén
    kpzip in 'zip/kpzip.pas',
    //tạo dự án mới
    kpcreate in 'create/kpcreate.pas',
    //tạo các loại dự án
    native_create in 'create/native/native_create.pas',
    web_create in 'create/web/web_create.pas',
    hibrid_create in 'create/hibrid/hibrid_create.pas',
    cli_create in 'create/cli/cli_create.pas',
    packnative_create in 'create/pack/packnative_create.pas',
    //thư viện xử lí tệp INI
    kpini in 'ini/kpini.pas',
    //Thêm thư viện build dự án
    kpbuild in 'build/kpbuild.pas',
    //thêm thư viện tạo dự án thành Kode Packges
    kppack in 'pack/kppack.pas',
    //Thêm số phiên bản
    kpversion in 'version/kpversion.pas',
    //xây dựng native project
    native_build in 'build/native/native_build.pas',
    //Thay đổi đường dẫn ở các hệ điều hành
    renderos in 'system/renderos.pas',
    //Thư viện ghi tệp log
    kplog in 'log/kplog.pas',
    //Chạy
    kprun in 'run/kprun.pas',
    //native run
    native_run in 'run/native/native_run.pas',
    //Kode Live
    kpstart in 'start/kpstart.pas',
    //import mã nguồn
    kpimport in 'import/kpimport.pas',
    //Thư viện kết xuất tài nguyên
    kprender in 'render/kprender.pas';
var 
    input: string;
    cmdout: ansistring;
begin
    kpprint_process('[Start] Call Kernel');
    if (runcommand('kodepaskernel --build-all ' + paramStr(1),cmdout)) then
        begin
            kpprint_complete('[Done ] Called');
        end
    else 
        begin
            kpprint_error('[Error] Call Kode Kernel fail');
            kpprint_error('[Code]');
            writeln(cmdout);
            kpprint_error('[Fatal] Stop');
            exit;
        end;
    ExecuteProcess('bin\project','');
end.