unit threatInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TthreatInfoForm = class(TForm)
    logoBevel: TBevel;
    logoImage: TImage;
    Logo_1: TLabel;
    threatInfoPanel: TPanel;
    threatIDLabel: TLabel;
    threatInsertLabel_1: TLabel;
    threatObjLabel: TLabel;
    IntegrGroupBox1: TGroupBox;
    ConfDBCheckBox: TDBCheckBox;
    IntegrDBCheckBox: TDBCheckBox;
    AccessDBCheckBox: TDBCheckBox;
    threatNameDBMemo: TDBMemo;
    threatIDDBEdit: TDBEdit;
    threatObjDBMemo: TDBMemo;
    threatSrcLabel: TLabel;
    infoOkBtn: TBitBtn;
    threatSrcInfoMemo: TMemo;
    procedure infoOkBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  threatInfoForm: TthreatInfoForm;

  //var
  threatSrcString : string;

implementation

uses Main;

{$R *.dfm}

procedure TthreatInfoForm.infoOkBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TthreatInfoForm.FormShow(Sender: TObject);
begin
  threatSrcString := '';
  if mainForm.threatClientDataSet.Fields[3].AsBoolean then
    begin
      threatSrcString := threatSrcString + 'Внешний нарушитель ';
      if mainForm.threatClientDataSet.Fields[5].AsInteger = 3 then
        threatSrcString := threatSrcString + 'с высоким потенциалом. ';
      if mainForm.threatClientDataSet.Fields[5].AsInteger = 2 then
        threatSrcString := threatSrcString + 'со средним потенциалом. ';
      if mainForm.threatClientDataSet.Fields[5].AsInteger = 1 then
        threatSrcString := threatSrcString + 'с низким потенциалом. ';
    end;
  if mainForm.threatClientDataSet.Fields[4].AsBoolean then
    begin
      threatSrcString := threatSrcString + 'Внутренний нарушитель ';
      if mainForm.threatClientDataSet.Fields[6].AsInteger = 3 then
        threatSrcString := threatSrcString + 'с высоким потенциалом.';
      if mainForm.threatClientDataSet.Fields[6].AsInteger = 2 then
        threatSrcString := threatSrcString + 'со средним потенциалом.';
      if mainForm.threatClientDataSet.Fields[6].AsInteger = 1 then
        threatSrcString := threatSrcString + 'с низким потенциалом.';
    end;
  threatInfoForm.threatSrcInfoMemo.Clear;
  threatInfoForm.threatSrcInfoMemo.Lines[0] := threatSrcString;
end;

end.
