unit kppath;
interface 
    uses crt, sysutils;
    function kppath_GetParent(input: string):string;
    function kppath_GetChild(input: string): string;
implementation
    {Lấy đường daãn mẹ}
    function kppath_GetParent(input:string):string;
        begin
        exit(extractFileName(ExtractFileDir(input)));
        end;
    {Lấy dudowngf dẫn con}
    function kppath_GetChild(input:string):string;
        begin
        exit(extractFileName(input));
        end;
end.