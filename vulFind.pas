unit vulFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TvulFindForm = class(TForm)
    logoImage: TImage;
    Logo_1: TLabel;
    logoBevel: TBevel;
    vulFindPanel: TPanel;
    IntegrGroupBox: TGroupBox;
    Bevel2: TBevel;
    vulFindMinIDEdit: TEdit;
    vulFindMaxIDEdit: TEdit;
    minIDUpDown: TUpDown;
    maxIDUpDown: TUpDown;
    vulFindIDRadioButton: TRadioButton;
    vulFindFSTECRadioButton: TRadioButton;
    vulFindDateRadioButton: TRadioButton;
    vulFindSetFilterBtn: TBitBtn;
    Bevel3: TBevel;
    Bevel1: TBevel;
    findCancelBtn: TBitBtn;
    findOkBtn: TBitBtn;
    vulFindDangerLevRadioButton: TRadioButton;
    vulFindMinDate: TDateTimePicker;
    vulIDFSTECEdit: TEdit;
    Bevel4: TBevel;
    vulFindMaxDate: TDateTimePicker;
    vulFindDangerLevComboBox: TComboBox;
    Bevel5: TBevel;
    vulFindClassComboBox: TComboBox;
    vulFindClassRadioButton: TRadioButton;
    procedure vulFindDangerLevComboBoxKeyPress(Sender: TObject;
      var Key: Char);
    procedure vulFindClassComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure findCancelBtnClick(Sender: TObject);
    procedure vulFindIDRadioButtonClick(Sender: TObject);
    procedure vulFindFSTECRadioButtonClick(Sender: TObject);
    procedure vulFindDateRadioButtonClick(Sender: TObject);
    procedure vulFindClassRadioButtonClick(Sender: TObject);
    procedure vulFindDangerLevRadioButtonClick(Sender: TObject);
    procedure findOkBtnClick(Sender: TObject);
    procedure vulFindSetFilterBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vulFindForm: TvulFindForm;

implementation

uses Main, vulFilter;

{$R *.dfm}

procedure TvulFindForm.vulFindDangerLevComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key <> #13 then key := #0;
end;

procedure TvulFindForm.vulFindClassComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key <> #13 then key := #0;
end;

procedure TvulFindForm.findCancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TvulFindForm.vulFindIDRadioButtonClick(Sender: TObject);
begin
  if vulFindIDRadioButton.Checked then
    begin
      vulFindMinIDEdit.Enabled := true;
      vulFindMaxIDEdit.Enabled := true;
      minIDUpDown.Enabled := true;
      maxIDUpDown.Enabled := true;
      vulIDFSTECEdit.Enabled := false;
      vulFindMinDate.Enabled := false;
      vulFindMaxDate.Enabled := false;
      vulFindClassComboBox.Enabled := false;
      vulFindDangerLevComboBox.Enabled := false;
    end;
end;

procedure TvulFindForm.vulFindFSTECRadioButtonClick(Sender: TObject);
begin
  if vulFindFSTECRadioButton.Checked then
    begin
      vulFindMinIDEdit.Enabled := false;
      vulFindMaxIDEdit.Enabled := false;
      minIDUpDown.Enabled := false;
      maxIDUpDown.Enabled := false;
      vulIDFSTECEdit.Enabled := true;
      vulFindMinDate.Enabled := false;
      vulFindMaxDate.Enabled := false;
      vulFindClassComboBox.Enabled := false;
      vulFindDangerLevComboBox.Enabled := false;
    end;
end;

procedure TvulFindForm.vulFindDateRadioButtonClick(Sender: TObject);
begin
  if vulFindDateRadioButton.Checked then
    begin
      vulFindMinIDEdit.Enabled := false;
      vulFindMaxIDEdit.Enabled := false;
      minIDUpDown.Enabled := false;
      maxIDUpDown.Enabled := false;
      vulIDFSTECEdit.Enabled := false;
      vulFindMinDate.Enabled := true;
      vulFindMaxDate.Enabled := true;
      vulFindClassComboBox.Enabled := false;
      vulFindDangerLevComboBox.Enabled := false;
    end;
end;

procedure TvulFindForm.vulFindClassRadioButtonClick(Sender: TObject);
begin
  if vulFindClassRadioButton.Checked then
    begin
      vulFindMinIDEdit.Enabled := false;
      vulFindMaxIDEdit.Enabled := false;
      minIDUpDown.Enabled := false;
      maxIDUpDown.Enabled := false;
      vulIDFSTECEdit.Enabled := false;
      vulFindMinDate.Enabled := false;
      vulFindMaxDate.Enabled := false;
      vulFindClassComboBox.Enabled := true;
      vulFindDangerLevComboBox.Enabled := false;
    end;
end;

procedure TvulFindForm.vulFindDangerLevRadioButtonClick(Sender: TObject);
begin
  if vulFindDangerLevRadioButton.Checked then
    begin
      vulFindMinIDEdit.Enabled := false;
      vulFindMaxIDEdit.Enabled := false;
      minIDUpDown.Enabled := false;
      maxIDUpDown.Enabled := false;
      vulIDFSTECEdit.Enabled := false;
      vulFindMinDate.Enabled := false;
      vulFindMaxDate.Enabled := false;
      vulFindClassComboBox.Enabled := false;
      vulFindDangerLevComboBox.Enabled := true;
    end;
end;

procedure TvulFindForm.findOkBtnClick(Sender: TObject);
var
  vulFindFilterString : string;
begin
  vulFindFilterString := '';
  if vulFindFSTECRadioButton.Checked then
    vulFindFilterString := '[������������� �����] LIKE ' +
      QuotedStr(vulIDFSTECEdit.Text);
  if vulFindClassRadioButton.Checked then
    vulFindFilterString := '[�����] LIKE ' +
      QuotedStr(vulFindClassComboBox.Text);
  if vulFindIDRadioButton.Checked then
    if minIDUpDown.Position > maxIDUpDown.Position then
      begin
        MessageBox(0,'������� ������ �������� ���������������',
                   'T&V DataBase', MB_OK or MB_ICONERROR);
        exit;
      end
    else
      vulFindFilterString := '[�������������] >= ' +
                                 vulFindMinIDEdit.Text +
                                ' and [�������������] <= ' +
                                 vulFindMaxIDEdit.Text;
  if vulFindDateRadioButton.Checked then
    if vulFindMinDate.Date > vulFindMaxDate.Date then
      begin
        MessageBox(0,'������� ������ �������� ���',
                   'T&V DataBase', MB_OK or MB_ICONERROR);
        exit;
      end
    else
      vulFindFilterString := '[���� ���������] >= ' +
                                 QuotedStr(datetostr(vulFindMinDate.DateTime)) +
                                ' and [���� ���������] <= ' +
                                 QuotedStr(datetostr(vulFindMaxDate.DateTime));
  if vulFindDangerLevRadioButton.Checked then
    case vulFindDangerLevComboBox.ItemIndex of
      0 : vulFindFilterString := '[������� CVSS] > 0 and [������� CVSS] < 4';
      1 : vulFindFilterString := '[������� CVSS] >= 4 and [������� CVSS] < 7';
      2 : vulFindFilterString := '[������� CVSS] >= 7 and [������� CVSS] < 9';
      3 : vulFindFilterString := '[������� CVSS] >= 9 and [������� CVSS] <= 10';
    end;

  mainForm.vulClientDataSet.Filter := vulFindFilterString;
  mainForm.vulStatusBar.Panels.Items[1].Text := '������� �������: ' +
    inttostr(GetLastNumVulRecord);
  if GetLastNumVulRecord = 0 then
    begin
      mainForm.vulClientDataSet.Filter := '';
      mainForm.vulStatusBar.Panels.Items[1].Text := '';
      MessageBox(0,'������ �� �������',
                   'T&V DataBase', MB_OK or MB_ICONINFORMATION);
    end
  else
    Close;
end;

procedure TvulFindForm.vulFindSetFilterBtnClick(Sender: TObject);
begin
  vulFiltreForm.ShowModal;
end;

end.
