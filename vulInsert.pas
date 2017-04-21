unit vulInsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TvulInsertForm = class(TForm)
    logoImage: TImage;
    Logo_1: TLabel;
    logoBevel: TBevel;
    insertCancelBtn: TBitBtn;
    insertOkBtn: TBitBtn;
    Logo_2: TLabel;
    vulInsertPanel: TPanel;
    vulIDLabel: TLabel;
    vulNameLabel: TLabel;
    tvulIDFSTECLabel: TLabel;
    vulIDEdit: TEdit;
    vulIDUpDown: TUpDown;
    vulNameEdit: TEdit;
    vulIDFSTECEdit: TEdit;
    vulDateLabel: TLabel;
    vulDate: TDateTimePicker;
    vulOtherIDLabel: TLabel;
    vulOtherIDEdit: TEdit;
    vulSoftLabel: TLabel;
    vulSoftEdit: TEdit;
    vulURLEdit: TEdit;
    vulURLLabel: TLabel;
    vulVerLabel: TLabel;
    vulVerEdit: TEdit;
    vulClassLabel: TLabel;
    vulClassComboBox: TComboBox;
    vulOSEdit: TEdit;
    vulOSLabel: TLabel;
    vulCVSSLabel: TLabel;
    vulCVSSEdit: TEdit;
    vulCVSSLevEdit: TEdit;
    vulCVSSLevLabel: TLabel;
    procedure vulIDEditKeyPress(Sender: TObject; var Key: Char);
    procedure insertCancelBtnClick(Sender: TObject);
    procedure insertOkBtnClick(Sender: TObject);
    procedure vulClassComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure vulCVSSLevEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vulInsertForm: TvulInsertForm;

implementation

uses Main;

{$R *.dfm}

procedure TvulInsertForm.vulIDEditKeyPress(Sender: TObject; var Key: Char);
begin
  vulIDedit.ReadOnly := not(key in ['0'..'9', #8]);
end;

procedure TvulInsertForm.insertCancelBtnClick(Sender: TObject);
begin
  mainForm.vulClientDataSet.Prior;
  Close;
end;

procedure TvulInsertForm.insertOkBtnClick(Sender: TObject);
begin
  if vulInsertForm.vulCVSSLevEdit.Text = '' then
    vulInsertForm.vulCVSSLevEdit.Text := '0';
  mainForm.vulClientDataSet.Fields[0].AsInteger :=
    vulInsertForm.vulIDUpDown.Position;
  mainForm.vulClientDataSet.Fields[1].AsString :=
    vulInsertForm.vulNameEdit.Text;
  mainForm.vulClientDataSet.Fields[2].AsString :=
    vulInsertForm.vulIDFSTECEdit.Text;
  mainForm.vulClientDataSet.Fields[3].AsDateTime :=
    vulInsertForm.vulDate.DateTime;
  mainForm.vulClientDataSet.Fields[4].AsString :=
    vulInsertForm.vulOtherIDEdit.Text;
  mainForm.vulClientDataSet.Fields[5].AsString :=
    vulInsertForm.vulSoftEdit.Text;
  mainForm.vulClientDataSet.Fields[6].AsString :=
    vulInsertForm.vulVerEdit.Text;
  mainForm.vulClientDataSet.Fields[7].AsString :=
    vulInsertForm.vulClassComboBox.Text;
  mainForm.vulClientDataSet.Fields[8].AsString :=
    vulInsertForm.vulOSEdit.Text;
  mainForm.vulClientDataSet.Fields[9].AsString :=
    vulInsertForm.vulCVSSEdit.Text;
  mainForm.vulClientDataSet.Fields[10].AsFloat :=
    strtofloat(vulInsertForm.vulCVSSLevEdit.Text);
  mainForm.vulClientDataSet.Fields[11].AsString :=
    vulInsertForm.vulURLEdit.Text;
  if strtofloat(vulInsertForm.vulCVSSLevEdit.Text) > 10 then
    MessageBox(0,'Неверное значение базового уровня CVSS',
      'T&V DataBase', MB_OK or MB_ICONERROR)
  else
    begin
      mainForm.vulDBNavigator.BtnClick(nbPost);
      mainForm.vulStatusBar.Panels.Items[0].Text :=
        'Всего записей в базе: ' + inttostr(GetLastNumVulRecord);
      Close;
    end;
end;

procedure TvulInsertForm.vulClassComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key <> #13 then key := #0;
end;

procedure TvulInsertForm.vulCVSSLevEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  vulCVSSLevEdit.ReadOnly := not(key in ['0'..'9', ',',#8]);
end;

end.
