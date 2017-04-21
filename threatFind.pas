unit threatFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TthreatFindForm = class(TForm)
    logoImage: TImage;
    logoBevel: TBevel;
    findCancelBtn: TBitBtn;
    findOkBtn: TBitBtn;
    Logo_1: TLabel;
    threatFindPanel: TPanel;
    IntegrGroupBox: TGroupBox;
    threatFindMinIDEdit: TEdit;
    threatFindMaxIDEdit: TEdit;
    minIDUpDown: TUpDown;
    maxIDUpDown: TUpDown;
    threatFindConfCheckBox: TCheckBox;
    threatFindIntCheckBox: TCheckBox;
    threatFindAccessCheckBox: TCheckBox;
    threatFindIDRadioButton: TRadioButton;
    threatFindOutCheckBox: TCheckBox;
    threatFindInCheckBox: TCheckBox;
    threatFindConsRadioButton: TRadioButton;
    threatFindSrcRadioButton: TRadioButton;
    Bevel2: TBevel;
    threatFindSetFilterBtn: TBitBtn;
    Bevel3: TBevel;
    Bevel1: TBevel;
    procedure findCancelBtnClick(Sender: TObject);
    procedure findOkBtnClick(Sender: TObject);
    procedure threatFindMinIDEditKeyPress(Sender: TObject; var Key: Char);
    procedure threatFindMaxIDEditKeyPress(Sender: TObject; var Key: Char);
    procedure threatFindIDRadioButtonClick(Sender: TObject);
    procedure threatFindSrcRadioButtonClick(Sender: TObject);
    procedure threatFindConsRadioButtonClick(Sender: TObject);
    procedure threatFindSetFilterBtnClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  threatFindForm: TthreatFindForm;

implementation

uses Main, threatFilter;

{$R *.dfm}

procedure TthreatFindForm.findCancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TthreatFindForm.findOkBtnClick(Sender: TObject);
var
  threatFindFilterString : string;
begin
  threatFindFilterString := '';
  if (threatFindConfCheckBox.Checked and
     (not threatFindIntCheckBox.Checked) and
     (not threatFindAccessCheckBox.Checked)) then
    threatFindFilterString := '[Нарушение конфиденциальности] = true and ' +
                              '[Нарушение целостности] = false and ' +
                              '[Нарушение доступности] = false';
  if (threatFindConfCheckBox.Checked and
      threatFindIntCheckBox.Checked and
     (not threatFindAccessCheckBox.Checked)) then
    threatFindFilterString := '[Нарушение конфиденциальности] = true and ' +
                              '[Нарушение целостности] = true and ' +
                              '[Нарушение доступности] = false';
  if (threatFindConfCheckBox.Checked and
     (not threatFindIntCheckBox.Checked) and
      threatFindAccessCheckBox.Checked) then
    threatFindFilterString := '[Нарушение конфиденциальности] = true and ' +
                              '[Нарушение целостности] = false and ' +
                              '[Нарушение доступности] = true';
  if (threatFindConfCheckBox.Checked and
      threatFindIntCheckBox.Checked and
      threatFindAccessCheckBox.Checked) then
    threatFindFilterString := '[Нарушение конфиденциальности] = true and ' +
                              '[Нарушение целостности] = true and ' +
                              '[Нарушение доступности] = true';
  if ((not threatFindConfCheckBox.Checked) and
       threatFindIntCheckBox.Checked and
     (not threatFindAccessCheckBox.Checked)) then
    threatFindFilterString := '[Нарушение конфиденциальности] = false and ' +
                              '[Нарушение целостности] = true and ' +
                              '[Нарушение доступности] = false';
  if ((not threatFindConfCheckBox.Checked) and
       threatFindIntCheckBox.Checked and
       threatFindAccessCheckBox.Checked) then
    threatFindFilterString := '[Нарушение конфиденциальности] = false and ' +
                              '[Нарушение целостности] = true and ' +
                              '[Нарушение доступности] = true';
  if ((not threatFindConfCheckBox.Checked) and
        (not threatFindIntCheckBox.Checked) and
         threatFindAccessCheckBox.Checked) then
    threatFindFilterString := '[Нарушение конфиденциальности] = false and ' +
                              '[Нарушение целостности] = false and ' +
                              '[Нарушение доступности] = true';
  if (threatFindInCheckBox.Checked and
     (not threatFindOutCheckBox.Checked)) then
    threatFindFilterString := '[Внутренний нарушитель] = true and ' +
                              '[Внешний нарушитель] = false';
  if (threatFindOutCheckBox.Checked and
     (not threatFindInCheckBox.Checked)) then
    threatFindFilterString := '[Внутренний нарушитель] = false and ' +
                              '[Внешний нарушитель] = true';
  if (threatFindInCheckBox.Checked and
        threatFindOutCheckBox.Checked) then
    threatFindFilterString := '[Внутренний нарушитель] = true and ' +
                              '[Внешний нарушитель] = true';
  if threatFindIDRadioButton.Checked then
    if minIDUpDown.Position > maxIDUpDown.Position then
      begin
        MessageBox(0,'Неверно выбран диапазон идентификаторов',
                   'T&V DataBase', MB_OK or MB_ICONERROR);
        exit;
      end
    else
      threatFindFilterString := '[Идентификатор] >= ' +
                                 threatFindMinIDEdit.Text +
                                ' and [Идентификатор] <= ' +
                                 threatFindMaxIDEdit.Text;

  mainForm.threatClientDataSet.Filter := threatFindFilterString;
  mainForm.threatStatusBar.Panels.Items[1].Text := 'Найдено записей: ' +
    inttostr(GetLastNumThreadRecord);
  if GetLastNumThreadRecord = 0 then
    begin
      mainForm.threatClientDataSet.Filter := '';
      mainForm.threatStatusBar.Panels.Items[1].Text := '';
      MessageBox(0,'Ничего не найдено',
                   'T&V DataBase', MB_OK or MB_ICONINFORMATION);
    end
  else
    Close;
end;

procedure TthreatFindForm.threatFindMinIDEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  threatFindMinIDEdit.ReadOnly := not (key in ['0'..'9', #8]);
end;

procedure TthreatFindForm.threatFindMaxIDEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  threatFindMaxIDEdit.ReadOnly := not (key in ['0'..'9', #8]);
end;

procedure TthreatFindForm.threatFindIDRadioButtonClick(Sender: TObject);
begin
  if threatFindIDRadioButton.Checked then
    begin
      threatFindMinIDEdit.Enabled := true;
      threatFindMaxIDedit.Enabled := true;
      minIDUpDown.Enabled := true;
      maxIDUpDown.Enabled := true;
      threatFindConfCheckBox.Enabled := false;
      threatFindIntCheckBox.Enabled := false;
      threatFindAccessCheckBox.Enabled := false;
      threatFindOutCheckBox.Enabled := false;
      threatFindInCheckBox.Enabled := false;
    end;
end;

procedure TthreatFindForm.threatFindSrcRadioButtonClick(Sender: TObject);
begin
  if threatFindSrcRadioButton.Checked then
    begin
      threatFindMinIDEdit.Enabled := false;
      threatFindMaxIDedit.Enabled := false;
      minIDUpDown.Enabled := false;
      maxIDUpDown.Enabled := false;
      threatFindConfCheckBox.Enabled := false;
      threatFindIntCheckBox.Enabled := false;
      threatFindAccessCheckBox.Enabled := false;
      threatFindOutCheckBox.Enabled := true;
      threatFindInCheckBox.Enabled := true;
    end;
end;

procedure TthreatFindForm.threatFindConsRadioButtonClick(Sender: TObject);
begin
  if threatFindConsRadioButton.Checked then
    begin
      threatFindMinIDEdit.Enabled := false;
      threatFindMaxIDedit.Enabled := false;
      minIDUpDown.Enabled := false;
      maxIDUpDown.Enabled := false;
      threatFindConfCheckBox.Enabled := true;
      threatFindIntCheckBox.Enabled := true;
      threatFindAccessCheckBox.Enabled := true;
      threatFindOutCheckBox.Enabled := false;
      threatFindInCheckBox.Enabled := false;
    end;
end;

procedure TthreatFindForm.threatFindSetFilterBtnClick(Sender: TObject);
begin
  threatFiltreForm.ShowModal;
end;

end.
