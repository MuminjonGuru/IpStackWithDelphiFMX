unit IPStackDemo.UnitMain;

interface

uses
  System.SysUtils
, System.Types
, System.UITypes
, System.Classes
, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Rtti,
  FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Grid, Data.Bind.DBScope, FMX.Memo.Types, FMX.Memo,
  FMX.StdCtrls, FMX.Edit, System.JSON;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTClient2.ResetToDefaults;
  RESTClient2.Accept := 'application/json';
  RESTClient2.AcceptCharset := 'UTF-8, *;q=0.8';
  RESTClient2.BaseURL := Format('http://api.ipstack.com/%s?access_key=%s', [Edit1.Text, Edit2.Text]);

  RESTRequest2.Execute;

  var JSONValue := TJSONObject.ParseJSONValue(RESTResponse1.Content);
  try
    if JSONValue is TJSONObject then
    begin
      Memo1.Lines.Add('Continent Code: ' + JSONValue.GetValue<String>('continent_code'));
      Memo1.Lines.Add('Country Name: ' + JSONValue.GetValue<String>('country_name'));
      Memo1.Lines.Add('City: ' + JSONValue.GetValue<String>('city'));
      Memo1.Lines.Add('Zip: ' + JSONValue.GetValue<String>('zip'));
    end;
  finally
    JSONValue.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RESTRequest1.Execute;
end;

end.
