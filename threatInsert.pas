unit threatInsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TthreatInsertForm = class(TForm)
    threatInsertPanel: TPanel;
    logoBevel: TBevel;
    logoImage: TImage;
    Logo_1: TLabel;
    threatIDLabel: TLabel;
    threatInsertLabel_1: TLabel;
    threatIDEdit: TEdit;
    threatIDUpDown: TUpDown;
    threatObjLabel: TLabel;
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
    insertOkBtn: TBitBtn;
    InsertCancelBtn: TBitBtn;
    threatNameEdit: TEdit;
    threatObjEdit: TEdit;
    threatConfCheckBox: TCheckBox;
    threatIntCheckBox: TCheckBox;
    threatAccessCheckBox: TCheckBox;
    procedure threatInCheckBoxClick(Sender: TObject);
    procedure threatOutCheckBoxClick(Sender: TObject);
    procedure InsertCancelBtnClick(Sender: TObject);
    procedure insertOkBtnClick(Sender: TObject);
    procedure threatIDEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  threatInsertForm: TthreatInsertForm;

implementation

uses Main;

{$R *.dfm}

procedure TthreatInsertForm.threatInCheckBoxClick(Sender: TObject);
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

procedure TthreatInsertForm.threatOutCheckBoxClick(Sender: TObject);
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

procedure TthreatInsertForm.InsertCancelBtnClick(Sender: TObject);
begin
  mainForm.threatClientDataSet.Prior;
  Close;
end;

procedure TthreatInsertForm.insertOkBtnClick(Sender: TObject);
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
    threatInsertForm.threatIDUpDown.Position;
  mainForm.threatClientDataSet.Fields[1].AsString :=
    threatInsertForm.threatNameEdit.Text;
  mainForm.threatClientDataSet.Fields[2].AsString :=
    threatInsertForm.threatObjEdit.Text;
  mainForm.threatClientDataSet.Fields[3].AsBoolean :=
    threatInsertForm.threatOutCheckBox.Checked;
  mainForm.threatClientDataSet.Fields[4].AsBoolean :=
    threatInsertForm.threatInCheckBox.Checked;
  mainForm.threatClientDataSet.Fields[5].AsInteger :=
    threatSrcOutLevel;
  mainForm.threatClientDataSet.Fields[6].AsInteger :=
    threatSrcInLevel;
  mainForm.threatClientDataSet.Fields[7].AsBoolean :=
    threatInsertForm.threatConfCheckBox.Checked;
  mainForm.threatClientDataSet.Fields[8].AsBoolean :=
    threatInsertForm.threatIntCheckBox.Checked;
  mainForm.threatClientDataSet.Fields[9].AsBoolean :=
    threatInsertForm.threatAccessCheckBox.Checked;
  mainForm.threatDBNavigator.BtnClick(nbPost);
  mainForm.threatStatusBar.Panels.Items[0].Text :=
    'Всего записей в базе: ' + inttostr(GetLastNumThreadRecord);
  Close;
end;

procedure TthreatInsertForm.threatIDEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  threatIDEdit.ReadOnly := not (key in ['0'..'9', #8]);
end;

end.
