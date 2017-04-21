unit vulFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TvulFiltreForm = class(TForm)
    vulFiltrePanel: TPanel;
    vulFiltreLabel: TLabel;
    vulFilterMemo: TMemo;
    logoImage: TImage;
    logoBevel: TBevel;
    Logo_1: TLabel;
    filterOkBtn: TBitBtn;
    filterCancelBtn: TBitBtn;
    procedure filterOkBtnClick(Sender: TObject);
    procedure filterCancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vulFiltreForm: TvulFiltreForm;

implementation

uses Main, vulFind;

{$R *.dfm}

procedure TvulFiltreForm.filterOkBtnClick(Sender: TObject);
begin
  try
    mainForm.vulClientDataSet.Filter := vulFilterMemo.Text;
    mainForm.vulStatusBar.Panels.Items[1].Text := 'Найдено записей: ' +
    inttostr(GetLastNumVulRecord);
    if GetLastNumVulRecord = 0 then
      begin
        mainForm.vulClientDataSet.Filter := '';
        mainForm.vulStatusBar.Panels.Items[1].Text := '';
        MessageBox(0,'Ничего не найдено',
                     'T&V DataBase', MB_OK or MB_ICONINFORMATION);
      end
    else
      begin
        vulFindForm.Close;
        mainForm.vulClientDataSet.FilterOptions := [];
        Close;
      end;
  except
    MessageBox(0,'Неправильный ввод фильтра поиска',
      'T&V DataBase', MB_OK or MB_ICONERROR);
  end;
end;

procedure TvulFiltreForm.filterCancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.
