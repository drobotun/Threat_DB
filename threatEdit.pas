unit threatEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, ComCtrls;

type
  TthreatEditForm = class(TForm)
    logoBevel: TBevel;
    logoImage: TImage;
    Logo_1: TLabel;
    editCancelBtn: TBitBtn;
    editOkBtn: TBitBtn;
    threatEditPanel: TPanel;
    threatIDLabel: TLabel;
    threatNameLabel: TLabel;
    threatObjLabel: TLabel;
    threatIDEdit: TEdit;
    threatIDUpDown: TUpDown;
    GroupBox: TGroupBox;
    threatInCheckBox: TCheckBox;
    Panel1: TPanel;
    inHightRadioButton: TRadioButton;
    inMidRadioButton: TRadioButton;
    inLowRadioButton: TRadioButton;
    Panel2: TPanel;
    outHightRadioButton: TRadioButton;
    outMidRadioButton: TRadioButton;
    OutLowRadioButton: TRadioButton;
    threatOutCheckBox: TCheckBox;
    IntegrGroupBox: TGroupBox;
    threatConfCheckBox: TCheckBox;
    threatIntCheckBox: TCheckBox;
    threatAccessCheckBox: TCheckBox;
    threatNameEdit: TEdit;
    threatObjEdit: TEdit;
    procedure editCancelBtnClick(Sender: TObject);
    procedure editOkBtnClick(Sender: TObject);
    procedure threatInCheckBoxClick(Sender: TObject);
    procedure threatOutCheckBoxClick(Sender: TObject);
    procedure threatIDEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  threatEditForm: TthreatEditForm;

implementation

uses Main;

{$R *.dfm}

procedure TthreatEditForm.editCancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TthreatEditForm.editOkBtnClick(Sender: TObject);
var
  threatSrcInLevel,
  threatSrcOutLevel : integer;
begin
  threatSrcOutLevel := 0;
  threatSrcInLevel := 0;
  if threatOutCheckBox.Checked then
    begin
      if outHightRadioButton.Checked then
        threatSrcOutLevel := 3;
      if outMidRadioButton.Checked then
        threatSrcOutLevel := 2;
      if outLowRadioButton.Checked then
        threatSrcOutLevel := 1;
    end;
  if threatInCheckBox.Checked then
    begin
      if inHightRadioButton.Checked then
        threatSrcInLevel := 3;
      if inMidRadioButton.Checked then
        threatSrcInLevel := 2;
      if inLowRadioButton.Checked then
        threatSrcInLevel := 1;
    end;
  mainForm.threatClientDataSet.Fields[0].AsInteger :=
    threatEditForm.threatIDUpDown.Position;
  mainForm.threatClientDataSet.Fields[1].AsString :=
    threatEditForm.threatNameEdit.Text;
  mainForm.threatClientDataSet.Fields[2].AsString :=
    threatEditForm.threatObjEdit.Text;
  mainForm.threatClientDataSet.Fields[3].AsBoolean :=
    threatEditForm.threatOutCheckBox.Checked;
  mainForm.threatClientDataSet.Fields[4].AsBoolean :=
    threatEditForm.threatInCheckBox.Checked;
  mainForm.threatClientDataSet.Fields[5].AsInteger :=
    threatSrcOutLevel;
  mainForm.threatClientDataSet.Fields[6].AsInteger :=
    threatSrcInLevel;
  mainForm.threatClientDataSet.Fields[7].AsBoolean :=
    threatEditForm.threatConfCheckBox.Checked;
  mainForm.threatClientDataSet.Fields[8].AsBoolean :=
    threatEditForm.threatIntCheckBox.Checked;
  mainForm.threatClientDataSet.Fields[9].AsBoolean :=
    threatEditForm.threatAccessCheckBox.Checked;
  mainForm.threatDBNavigator.BtnClick(nbPost);
  mainForm.threatStatusBar.Panels.Items[0].Text :=
    'Всего записей в базе: ' + inttostr(GetLastNumThreadRecord);
  Close;
end;

procedure TthreatEditForm.threatInCheckBoxClick(Sender: TObject);
begin
  if threatInCheckBox.Checked then
    begin
      InHightRadioButton.Enabled := true;
      InMidRadioButton.Enabled := true;
      InLowRadioButton.Enabled := true;
    end
  else
    begin
      InHightRadioButton.Enabled := false;
      InMidRadioButton.Enabled := false;
      InLowRadioButton.Enabled := false;
    end
end;

procedure TthreatEditForm.threatOutCheckBoxClick(Sender: TObject);
begin
  if threatOutCheckBox.Checked then
    begin
      OutHightRadioButton.Enabled := true;
      OutMidRadioButton.Enabled := true;
      OutLowRadioButton.Enabled := true;
    end
  else
    begin
      OutHightRadioButton.Enabled := false;
      OutMidRadioButton.Enabled := false;
      OutLowRadioButton.Enabled := false;
    end;
end;

procedure TthreatEditForm.threatIDEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  threatIDEdit.ReadOnly := not (key in ['0'..'9', #8]);
end;

end.
