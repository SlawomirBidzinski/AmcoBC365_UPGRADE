codeunit 50013 "AMC NiceLabel Mgmt."
{
    procedure PrintItemLabel(ItemNo: Code[20]; ItemDescription: Text[100]; PrinterName: Text[100]; Quantity: Integer)
    var
        SalesSetup: Record "Sales & Receivables Setup";
        Client: HttpClient;
        Content: HttpContent;
        HttpHeaders: HttpHeaders;
        ResponseMessage: HttpResponseMessage;
        JsonBody: Text;
        JsonObject: JsonObject;
        ApiUrl: Text;
        ResponseText: Text;
        ResponseErrLbl: Label 'Failed to print label. Response: %1';
        ConnectionErrLbl: Label 'Could not connect to the NiceLabel integration service.';
    begin
        SalesSetup.Get();
        SalesSetup.Testfield("AMC NiceLabel API Url");
        SalesSetup.TestField("AMC NiceLabel Printer Name");
        SalesSetup.TestField("AMC NiceLabel Label Path");

        ApiUrl := SalesSetup."AMC NiceLabel API Url";

        JsonObject.Add('printerName', SalesSetup."AMC NiceLabel Printer Name");
        JsonObject.Add('labelPath', SalesSetup."AMC NiceLabel Label Path");
        JsonObject.Add('copies', Quantity);

        JsonObject.Add('ItemNumber', ItemNo);
        JsonObject.Add('ItemDesc', ItemDescription);

        JsonObject.WriteTo(JsonBody);

        Content.GetHeaders(HttpHeaders);
        HttpHeaders.Clear();
        HttpHeaders.Add('Content-Type', 'application/json');

        if Client.Post(ApiUrl, Content, ResponseMessage) then begin
            ResponseMessage.Content.ReadAs(ResponseText);
            if not ResponseMessage.IsSuccessStatusCode() then
                Error(ResponseErrLbl, ResponseText);
        end else
            Error(ConnectionErrLbl);
    end;
}
