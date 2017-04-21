unit vulEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls;

type
  TvulEditForm = class(TForm)
    logoImage: TImage;
    logoBevel: TBevel;
    vulEditPanel: TPanel;
    vulIDLabel: TLabel;
    vulNameLabel: TLabel;
    tvulIDFSTECLabel: TLabel;
    vulDateLabel: TLabel;
    vulOtherIDLabel: TLabel;
    vulSoftLabel: TLabel;
    vulURLLabel: TLabel;
    vulVerLabel: TLabel;
    vulClassLabel: TLabel;
    vulOSLabel: TLabel;
    vulCVSSLabel: TLabel;
    vulCVSSLevLabel: TLabel;
    vulIDEdit: TEdit;
    vulIDUpDown: TUpDown;
    vulNameEdit: TEdit;
    vulIDFSTECEdit: TEdit;
    vulDate: TDateTimePicker;
    vulOtherIDEdit: TEdit;
    vulSoftEdit: TEdit;
    vulURLEdit: TEdit;
    vulVerEdit: TEdit;
    vulClassComboBox: TComboBox;
    vulOSEdit: TEdit;
    vulCVSSEdit: TEdit;
    vulCVSSLevEdit: TEdit;
    editCancelBtn: TBitBtn;
    editOkBtn: TBitBtn;
    Logo_1: TLabel;
    Logo_2: TLabel;
    procedure editCancelBtnClick(Sender: TObject);
    procedure editOkBtnClick(Sender: TObject);
    procedure vulCVSSLevEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vulEditForm: TvulEditForm;

implementation

uses vulInsert, Main;

{$R *.dfm}

procedure TvulEditForm.editCancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TvulEditForm.editOkBtnClick(Sender: TObject);
begin
  if vulEditForm.vulCVSSLevEdit.Text = '' then
    vulEditForm.vulCVSSLevEdit.Text := '0';
  mainForm.vulClientDataSet.Fields[0].AsInteger :=
    vulEditForm.vulIDUpDown.Position;
  mainForm.vulClientDataSet.Fields[1].AsString :=
    vulEditForm.vulNameEdit.Text;
  mainForm.vulClientDataSet.Fields[2].AsString :=
    vulEditForm.vulIDFSTECEdit.Text;
  mainForm.vulClientDataSet.Fields[3].AsDateTime :=
    vulEditForm.vulDate.DateTime;
  mainForm.vulClientDataSet.Fields[4].AsString :=
    vulEditForm.vulOtherIDEdit.Text;
  mainForm.vulClientDataSet.Fields[5].AsString :=
    vulEditForm.vulSoftEdit.Text;
  mainForm.vulClientDataSet.Fields[6].AsString :=
    vulEditForm.vulVerEdit.Text;
  mainForm.vulClientDataSet.Fields[7].AsString :=
    vulEditForm.vulClassComboBox.Text;
  mainForm.vulClientDataSet.Fields[8].AsString :=
    vulEditForm.vulOSEdit.Text;
  mainForm.vulClientDataSet.Fields[9].AsString :=
    vulEditForm.vulCVSSEdit.Text;
  mainForm.vulClientDataSet.Fields[10].AsFloat :=
    strtofloat(vulEditForm.vulCVSSLevEdit.Text);
  mainForm.vulClientDataSet.Fields[11].AsString :=
    vulEditForm.vulURLEdit.Text;
  if strtofloat(vulEditForm.vulCVSSLevEdit.Text) > 10 then
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

procedure TvulEditForm.vulCVSSLevEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  vulCVSSLevEdit.ReadOnly := not(key in ['0'..'9', ',',#8]);
end;

end.
